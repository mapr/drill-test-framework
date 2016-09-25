#!/usr/bin/python

import pyodbc
import datetime
import os
import sys
import fnmatch
import json
import re
import glob
import subprocess
import decimal
from types import *

# Java SQL data types
ARRAY = 2003
BIGINT = -5
BINARY = -2
BIT = -7
BLOB = 2004
BOOLEAN = 16
CHAR = 1
CLOB = 2005
DATALINK = 70
DATE = 91
DECIMAL = 3
DISTINCT = 2001
DOUBLE = 8
FLOAT = 6
INTEGER = 4
JAVA_OBJECT = 2000
LONGNVARCHAR = -16
LONGVARBINARY = -4
LONGVARCHAR = -1
NCHAR = -15
NCLOB = 2011
NULL = 0
NUMERIC = 2
NVARCHAR = -9
OTHER = 1111
REAL = 7
REF = 2006
ROWID = -8
SMALLINT = 5
SQLXML = 2009
STRUCT = 2002
TIME = 92
TIMESTAMP = 93
TINYINT = -6
VARBINARY = -3
VARCHAR = 12
NONETYPE = -100

def ParseJSONFile(json_file):
    with open(json_file, 'r') as json_data:
       parse_json = json.load(json_data)

    # extract query file extension from JSON file
    queryFile = parse_json["matrices"][0]["query-file"]
    queryFileRegex = re.compile("\.\*(.*)")
    queryFileRegexSearch = queryFileRegex.search(queryFile)
    queryFileExt = ""
    if queryFileRegexSearch:
       queryFileExt = queryFileRegexSearch.group(1)

    # extract expected file extension from JSON file
    expectedFile = parse_json["matrices"][0]["expected-file"]
    expectedFileRegex = re.compile("\.\*(.*)")
    expectedFileRegexSearch = expectedFileRegex.search(expectedFile)
    expectedFileExt = ""
    if expectedFileRegexSearch:
       expectedFileExt = expectedFileRegexSearch.group(1)

    # extract schema from JSON file.  convert from unicode
    # to utf-8
    schema_string = parse_json["matrices"][0]["schema"]
    schema = schema_string.encode('utf-8')

    try:
       outputFile = parse_json["matrices"][0]["output-file"]
       outputFileRegex = re.compile("\.\*(.*)")
       outputFileExt = outputFileRegex.search(outputFile).group(1)
    except KeyError:
       outputFileExt = ".o"

    return (queryFile, queryFileExt, expectedFile, expectedFileExt, schema,
            outputFileExt)

def SaveData (rows, queryDir, queryFileName, outputFileExt, resultFileCreated):
  # create "type" file that contains the data types of each column
  typeFile = "%s/%s%s" % (queryDir, queryFileName, ".type")
  typeFile = open (typeFile, 'w')
  # creat "label" file that contains the column names
  columnFile = "%s/%s%s" % (queryDir, queryFileName, ".label")
  columnFile = open (columnFile, 'w')
  # create some dummy classes for "special" data types
  newdecimal = type(decimal.Decimal(0))
  newdate = type(datetime.date(1,2,3))
  newtimestamp = type(datetime.datetime(1,2,3))
  newtime = type(datetime.time(1,2,3))

  # determine the column names and data types returned by this query
  # and store in "type" file and "label" file
  dataType = []
  for column in cursor.description:
    getTypeArray = {
       LongType: BIGINT,
       BooleanType: BOOLEAN,
       newdate: DATE,
       newdecimal: DECIMAL,
       FloatType: FLOAT,
       IntType: INTEGER,
       newtime: TIME,
       newtimestamp: TIMESTAMP,
       BufferType: VARBINARY,
       StringType: VARCHAR
    }
    getType = getTypeArray.get(column[1], NONETYPE)
    if getType == NONETYPE:
      if column[1] == pyodbc.DATETIME:
        getType = TIMESTAMP
      else:
        sys.exit()
    dataType.append(getType);
    typeFile.write("%s\n" % getType);
    columnFile.write("%s\n" % column[0]);
  typeFile.close()
  columnFile.close()

  # open output file.  by default, the output file is created in the same
  # directory as the query file.  It can also be created in a separate
  # directory.
  if outputFileGiven:
    outputFile = outputFileArg;
  elif resultFileCreated:
    outputFile = "%s/%s%s" % (resultDir, queryFileName, outputFileExt)
  else:
    outputFile = "%s/%s%s" % (queryDir, queryFileName, outputFileExt)
  outputFileH = open (outputFile, 'w')

  # evaluate each row that is returned
  for row in rows:
    # add null values by converting None values to null values
    for index, value in enumerate(row):
       if value == None:
         row[index] = "null"

    # Convert tuple containing row fields into a single string delimited by tabs.
    # For some data types, Simba ODBC driver returns data that is not completely
    # the same as what the Drill Apache driver returns.  Modify the data
    # from Simba to match what Drill Apache provides, so that the data matches
    # the contents of the expected results files.
    convertToString = ""
    for index, field in enumerate(row):
      fieldString = str(field)
      if dataType[index] == BOOLEAN:
        if fieldString == "True":
          field = "true"
        elif fieldString == "False":
          field = "false"
      if dataType[index] == TIME and fieldString != "null":
        # strip off microseconds.  Drill only has milliseconds
        if field.microsecond > 0:
          fieldString = fieldString.rstrip('0123456789')
          fieldString = "%s%s" % (fieldString,field.microsecond)
        field = fieldString
      if dataType[index] == TIMESTAMP and fieldString != "null":
        # strip off microseconds.  Drill only has milliseconds
        try:
          data = datetime.datetime.strptime(fieldString, "%Y-%m-%d %H:%M:%S.%f")
          if data.microsecond > 0:
            fieldString = fieldString.rstrip('0')
        except:
          data = datetime.datetime.strptime(fieldString, "%Y-%m-%d %H:%M:%S")
          fieldString = fieldString + ".0"
        field = fieldString
      if dataType[index] == VARCHAR and len(fieldString) > 0 and fieldString[0] in ('{','['):
        # for varchars that begin with curly braces or square brackets, remove
        # spaces and newlines unless they are in a string with double quotes
        newFields = []
        inQuotes = False
        start = 0
        stringLength = len(fieldString)
        for current, character in enumerate(fieldString):
          if character == "\"":
            inQuotes = not(inQuotes)
          atLastChar = (current == stringLength-1);
          if atLastChar == True:
            newFields.append(fieldString[start:])
          elif ((character == ' ') or (character == '\n')) and not(inQuotes):
            newFields.append(fieldString[start:current])
            start = current + 1
        field = "".join(newFields)
      # add field to convertToString
      if convertToString:
        convertToString = convertToString + "\t" + str(field)
      else:
        convertToString = str(field)

    # Save row to output file.  It should match expected results files.
    outputFileH.write("%s\n" % convertToString)

  outputFileH.close()

