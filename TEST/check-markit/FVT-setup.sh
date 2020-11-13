#!/bin/bash
# 	TEST/check-markit/FVT-setup.sh  4.1.114.1036  2020-11-12T21:18:36.702712-06:00 (CST)  https://github.com/BradleyA/markit  master  uadmin  five-rpi3b.cptx86.com 4.1.113  
# 	   TEST/check-markit/FVT-setup.sh -->   rm FVT-option-filename-009 FVT-option-filename-010 because FVT-option-invalid replaced them  
# 	TEST/check-markit/FVT-setup.sh  4.1.113.1035  2020-11-12T21:14:04.301049-06:00 (CST)  https://github.com/BradleyA/markit  master  uadmin  five-rpi3b.cptx86.com 4.1.112  
# 	   TEST/check-markit/FVT-setup.sh -->   add FVT-option-invalid-001  
# 	TEST/check-markit/FVT-setup.sh  4.1.98.1016  2020-10-30T22:48:23.925754-05:00 (CDT)  https://github.com/BradleyA/markit  master  uadmin  three-rpi3b.cptx86.com 4.1.97  
# 	   TEST/check-markit/FVT-setup.sh -->   added 2 additional test cases FVT-option-filename-009 FVT-option-filename-010  
# 	TEST/check-markit/FVT-setup.sh  4.1.96.1014  2020-10-30T22:35:05.238425-05:00 (CDT)  https://github.com/BradleyA/markit  master  uadmin  three-rpi3b.cptx86.com 4.1.95  
# 	   TEST/check-markit/FVT-setup.sh -->   added links for FVT-option-filename-00?.expected  
# 	TEST/check-markit/FVT-setup.sh  4.1.94.1012  2020-10-30T15:32:55.728345-05:00 (CDT)  https://github.com/BradleyA/markit  master  uadmin  five-rpi3b.cptx86.com 4.1.93  
# 	   TEST/check-markit/FVT-setup.sh -->   update to add FVT-option-filename  
#86# hooks/EXAMPLES/FVT-setup.sh  -  This test script is optional.  It is for
#    'Production standard 10.0 TESTing' test cases.  Copy it to TEST/<file_name>/.
#    If FVT-setup.sh is found in TEST/<file_name>/ post-commit executes it.
#    Functional Verification Testing (FVT) - verify that the program logic conforms
#    to design specification.
###
###  Production standard 3.0 shellcheck
###  Production standard 5.3.559 Copyright                                    # 3.559
#    Copyright (c) 2020 Bradley Allen                                                # 3.555
#    MIT License is online in the repository as a file named LICENSE"         # 3.559
###  Production standard 1.3.550 DEBUG variable                                             # 3.550
#    Order of precedence: environment variable, default code
if [[ "${DEBUG}" == ""  ]] ; then DEBUG="0" ; fi   # 0 = debug off, 1 = debug on, 'export DEBUG=1', 'unset DEBUG' to unset environment variable (bash)
if [[ "${DEBUG}" == "2" ]] ; then set -x    ; fi   # Print trace of simple commands before they are executed
if [[ "${DEBUG}" == "3" ]] ; then set -v    ; fi   # Print shell input lines as they are read
if [[ "${DEBUG}" == "4" ]] ; then set -e    ; fi   # Exit immediately if non-zero exit status
if [[ "${DEBUG}" == "5" ]] ; then set -e -o pipefail ; fi   # Exit immediately if non-zero exit status and exit if any command in a pipeline errors
#
BOLD=$(tput -Txterm bold)
UNDERLINE=$(tput -Txterm sgr 0 1)  # 0.3.583
NORMAL=$(tput -Txterm sgr0)
RED=$(tput    setaf 1)
YELLOW=$(tput setaf 3)
BLUE=$(tput   setaf 4)
PURPLE=$(tput setaf 5)
WHITE=$(tput  setaf 7)

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
SCRIPT_NAME=$(head -2 "${0}" | awk '{printf $2}')  #  Different from ${COMMAND_NAME}=$(echo "${0}" | sed 's/^.*\///'), SCRIPT_NAME = includes Git repository directory and can be used any where in script (for dev, test teams)
SCRIPT_VERSION=$(head -2 "${0}" | awk '{printf $3}')
if [[ "${SCRIPT_NAME}" == "" ]] ; then SCRIPT_NAME="${0}" ; fi
if [[ "${SCRIPT_VERSION}" == "" ]] ; then SCRIPT_VERSION="v?.?" ; fi

