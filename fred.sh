#!/bin/bash
#	fred.sh	3.1.44	2018-02-07_22:14:19_CST uadmin six-rpi3b.cptx86.com 3.1-1-g011ac2d 
#	Closes #2 
#	fred.sh	3.1.43	2018-02-07_17:12:56_CST uadmin six-rpi3b.cptx86.com 3.1 
#	Major rewrite to support multiple files 
#	markit	1.1	2017-12-18_19:09:50_CST uthree
#	Testing added code to support one line description
#
#	set -x
#	set -v
#
###
display_help() {
echo -e "\nAdd file name, version, date, programmer, and hostname as the second line"
echo	"in a file.  Followed by a single line breif description about the changes"
echo	"made to a file."
echo	"major rewrite =====>>>>> This script uses two arguements;"
echo -e "A Single-line comment character(s) to use in file $FILE_NAME\n\tis required when prompted (example: # // -- ;; )."
echo    "A Single-line description is required when prompted."
echo -e "Documentation:https://github.com/BradleyA/markit\n"
echo -e "Example:\t${0} sample.sh 3.02\n"
}
if [ "$1" == "--help" ] || [ "$1" == "-help" ] || [ "$1" == "help" ] || [ "$1" == "-h" ] || [ "$1" == "h" ] || [ "$1" == "-?" ] || [ "$1" == "?" ] ; then
	display_help
	exit 0
fi
###
#	use cases
CURRENT_RELEASE=`git tag | tail -1`
COMMENT_CHAR=""
FILE_LIST=`git status -s | awk '{print $2}'`
NUMBER_COMMITS=`git rev-list HEAD | wc -l`	
TEMP_FILE="TEMP_MARKIT_FILE"
TIME_STAMP=`date +%Y-%m-%d_%H:%M:%S_%Z`
#	The FILE_MESSAGE is a one line breif description about the changes.
FILE_MESSAGE=""
FILE_RELEASE=""
FILE_TEMP="TEMP_MARKIT_FILE"
#	Check if ${FILE_LIST} is zero length
if [ -z "${FILE_LIST}" ] ; then
	echo -e "${0} ${LINENO} [ERROR]:	No file(s) found to mark.\n`git status`"	1>&2
	display_help
	exit 1
fi
#
echo    "Files to be marked and pushed to github: ${FILE_LIST} "
echo    "Current release number: ${CURRENT_RELEASE} "
echo -e "Enter release number to commit (example 3.01), "
read     FILE_RELEASE
if [ -z ${FILE_RELEASE} ] ; then
	echo -e "${0} ${LINENO} [ERROR]:	Release number is required.\n"	1>&2
	display_help
	exit 1
fi
#
#
echo	">>>>>>>>>>>>>>>>>> debug 0 ${FILE_NAME}"
if [ -z ${COMMENT_CHAR} ] ; then
	echo "Enter Single-line comment character(s) to use (example: # // -- ;; ):"
	read COMMENT_CHAR
#			At a later time I need to add code to support comments that use 
#			multiple line or opening with closing comment character(s) and code requiring to be compiled.
#			Multiple line comments require an opening and closing comment mark.
fi
echo	">>>>>>>>>>>>>>>>>> debug 1 ${FILE_NAME}"
if [ -z ${COMMENT_CHAR} ] ; then
	echo -e "${0} ${LINENO} [ERROR]:        Single-line comment character(s) is required.\n"       1>&2
	display_help
	exit 1
fi
echo "Enter a one line description about the changes:"
read FILE_MESSAGE
if [ -z "$FILE_MESSAGE" ] ; then
	echo -e "${0} ${LINENO} [ERROR]:        Single-line description is required.\n"       1>&2
	display_help
	exit 1
fi
#	Mark each file because add, tag and commit , push --followtags ??? <<<<
for FILE_NAME in ${FILE_LIST} ; do
	echo "${FILE_NAME}"
echo	">>>>>>>>>>>>>>>>>> debug 2 ${FILE_NAME}"
done
#	Check if release number enter equal current release number 
if [ "${FILE_RELEASE}" == "${CURRENT_RELEASE}" ] ; then
	echo    " >>>>>>>>>>>>>>>>> they match"
fi