def ExecuteQuery(queryDir, queryFile, outputFileExt, resultFileCreated):
  queryFileNameRegex = re.compile("(.*)\.(.*)$")
  queryFileName = queryFileNameRegex.search(queryFile).group(1)

  queryStrings = subprocess.Popen("cat %s/%s" % (queryDir, queryFile), shell=True, stdout=subprocess.PIPE).stdout.read()

  # if there are multiple SQL statements, there is only one main SQL query.
  # the first few are used to setup the main query.
  # the last few are used to restore the state of the system after the query is run.
  # If a query starts with "--@test", it is considered the main SQL query.
  # Otherwise, the number of statements before and after the main SQL query is the same.
  # thus we expect an odd number of SQL statements.
  if queryStrings.count(';') > 1:
    # find the main query
    numberStatements = queryStrings.count(';')
    statements = queryStrings.split(';')
    mainStatementIndex = -1
    for index,statement in enumerate(statements):
      statement = statement.lstrip()
      if statement.startswith("--@test"):
        mainStatementIndex = index
        break
    if mainStatementIndex == -1:
      mainStatementIndex = numberStatements / 2

    # execute the setup statements
    for index in range(0,mainStatementIndex):
      queryString = statements[index]
      queryString = queryString.rstrip('\n;')
      try:
        value = cursor.execute(queryString)
      except:
        print "ERROR - generic execute error for setup statements"
    mainStatement = statements[mainStatementIndex]
    multipleStatements = True
  else:
    mainStatement = queryStrings
    multipleStatements = False

  queryString = mainStatement.rstrip(';\n\r\t ')

  try:
    value = cursor.execute(queryString)
  except Exception as inst:
    print "ERROR - generic execute error for main statement: %s" % inst
    failedTests.append(queryFile)

  rows = cursor.fetchall()
  SaveData (rows, queryDir, queryFileName, outputFileExt, resultFileCreated)

  # if there are statements after the main statement, execute them
  # to restore the system
  if multipleStatements:
    for index in range(mainStatementIndex+1, numberStatements):
      queryString = statements[index]
      queryString = queryString.rstrip('\n;')
      try:
        value = cursor.execute(queryString)
      except:
        print "ERROR - generic execute error for cleanup statements"

