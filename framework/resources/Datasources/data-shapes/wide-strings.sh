#!/bin/bash

gen_fixed_decimal() {
    if [ $1 -eq 0 ]; then
        scale_val="0"
        num_val="0"
    elif [ $2 -eq 0 ]
    then
        scale_val="0"
        num_length="$1"
        num_val="$(tr -dc '1-9' </dev/urandom |  head -c $num_length)"
    else 
        num_length=$(($1-$2))
        scale_val="$(tr -dc '0-9' </dev/urandom |  head -c $2)"
        num_val="$(tr -dc '1-9' </dev/urandom |  head -c $num_length)"
    fi
    eval "$3='$num_val.$scale_val'"
}

# (precision 11, scale 3) implies that we can have upto 8 digits to the left of the decimal and upto 3 to the right
gen_decimal() {
    if [ $1 -eq 0 ]; then
        scale_val="0"
        num_val="0"
    elif [ $2 -eq 0 ]
    then
        scale_val="0"
        num_length=$[ $RANDOM % ($1 + 1) ]
        if [ $num_length -eq 0 ]; then
            num_val="0"
        else
            num_val="$(tr -dc '1-9' </dev/urandom |  head -c $num_length)"
        fi
    else
        num_limit=$(($1-$2))
        if [ $num_limit -eq 0 ]; then
            num_val="0"
        else
            num_length=$[ $RANDOM % ($num_limit +1) ]
            if [ $num_length -eq 0 ]; then
                num_val="0"
            else
                num_val="$(tr -dc '1-9' </dev/urandom |  head -c $num_length)"
            fi
        fi
        
        scale_length=$[ $RANDOM % ($2 + 1) ]
        if [ $scale_length -eq 0 ]; then
            scale_val="0"  
        else
            scale_val="$(tr -dc '0-9' </dev/urandom |  head -c $scale_length)"
        fi
    fi
     
    # for negative numbers
    if [ $RANDOM -le 16000 ]; then
        eval "$3='$num_val.$scale_val'"
    else
        eval "$3='-$num_val.$scale_val'"
    fi
}

# make sure we have duplicates
# make sure str_var_null_empty is present in all the columns so that we can join on actual values

str="";
maxwidth=5000
minwidth=4000
for i in {1..100000}; do

str_fixed="$(tr -dc '[:alnum:] ' </dev/urandom |  head -c $maxwidth)"
# randomly change the duplicate value
if [ $RANDOM -ge 27000 ]; then
    str_fixed_duplicate=$str_fixed;
fi

# now use the duplicate randomly
if [ $RANDOM -ge 27000 ]; then
    if [ -n "$str_fixed_duplicate" ]; then 
        str_fixed=$str_fixed_duplicate
    fi
fi

str_size_start=$minwidth
str_size_end=$maxwidth
str_var_length=$[ $str_size_start + $RANDOM % ($str_size_end + 1 - $str_size_start) ]
str_var="$(tr -dc 'a-zA-Z0-9' </dev/urandom |  head -c $str_var_length)"
if [ $RANDOM -ge 27000 ]; then
    str_var_duplicate=$str_var;
fi

# now use the duplicate randomly
if [ $RANDOM -ge 27000 ]; then
    if [ -n "$str_var_duplicate" ]; then
        str_var=$str_var_duplicate
    fi
fi

# lot of continuous empty strings
if [ $RANDOM -le 32000 ]; then
    str_empty=""
else
    str_empty="$(tr -dc '[:alnum:] ' </dev/urandom |  head -c $maxwidth)"
    if [ $RANDOM -ge 27000 ]; then
        str_empty_duplicate=$str_empty;
    fi

    # now use the duplicate randomly
    if [ $RANDOM -ge 27000 ]; then
        if [ -n "$str_empty_duplicate" ]; then
            str_empty=$str_empty_duplicate
        fi
    fi
fi

# lot of continuous nulls
if [ $RANDOM -le 32000 ]; then
    str_null="null"
else
    str_null="$(tr -dc '[:alnum:] ' </dev/urandom |  head -c $maxwidth)"
    if [ $RANDOM -ge 27000 ]; then
        str_null_duplicate=$str_null;
    fi

    # now use the duplicate randomly
    if [ $RANDOM -ge 27000 ]; then
        if [ -n "$str_null_duplicate" ]; then
            str_null=$str_null_duplicate
        fi
    fi
fi


# lot of continuous empty and null strings
if [ $RANDOM -le 32000 ]; then
    if [ $RANDOM -le 16000 ]; then
        str_empty_null=""
    else
        str_empty_null="null"
    fi
