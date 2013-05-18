#!/bin/bash

#Make .php file with file in question.
FILE=/tmp/`date +%s`$RANDOM.php
echo '<?php
include('\'otherscripts/convert.php\'');

$file = "'$1'";'>  $FILE
cat otherscripts/json_cli.php_  >> $FILE

#Use it.
php -f $FILE -- 'file=$1'

rm $FILE
