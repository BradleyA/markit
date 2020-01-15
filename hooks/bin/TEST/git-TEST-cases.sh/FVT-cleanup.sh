#!/bin/bash
# 	hooks/bin/TEST/git-TEST-cases.sh/FVT-cleanup.sh  2.202.881  2019-10-04T16:38:13.484777-05:00 (CDT)  https://github.com/BradleyA/git-TEST-commit-automation.git  uadmin  five-rpi3b.cptx86.com 2.201  
# 	   hooks/bin/TEST/git-TEST-cases.sh/FVT-cleanup.sh   remove -v option for rm 
# 	hooks/bin/TEST/git-TEST-cases.sh/FVT-cleanup.sh  2.133.779  2019-09-26T21:10:19.219920-05:00 (CDT)  https://github.com/BradleyA/git-TEST-commit-automation.git  uadmin  five-rpi3b.cptx86.com 2.132-1-g91c4dee  
# 	   hooks/bin/TEST/git-TEST-cases.sh/FVT-cleanup.sh  rm FVT-option-c-002.expected FVT-option-c-001.expected 
# 	hooks/bin/TEST/git-TEST-cases.sh/FVT-cleanup.sh  2.132.777  2019-09-26T20:27:59.431245-05:00 (CDT)  https://github.com/BradleyA/git-TEST-commit-automation.git  uadmin  five-rpi3b.cptx86.com 2.131-1-g2bc39b3  
# 	   hooks/bin/TEST/git-TEST-cases.sh/FVT-cleanup.sh  first custom edit 
# 	hooks/EXAMPLES/FVT-cleanup.sh  2.108.598  2019-09-19T16:47:48.371636-05:00 (CDT)  https://github.com/BradleyA/git-TEST-commit-automation.git  uadmin  five-rpi3b.cptx86.com 2.107-7-gae522d0  
# 	   upgrade Version section 
# 	hooks/EXAMPLES/FVT-cleanup.sh  2.92.550  2019-09-17T10:54:54.487436-05:00 (CDT)  https://github.com/BradleyA/git-TEST-commit-automation.git  uadmin  five-rpi3b.cptx86.com 2.91  
# 	   close #3   hooks/bin/git-TEST-cases.sh 
# 	hooks/EXAMPLES/FVT-cleanup.sh  2.81.523  2019-09-14T23:16:43.457843-05:00 (CDT)  https://github.com/BradleyA/git-TEST-commit-automation.git  uadmin  five-rpi3b.cptx86.com 2.80-1-g8745c24  
# 	   hooks/EXAMPLES/FVT-cleanup.sh   push to add version 
#86# FVT-cleanup.sh - test case cleanup
###  Production standard 3.0 shellcheck
###  Production standard 5.1.160 Copyright
#    Copyright (c) 2019 Bradley Allen
#    MIT License is in the online DOCUMENTATION, DOCUMENTATION URL defined below.
###  Production standard 1.3.496 DEBUG variable
#    Order of precedence: environment variable, default code
if [[ "${DEBUG}" == ""  ]] ; then DEBUG="0" ; fi   # 0 = debug off, 1 = debug on, 'export DEBUG=1', 'unset DEBUG' to unset environment variable (bash)
if [[ "${DEBUG}" == "2" ]] ; then set -x    ; fi   # Print trace of simple commands before they are executed
if [[ "${DEBUG}" == "3" ]] ; then set -v    ; fi   # Print shell input lines as they are read
if [[ "${DEBUG}" == "4" ]] ; then set -e    ; fi   # Exit command has a non-zero exit status
#
BOLD=$(tput -Txterm bold)
NORMAL=$(tput -Txterm sgr0)
#    Date and time function ISO 8601
get_date_stamp() {
  DATE_STAMP=$(date +%Y-%m-%dT%H:%M:%S.%6N%:z)
  TEMP=$(date +%Z)
  DATE_STAMP="${DATE_STAMP} (${TEMP})"
}

#    Fully qualified domain name FQDN hostname
LOCALHOST=$(hostname -f)

#    Version
#    Assumptions for the next two lines of code:  The second line in this script includes the script path & name as the second item and
#    the script version as the third item separated with space(s).  The tool I use is called 'markit'. See example line below:
#       template/template.sh  3.517.783  2019-09-13T18:20:42.144356-05:00 (CDT)  https://github.com/BradleyA/user-files.git  uadmin  one-rpi3b.cptx86.com 3.516  
SCRIPT_NAME=$(head -2 "${0}" | awk '{printf $2}')
SCRIPT_VERSION=$(head -2 "${0}" | awk '{printf $3}')
if [[ "${SCRIPT_NAME}" == "" ]] ; then SCRIPT_NAME="${0}" ; fi
if [[ "${SCRIPT_VERSION}" == "" ]] ; then SCRIPT_VERSION="v?.?" ; fi

#    UID and GID
USER_ID=$(id -u)
GROUP_ID=$(id -g)

###  Production standard 2.3.512 log format (WHEN WHERE WHAT Version Line WHO UID:GID [TYPE] Message)
new_message() {  #  $1="${SCRIPT_NAME}"  $2="${LINENO}"  $3="DEBUG INFO ERROR WARN"  $4="message"
  get_date_stamp
  echo -e "${NORMAL}${DATE_STAMP} ${LOCALHOST} ${1}[$$] ${SCRIPT_VERSION} ${2} ${USER} ${USER_ID}:${GROUP_ID} ${BOLD}[${3}]${NORMAL}  ${4}"
}

if [[ "${DEBUG}" == "1" ]] ; then new_message "${SCRIPT_NAME}" "${LINENO}" "DEBUG" "  Started..." 1>&2 ; fi

###  Place test case cleanup here 

#    Remove environment variables
#  unset
#    Remove directories
#  rmdir
#    Remove output from previous run of test cases
rm -f FVT-*.test-case-output
#    Remove temporary files
#  rm -f temporary files
rm -f FVT-option-version-001.expected
rm -f FVT-option-version-002.expected
rm -f FVT-option-version-003.expected
rm -f FVT-option-a-001.expected
rm -f FVT-option-a-002.expected
rm -f FVT-option-c-001.expected
rm -f FVT-option-c-002.expected
#    Remove linked FVT-* files except FVT-cleanup.sh and FVT-setup.sh
for k in $(ls -1 FVT-*) ; do
  if [[ "${k}" != "FVT-cleanup.sh" ]] ; then
    if [[ "${k}" != "FVT-setup.sh" ]] ; then
      { [ ! -L "${k}" ] || rm "${k}"; }  #  Remove files with symbolic link
    fi
  fi
done

if [[ "${DEBUG}" == "1" ]] ; then new_message "${SCRIPT_NAME}" "${LINENO}" "INFO" "  Operation finished..." 1>&2 ; fi
###
