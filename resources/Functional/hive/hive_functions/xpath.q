select xpath_string ('<a><b id="1"><c/></b><b id="2"><c/></b></a>','/descendant::c/ancestor::b/@id') from hive.crosssources.fewtypes_null_hive limit 1;