else
    str_empty_null="$(tr -dc '[:alnum:] ' </dev/urandom |  head -c $maxwidth)"
    if [ $RANDOM -ge 27000 ]; then
        str_empty_null_duplicate=$str_empty_null;
    fi

    # now use the duplicate randomly
    if [ $RANDOM -ge 27000 ]; then
        if [ -n "$str_empty_null_duplicate" ]; then
            str_empty_null=$str_empty_null_duplicate
        fi
    fi
fi

# variable lenght wide values with a few nulls and empty strings
if [ $RANDOM -le 27000 ]; then
    str_var_null_empty="$(tr -dc 'a-zA-Z0-9' </dev/urandom |  head -c $str_var_length)"
    if [ $RANDOM -ge 27000 ]; then
        str_var_null_empty_duplicate=$str_var_null_empty;
    fi

    # now use the duplicate randomly
    if [ $RANDOM -ge 27000 ]; then
        if [ -n "$str_var_null_empty_duplicate" ]; then
            str_var_null_empty=$str_var_null_empty_duplicate
        fi
    fi
else
    if [ $RANDOM -le 16000 ]; then
        str_var_null_empty=""
    else
        str_var_null_empty="null"
    fi
fi

# fixed length wide values with few nulls and empty strings
if [ $RANDOM -le 27000 ]; then
    str_fixed_null_empty="$(tr -dc 'a-zA-Z0-9' </dev/urandom |  head -c $maxwidth)"
    if [ $RANDOM -ge 27000 ]; then
        str_fixed_null_empty_duplicate=$str_fixed_null_empty;
    fi

    # now use the duplicate randomly
    if [ $RANDOM -ge 27000 ]; then
        if [ -n "$str_fixed_null_empty_duplicate" ]; then
            str_fixed_null_empty=$str_fixed_null_empty_duplicate
        fi
    fi
else
    if [ $RANDOM -le 16000 ]; then
        str_fixed_null_empty=""
    else
        str_fixed_null_empty="null"
    fi
fi


# tinyint
tinyint_start=-128
tinyint_end=127
tinyint_var=$[ $tinyint_start + $RANDOM % ($tinyint_end + 1 - $tinyint_start) ]


# FLOAT and REAL are represented similarly in DRILL according to Aman. Refer to Float.MAX_VALUE
# For Double refere to Double.MAX_VALUE
# For Decimal the max precision is 38. Refer to Mehant


gen_decimal 5 2 dec_var_prec5_sc2


# randomly copy str_var_null_empty into every variable
if [ $RANDOM -ge 27000 ]; then
    str_fixed=$str_var_null_empty
fi
if [ $RANDOM -ge 27000 ]; then
    str_var=$str_var_null_empty
fi
if [ $RANDOM -ge 27000 ]; then
    str_null=$str_var_null_empty
fi
if [ $RANDOM -ge 27000 ]; then
    str_empty=$str_var_null_empty
fi
if [ $RANDOM -ge 27000 ]; then
    str_empty_null=$str_var_null_empty
fi
if [ $RANDOM -ge 27000 ]; then
    str_fixed_null_empty=$str_var_null_empty
fi


echo "{"
echo "    \"id\":$i,"
if [ "$str_fixed" == "null" ]; then
    echo "    \"str_fixed\":$str_fixed,"
else
    echo "    \"str_fixed\":\"$str_fixed\","
fi
if [ "$str_var" == "null" ]; then
    echo "    \"str_var\":$str_var,"
else
    echo "    \"str_var\":\"$str_var\","
fi
if [ "$str_empty" == "null" ]; then
    echo "    \"str_empty\":$str_empty,"
else
    echo "    \"str_empty\":\"$str_empty\","
fi
if [ "$str_null" == "null" ]; then
    echo "    \"str_null\":$str_null,"
else
    echo "    \"str_null\":\"$str_null\","
fi
if [ "$str_empty_null" == "null" ]; then
    echo "    \"str_empty_null\":$str_empty_null,"
else
    echo "    \"str_empty_null\":\"$str_empty_null\","
fi

if [ "$str_var_null_empty" == "null" ]; then
    echo "    \"str_var_null_empty\":$str_var_null_empty,"
else
    echo "    \"str_var_null_empty\":\"$str_var_null_empty\","
fi
if [ "$str_fixed_null_empty" == "null" ]; then
  echo "    \"str_fixed_null_empty\":$str_fixed_null_empty,"
else  
    echo "    \"str_fixed_null_empty\":\"$str_fixed_null_empty\","
fi
echo "    \"tinyint_var\":$tinyint_var,"
echo "    \"dec_var_prec5_sc2\":$dec_var_prec5_sc2"
echo "}"

    echo "$i|$str_fixed|$str_var|$str_empty|$str_null|$str_empty_null|$str_var_null_empty|$str_fixed_null_empty|$tinyint_var|$dec_var_prec5_sc2" >> wide-strings.tbl

done
