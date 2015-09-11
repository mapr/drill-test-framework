select substr(convert_from(onecf['name'], 'UTF8'), 5, 8) from voter where twocf['age'] < 20;