def GetJSONFileAndExecSingleQuery(queryDir, singleFile):
  # find the json file for the query file
  json_files = glob.glob("%s/*.json" % queryDir)
  if not json_files:
    # look in parent directory for a json file
    updir = ""
    while not json_files:
      updir = "%s/.." % updir
      json_files = glob.glob("%s%s/*.json" % (queryDir, updir))
  for json_file in json_files:
    queryFile, queryFileExt, expectedFile, expectedFileExt, schema, \
      outputFileExt = ParseJSONFile(json_file)
    # execute query file
    if queryFileExt:
      # get query files that match query file extension
      if fnmatch.fnmatch(singleFile, '*%s' % queryFileExt):
        # execute SQL statement to "use" the schema specified by
        # the JSON file
        try:
          value = cursor.execute("use `%s`" % schema)
        except:
          print "execute error for schema"
          raise RuntimeError('cannot use schema %s' % schema)

        #extract query file name from singleFile, which has absolute path
        queryFileRegex = re.compile(".*/(.*)$")
        queryFileRegexSearch = queryFileRegex.search(singleFile)
        queryFile = queryFileRegexSearch.group(1)
        ExecuteQuery(queryDir, queryFile, outputFileExt, resultFileCreated)
    else:
      # if there is no query file extension, then there is a specific 
      # query file specified in the json file.  check if file specified in json
      # file matches the file requested by user.  if so, then execute the requested
      # file using the information in this json file
      if singleFile == '%s/%s' % (queryDir,queryFile):
        # execute SQL statement to "use" the schema specified by
        # the JSON file
        try:
          value = cursor.execute("use `%s`" % schema)
        except:
          print "execute error for schema"
          raise RuntimeError('cannot use schema %s' % schema)

        ExecuteQuery(queryDir, queryFile, outputFileExt, resultFileCreated)

def GetJSONFileAndExecQueries(queryDir):
  for root, dirnames, filenames in os.walk(queryDir):
    # find the json files
    for filename in fnmatch.filter(filenames, '*.json'):
      json_file = os.path.join(queryDir, filename)
      queryFile, queryFileExt, expectedFile, expectedFileExt, schema, \
        outputFileExt = ParseJSONFile(json_file)
      # execute SQL statement to "use" the schema specified by
      # the JSON file
      cursor.execute("use %s" % schema)

      # get list of query files for this json file
      # these will have absolute paths
      if queryFileExt:
        queryFiles = glob.glob("%s/*%s" % (queryDir,queryFileExt))
      else:
        # check if file specified by json file matches the file requested by user
        # if so, then execute the requested file using the information in this
        # json file
        queryFiles = glob.glob("%s/%s" % (queryDir, queryFile))
      queryFileRegex = re.compile(".*/(.*)")
      for queryFileWithPath in queryFiles:
        queryFileRegexSearch = queryFileRegex.search(queryFileWithPath)
        queryFile = queryFileRegexSearch.group(1)
        # execute each query file
        ExecuteQuery(queryDir, queryFile, outputFileExt, resultFileCreated)

# determine if one query is being executed, or a directory of queries.
singleFileTest = False
singleFile = ""
if os.path.isfile(sys.argv[1]):
  singleFile = (sys.argv[1])
  queryDir = os.path.dirname(singleFile)
  singleFileTest = True
elif os.path.isdir(sys.argv[1]):
  queryDir = sys.argv[1]
else:
  print "ERROR - %s needs to be a file or directory" % sys.argv[1]
  sys.exit(-1)

today = datetime.datetime.now()

resultDir = ""
outputFileArg = ""
resultFileCreated = False
outputFileGiven = False
if len(sys.argv) == 3:
  # get output file name
  outputFileArg = sys.argv[2]
  outputFileArg = os.path.join(os.getcwd(), outputFileArg)
  print ("outputFileArg: " + outputFileArg);

  #check if arg2 is an existing directory, in which case the result file goes here
  if os.path.isdir(outputFileArg):
    # create generic output file based on today's date
    resultfile = "ODBC-Test-Result-%s.out" % today.isoformat()
    resultfilepath = "%s/%s" % (resultDir, resultfile)
    resultFileCreated = True

    if os.path.exists(resultfile):
      print "result file %s exists\n" % resultfilepath
      sys.exit(-1)
  else:
    # arg2 is a file, not a directory.  use it as the output file
    outputFileGiven = True

if len(sys.argv) == 4:
  if resultFileCreated:
    print "result file %s has already been created\n" % resultfilepath
    sys.exit(-1)
  resultDir = sys.argv[3]
  print ("resultDir: " + resultDir);
  resultfile = "ODBC-Test-Result-%s.out" % today.isoformat()
  resultfilepath = "%s/%s" % (resultDir, resultfile)
  resultFileCreated = True

  if os.path.exists(resultfile):
    print "result file path %s exists" % resultfilepath
    sys.exit(-1)

# connect to Drill
dbh = pyodbc.connect('DSN=MapR Drill 64-bit', autocommit='True')
cursor = dbh.cursor()

failedTests = []
json_files = []

if singleFileTest:
  GetJSONFileAndExecSingleQuery(queryDir, singleFile)
else:
  GetJSONFileAndExecQueries(queryDir)

cursor.close()
del cursor
dbh.close()  

sys.exit(0)