#    GID
GROUP_ID=$(id -g)

###  Production standard 2.3.578 Log format (WHEN WHERE WHAT Version Line WHO UID:GID [TYPE] Message)
new_message() {  #  $1="${LINENO}"  $2="DEBUG INFO ERROR WARN"  $3="message"
  get_date_stamp
  echo -e "${NORMAL}${DATE_STAMP} ${LOCALHOST} ${SCRIPT_NAME}[$$] ${BOLD}${BLUE}${SCRIPT_VERSION} ${PURPLE}${1}${NORMAL} ${USER} ${UID}:${GROUP_ID} ${BOLD}[${2}]${NORMAL}  ${3}"
}

#    INFO
if [[ "${DEBUG}" == "1" ]] ; then new_message "${LINENO}" "${YELLOW}INFO${WHITE}" "  Started..." 1>&2 ; fi

#    This script does not support -* or help or usage or version
if [[ "${1}" == -* ]] || [[ "${1}" == "help" ]] || [[ "${1}" == "usage" ]] || [[ "${1}" == "version" ]]  ; then
  new_message "${LINENO}" "${RED}ERROR${WHITE}" "  Option, ${YELLOW}${1}${WHITE}, is not supported with ${SCRIPT_NAME}." 1>&2
  #    User Hint
  echo -e "    For more information:\n${BOLD}${YELLOW}    ${UNDERLINE}https://github.com/BradleyA/git-TEST-commit-automation/tree/master/hooks#git-test-commit-automation------${NORMAL}"
  exit 1
fi

###  Production standard 10.0 TESTing

if [[ ! -z "${1}" ]] ; then  # post-commit must pass REPOSITORY_DIR because post-commit is executed in .git/hooks/ which is not in the repository
  REPOSITORY_DIR=${1}
else
  REPOSITORY_DIR=$(git rev-parse --show-toplevel)  #  not called by post-commit
  if [[ "${0}" != $(basename "${0}") ]] ; then  #  script must execute in TEST/<COMMIT_FILE_NAME>/ directory
    cd "$(dirname "${0}")"
  fi
fi

