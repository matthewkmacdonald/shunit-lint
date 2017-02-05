#!/bin/bash

source ./shunit-md.conf

function shunittest_CheckFunctionLength() {
	flen -l $FUNCTION_LENGTH -d $BRACE_DEPTH -p $SEARCH_PATH -t $FILE_TYPE
	if [ $? -ne 0 ]
	then
		echo "Function length/depth violation detected" >/dev/stderr
		return 1
	fi
}

function shunittest_CheckLineLengh() {
	grep -rn --include="$FILE_TYPE" '.\{'$LINE_LENGTH'\}' $SEARCH_PATH
	if [ $? -eq 0 ]
	then
		echo "Line Length violation detected" >/dev/stderr
		return 1
	fi
}

function shunittest_CheckForbiddenFunctions() {
	egrep -rn --include="$FILE_TYPE" \
		$BLACKLIST $SEARCH_PATH | \
		grep -v $WHITELIST
	if [ $? -eq 0 ]
	then
		echo "Forbidden function use detected" >/dev/stderr
		return 1
	fi
}