#    Uncomment shared TEST cases for TESTing
#  ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/FVT-exit-code-error-0-001"	FVT-exit-code-error-0-001
#  ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/FVT-exit-code-error-1-001"	FVT-exit-code-error-1-001
#  ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/FVT-exit-code-error-124-001"	FVT-exit-code-error-124-001
#  ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/FVT-exit-code-error-124-002"	FVT-exit-code-error-124-002
#  ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/FVT-exit-code-error-126-001"	FVT-exit-code-error-126-001
#  ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/FVT-exit-code-error-127-001"	FVT-exit-code-error-127-001
#  ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/FVT-exit-code-error-128-001"	FVT-exit-code-error-128-001
#  ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/FVT-exit-code-error-130-001"	FVT-exit-code-error-130-001
#  ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/FVT-exit-code-error-2-001"	FVT-exit-code-error-2-001
#  ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/FVT-option-add-001"	FVT-option-add-001
#  ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/FVT-option-all-001"	FVT-option-all-001
#  ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/FVT-option-all-002"	FVT-option-all-002
#  ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/FVT-option-all-hooks-001"	FVT-option-all-hooks-001
#  ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/FVT-option-all-hooks-001.expected"	FVT-option-all-hooks-001.expected
#  ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/FVT-option-all-hooks-002"	FVT-option-all-hooks-002
#  ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/FVT-option-all-hooks-002.expected"	FVT-option-all-hooks-002.expected
#  ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/FVT-option-clean-001"	FVT-option-clean-001
#  ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/FVT-option-clean-002"	FVT-option-clean-002
#  ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/FVT-option-clean-hooks-001"	FVT-option-clean-hooks-001
#  ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/FVT-option-clean-hooks-002"	FVT-option-clean-hooks-002
#  ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/FVT-option-clean-hooks-003"	FVT-option-clean-hooks-003
#  ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/FVT-option-clean-hooks-004"	FVT-option-clean-hooks-004
#  ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/FVT-option-cluster-001"	FVT-option-cluster-001
#  ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/FVT-option-cluster-001.expected"	FVT-option-cluster-001.expected
#  ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/FVT-option-cluster-002"	FVT-option-cluster-002
#  ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/FVT-option-cluster-002.expected"	FVT-option-cluster-002.expected
#  ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/FVT-option-cluster-003"	FVT-option-cluster-003
#  ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/FVT-option-cluster-003.expected"	FVT-option-cluster-003.expected
#  ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/FVT-option-cluster-004"	FVT-option-cluster-004
#  ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/FVT-option-cluster-004.expected"	FVT-option-cluster-004.expected
#  ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/FVT-option-cluster-005"	FVT-option-cluster-005
#  ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/FVT-option-cluster-005.expected"	FVT-option-cluster-005.expected
#  ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/FVT-option-cluster-006"	FVT-option-cluster-006
#  ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/FVT-option-cluster-006.expected"	FVT-option-cluster-006.expected
#  ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/FVT-option-cluster-007"	FVT-option-cluster-007
#  ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/FVT-option-cluster-007.expected"	FVT-option-cluster-007.expected
#  ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/FVT-option-cluster-008"	FVT-option-cluster-008
#  ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/FVT-option-cluster-008.expected"	FVT-option-cluster-008.expected
#  ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/FVT-option-datadir-001"	FVT-option-datadir-001
#  ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/FVT-option-datadir-001.expected"	FVT-option-datadir-001.expected
#  ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/FVT-option-datadir-002"	FVT-option-datadir-002
#  ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/FVT-option-datadir-002.expected"	FVT-option-datadir-002.expected
#  ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/FVT-option-datadir-003"	FVT-option-datadir-003
#  ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/FVT-option-datadir-003.expected"	FVT-option-datadir-003.expected
#  ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/FVT-option-datadir-004"	FVT-option-datadir-004
#  ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/FVT-option-datadir-004.expected"	FVT-option-datadir-004.expected
#  ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/FVT-option-datadir-005"	FVT-option-datadir-005
#  ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/FVT-option-datadir-005.expected"	FVT-option-datadir-005.expected
#  ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/FVT-option-datadir-006"	FVT-option-datadir-006
#  ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/FVT-option-datadir-006.expected"	FVT-option-datadir-006.expected
#  ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/FVT-option-datadir-007"	FVT-option-datadir-007
#  ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/FVT-option-datadir-007.expected"	FVT-option-datadir-007.expected
#  ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/FVT-option-datadir-008"	FVT-option-datadir-008
#  ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/FVT-option-datadir-008.expected"	FVT-option-datadir-008.expected
#  ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/FVT-option-systems-001"	FVT-option-systems-001
#  ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/FVT-option-systems-001.expected"	FVT-option-systems-001.expected
#  ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/FVT-option-systems-002"	FVT-option-systems-002
#  ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/FVT-option-systems-002.expected"	FVT-option-systems-002.expected
#  ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/FVT-option-systems-003"	FVT-option-systems-003
#  ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/FVT-option-systems-003.expected"	FVT-option-systems-003.expected
#  ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/FVT-option-systems-004"	FVT-option-systems-004
#  ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/FVT-option-systems-004.expected"	FVT-option-systems-004.expected
#  ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/FVT-option-systems-005"	FVT-option-systems-005
#  ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/FVT-option-systems-005.expected"	FVT-option-systems-005.expected
#  ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/FVT-option-systems-006"	FVT-option-systems-006
#  ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/FVT-option-systems-006.expected"	FVT-option-systems-006.expected
#  ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/FVT-option-systems-007"	FVT-option-systems-007
#  ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/FVT-option-systems-007.expected"	FVT-option-systems-007.expected
#  ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/FVT-option-systems-008"	FVT-option-systems-008
#  ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/FVT-option-systems-008.expected"	FVT-option-systems-008.expected
ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/FVT-option-filename-001"	FVT-option-filename-001
ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/FVT-option-filename-001.expected"	FVT-option-filename-001.expected
ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/FVT-option-filename-002"	FVT-option-filename-002
ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/FVT-option-filename-002.expected"	FVT-option-filename-002.expected
ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/FVT-option-filename-003"	FVT-option-filename-003
ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/FVT-option-filename-003.expected"	FVT-option-filename-003.expected
ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/FVT-option-filename-004"	FVT-option-filename-004
ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/FVT-option-filename-004.expected"	FVT-option-filename-004.expected
ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/FVT-option-filename-005"	FVT-option-filename-005
ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/FVT-option-filename-005.expected"	FVT-option-filename-005.expected
ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/FVT-option-filename-006"	FVT-option-filename-006
ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/FVT-option-filename-006.expected"	FVT-option-filename-006.expected
ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/FVT-option-filename-007"	FVT-option-filename-007
ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/FVT-option-filename-007.expected"	FVT-option-filename-007.expected
ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/FVT-option-filename-008"	FVT-option-filename-008
ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/FVT-option-filename-008.expected"	FVT-option-filename-008.expected
#  ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/FVT-option-filename-hooks-001"	FVT-option-filename-hooks-001
#  ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/FVT-option-filename-hooks-001.expected"	FVT-option-filename-hooks-001.expected
#  ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/FVT-option-filename-hooks-002"	FVT-option-filename-hooks-002
#  ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/FVT-option-filename-hooks-002.expected"	FVT-option-filename-hooks-002.expected
#  ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/FVT-option-filename-hooks-003"	FVT-option-filename-hooks-003
#  ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/FVT-option-filename-hooks-003.expected"	FVT-option-filename-hooks-003.expected
#  ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/FVT-option-filename-hooks-004"	FVT-option-filename-hooks-004
#  ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/FVT-option-filename-hooks-004.expected"	FVT-option-filename-hooks-004.expected
#  ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/FVT-option-filename-hooks-005"	FVT-option-filename-hooks-005
#  ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/FVT-option-filename-hooks-005.expected"	FVT-option-filename-hooks-005.expected
#  ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/FVT-option-filename-hooks-006"	FVT-option-filename-hooks-006
#  ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/FVT-option-filename-hooks-006.expected"	FVT-option-filename-hooks-006.expected
#  ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/FVT-option-filename-hooks-007"	FVT-option-filename-hooks-007
#  ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/FVT-option-filename-hooks-007.expected"	FVT-option-filename-hooks-007.expected
#  ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/FVT-option-filename-hooks-008"	FVT-option-filename-hooks-008
#  ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/FVT-option-filename-hooks-008.expected"	FVT-option-filename-hooks-008.expected
#  ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/FVT-option-filename-hooks-009"	FVT-option-filename-hooks-009
#  ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/FVT-option-filename-hooks-009.expected"	FVT-option-filename-hooks-009.expected
#  ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/FVT-option-filename-hooks-010"	FVT-option-filename-hooks-010
#  ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/FVT-option-filename-hooks-010.expected"	FVT-option-filename-hooks-010.expected
#  ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/FVT-option-filename-hooks-011"	FVT-option-filename-hooks-011
#  ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/FVT-option-filename-hooks-011.expected"	FVT-option-filename-hooks-011.expected
#  ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/FVT-option-filename-hooks-012"	FVT-option-filename-hooks-012
#  ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/FVT-option-filename-hooks-012.expected"	FVT-option-filename-hooks-012.expected
ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/FVT-option-help-001"	FVT-option-help-001
ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/FVT-option-help-002"	FVT-option-help-002
ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/FVT-option-help-003"	FVT-option-help-003
ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/FVT-option-help-004"	FVT-option-help-004
ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/FVT-option-help-005"	FVT-option-help-005
ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/FVT-option-help-006"	FVT-option-help-006
ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/FVT-option-invalid-001"        FVT-option-invalid-001
ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/FVT-option-invalid-001.expected"       FVT-option-invalid-001.expected
ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/FVT-option-invalid-002"        FVT-option-invalid-002
ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/FVT-option-invalid-002.expected"       FVT-option-invalid-002.expected
#  ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/FVT-option-none-001"	FVT-option-none-001
#  ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/FVT-option-none-002"	FVT-option-none-002
#  ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/FVT-option-none-hooks-001"	FVT-option-none-hooks-001
#  ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/FVT-option-none-hooks-001.expected"	FVT-option-none-hooks-001.expected
#  ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/FVT-option-none-hooks-002"	FVT-option-none-hooks-002
#  ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/FVT-option-none-hooks-002.expected"	FVT-option-none-hooks-002.expected
#  ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/FVT-option-none-hooks-003"	FVT-option-none-hooks-003
#  ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/FVT-option-none-hooks-003.expected"	FVT-option-none-hooks-003.expected
#  ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/FVT-option-none-hooks-004"	FVT-option-none-hooks-004
#  ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/FVT-option-none-hooks-004.expected"	FVT-option-none-hooks-004.expected
ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/FVT-option-usage-001"	FVT-option-usage-001
ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/FVT-option-usage-002"	FVT-option-usage-002
ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/FVT-option-usage-003"	FVT-option-usage-003
ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/FVT-option-usage-004"	FVT-option-usage-004
ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/FVT-option-version-001"	FVT-option-version-001
ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/FVT-option-version-002"	FVT-option-version-002
ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/FVT-option-version-003"	FVT-option-version-003
ln -fs "${REPOSITORY_DIR}/hooks/EXAMPLES/FVT-option-version-004"	FVT-option-version-004

#

if [[ "${DEBUG}" == "1" ]] ; then new_message "${LINENO}" "DEBUG" "  Operation finished..." 1>&2 ; fi
###
