#!/bin/bash
# 	find-code.sh  3.267.600  2020-01-15T22:51:24.506857-06:00 (CST)  https://github.com/BradleyA/markit  dev  uadmin  five-rpi3b.cptx86.com 3.266  
# 	   find-code.sh   first draft of #74 ready for test 
# 	find-code.sh  3.144.300  2018-11-16T23:16:34.591093-06:00 (CST)  https://github.com/BradleyA/markit  uadmin  one-rpi3b.cptx86.com 3.143  
# 	   find-code.sh change log format and order close #56 
#86# find-code.sh - Search systems from clones from repositories
###  Production standard 3.0 shellcheck
###  Production standard 5.3.550 Copyright                                                  # 3.550
#    Copyright (c) 2020 Bradley Allen                                                       # 3.550
#    MIT License is online  https://github.com/BradleyA/user-files/blob/master/LICENSE      # 3.550
###  Production standard 1.3.550 DEBUG variable                                             # 3.550
#    Order of precedence: environment variable, default code
if [[ "${DEBUG}" == ""  ]] ; then DEBUG="0" ; fi   # 0 = debug off, 1 = debug on, 'export DEBUG=1', 'unset DEBUG' to unset environment variable (bash)
if [[ "${DEBUG}" == "2" ]] ; then set -x    ; fi   # Print trace of simple commands before they are executed
if [[ "${DEBUG}" == "3" ]] ; then set -v    ; fi   # Print shell input lines as they are read
if [[ "${DEBUG}" == "4" ]] ; then set -e    ; fi   # Exit immediately if non-zero exit status
if [[ "${DEBUG}" == "5" ]] ; then set -e -o pipefail ; fi   # Exit immediately if non-zero exit status and exit if any command in a pipeline errors
#
BOLD=$(tput -Txterm bold)
NORMAL=$(tput -Txterm sgr0)
RED=$(tput    setaf 1)
GREEN=$(tput  setaf 2)
YELLOW=$(tput setaf 3)
CYAN=$(tput   setaf 6)
WHITE=$(tput  setaf 7)

###  Production standard 7.0 Default variable value
DEFAULT_CLUSTER="us-tx-cluster-1/"
DEFAULT_DATA_DIR="/usr/local/data/"
DEFAULT_SYSTEMS_FILE="SYSTEMS"

###  Production standard 8.3.541 --usage
COMMAND_NAME=$(echo "${0}" | sed 's/^.*\///')                                               # 3.541
display_usage() {
echo -e "\n${NORMAL}${COMMAND_NAME}\n   Search systems for .git repositories"
echo -e "\n${BOLD}USAGE${NORMAL}"
echo    "   ${YELLOW}Positional Arguments${NORMAL}"
echo -e "   ${COMMAND_NAME} [-c <CLUSTER>] [-d <DATA_DIR>] [-s <SYSTEMS_FILE>]\n"
echo    "   ${COMMAND_NAME} [--help | -help | help | -h | h | -?]"
echo    "   ${COMMAND_NAME} [--usage | -usage | -u]"
echo    "   ${COMMAND_NAME} [--version | -version | -v]"
}

###  Production standard 0.3.550 --help                                                     # 3.550
display_help() {
display_usage
#    Displaying help DESCRIPTION in English en_US.UTF-8, en.UTF-8, C.UTF-8                  # 3.550
echo -e "\n${BOLD}DESCRIPTION${NORMAL}"
echo    "This script searches each system found in SYSTEMS file for .git repositories"
echo    "in ~/.. directories."
echo -e "\nThis script reads <DATA_DIR>/<CLUSTER>/<SYSTEMS_FILE> file for hosts."
echo    "The hosts are one FQDN or IP address per line for all hosts in a cluster."
echo    "Lines in SYSTEMS file that begin with a # are comments.  The SYSTEMS file is"
echo    "used by Linux-admin/cluster-command/cluster-command.sh, markit/find-code.sh,"
echo    "pi-display/create-message/create-display-message.sh, and other scripts.  A"
echo    "different SYSTEMS file can be entered on the command line or environment"
echo    "variable."
echo -e "\nTo avoid many login prompts for each host in a cluster, enter the following:"
echo    "${BOLD}ssh-copy-id uadmin@<host-name>${NORMAL} to each host in the SYSTEMS file."

###  Production standard 4.3.550 Documentation Language                                     # 3.550
#    Displaying help DESCRIPTION in French fr_CA.UTF-8, fr_FR.UTF-8, fr_CH.UTF-8
if [[ "${LANG}" == "fr_CA.UTF-8" ]] || [[ "${LANG}" == "fr_FR.UTF-8" ]] || [[ "${LANG}" == "fr_CH.UTF-8" ]] ; then
  echo -e "\n--> ${LANG}"
  echo    "<votre aide va ici>" # your help goes here
  echo    "Souhaitez-vous traduire la section description?" # Do you want to translate the description section?
elif ! [[ "${LANG}" == "en_US.UTF-8" ||  "${LANG}" == "en.UTF-8" || "${LANG}" == "C.UTF-8" ]] ; then  # 3.550
  new_message "${LINENO}" "${YELLOW}INFO${WHITE}" "  Your language, ${LANG}, is not supported.  Would you like to translate the description section?" 1>&2
fi

echo -e "\n${BOLD}ENVIRONMENT VARIABLES${NORMAL}"
echo    "If using the bash shell, enter; 'export DEBUG=1' on the command line to set"
echo    "the environment variable DEBUG to '1' (0 = debug off, 1 = debug on).  Use the"
echo    "command, 'unset DEBUG' to remove the exported information from the environment"
echo    "variable DEBUG.  You are on your own defining environment variables if"
echo    "you are using other shells."

###  Production standard 1.3.550 DEBUG variable                                             # 3.550
echo    "   DEBUG           (default off '0')  The DEBUG environment variable can be set"   # 3.550
echo    "                   to 0, 1, 2, 3, 4 or 5.  The setting '' or 0 will turn off"      # 3.550
echo    "                   all DEBUG messages during execution of this script.  The"       # 3.550
echo    "                   setting 1 will print all DEBUG messages during execution."      # 3.550
echo    "                   Setting 2 (set -x) will print a trace of simple commands"       # 3.550
echo    "                   before they are executed.  Setting 3 (set -v) will print"       # 3.550
echo    "                   shell input lines as they are read.  Setting 4 (set -e) will"   # 3.550
echo    "                   exit immediately if non-zero exit status is recieved with"      # 3.550
echo    "                   some exceptions.  Setting 5 (set -e -o pipefail) will do"       # 3.550
echo    "                   setting 4 and exit if any command in a pipeline errors.  For"   # 3.550
echo    "                   more information about the set options, see man bash."          # 3.550

echo    "   CLUSTER         (default ${DEFAULT_CLUSTER})"
echo    "   DATA_DIR        (default ${DEFAULT_DATA_DIR})"
echo    "   SYSTEMS_FILE    (default ${DEFAULT_SYSTEMS_FILE})"
echo    "   DEBUG           (default '0')"

echo -e "\n${BOLD}OPTIONS${NORMAL}"
echo -e "Order of precedence: CLI options, environment variable, default code.\n"
echo    "   -c, --cluster, -c=, --cluster=<CLUSTER>"
echo -e "\tCluster directory name (default '${DEFAULT_CLUSTER}')\n"
echo    "   -d, --datadir, -d=, --datadir=<DATA_DIR>"
echo -e "\tPath to cluster data directory (default '${DEFAULT_DATA_DIR}')\n"
echo    "   -s, --systems, -s=, --systems=<SYSTEMS_FILE>"
echo -e "\tName of systems file (default ${DEFAULT_SYSTEMS_FILE})\n"

###  Production standard 6.3.547  Architecture tree
echo -e "\n${BOLD}ARCHITECTURE TREE${NORMAL}"  # STORAGE & CERTIFICATION
echo    "/usr/local/data/                           <-- <DATA_DIR>"
echo    "└── <CLUSTER>/                             <-- <CLUSTER>"
echo    "    └── SYSTEMS                            <-- List of hosts in cluster"

echo -e "\n${BOLD}DOCUMENTATION${NORMAL}"
echo    "   https://github.com/BradleyA/markit/blob/master/README.md"

echo -e "\n${BOLD}EXAMPLES${NORMAL}"
echo -e "   Search systems for .git repositories using defaults\n\t${BOLD}${COMMAND_NAME}${NORMAL}\n" # 3.550
echo -e "   Search systems for .git repositories using a different <CLUSTER>.\n\t${BOLD}${COMMAND_NAME} -c australia-southeast1 ${NORMAL}\n" # 3.550

echo -e "\n${BOLD}SEE ALSO${NORMAL}"                                                        # 3.550
echo    "   markit (https://github.com/BradleyA/markit/blob/master/README.md#markit------)" # 3.550
echo    "   check-markit  (https://github.com/BradleyA/markit/blob/master/README.md#usage-check-markit)" # 3.550

echo -e "\n${BOLD}AUTHOR${NORMAL}"                                                          # 3.550
echo    "   ${COMMAND_NAME} was written by Bradley Allen <allen.bradley@ymail.com>"         # 3.550

echo -e "\n${BOLD}REPORTING BUGS${NORMAL}"                                                  # 3.550
echo    "   Report ${COMMAND_NAME} bugs https://github.com/BradleyA/markit/issues/new/choose"  # 3.550

###  Production standard 5.3.550 Copyright                                                  # 3.550
echo -e "\n${BOLD}COPYRIGHT${NORMAL}"                                                       # 3.550
echo    "   Copyright (c) 2020 Bradley Allen"                                               # 3.550
echo    "   MIT License https://github.com/BradleyA/markit/blob/master/LICENSE"             # 3.550
}

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

###  Production standard 2.3.529 log format (WHEN WHERE WHAT Version Line WHO UID:GID [TYPE] Message)
new_message() {  #  $1="${LINENO}"  $2="DEBUG INFO ERROR WARN"  $3="message"
  get_date_stamp
  echo -e "${NORMAL}${DATE_STAMP} ${LOCALHOST} ${SCRIPT_NAME}[$$] ${SCRIPT_VERSION} ${1} ${USER} ${UID}:${GROUP_ID} ${BOLD}[${2}]${NORMAL}  ${3}"
}

#    INFO
new_message "${LINENO}" "${YELLOW}INFO${WHITE}" "  Started..." 1>&2

#    Added following code because USER is not defined in crobtab jobs
if ! [[ "${USER}" == "${LOGNAME}" ]] ; then  USER=${LOGNAME} ; fi
if [[ "${DEBUG}" == "1" ]] ; then new_message "${LINENO}" "DEBUG" "  Setting USER to support crobtab...  USER >${USER}<  LOGNAME >${LOGNAME}<" 1>&2 ; fi

#    DEBUG
if [[ "${DEBUG}" == "1" ]] ; then new_message "${LINENO}" "DEBUG" "  Name_of_command >${SCRIPT_NAME}< Name_of_arg1 >${1}< Name_of_arg2 >${2}< Name_of_arg3 >${3}<  Version of bash ${BASH_VERSION}" 1>&2 ; fi

###  Production standard 9.3.513 Parse CLI options and arguments
while [[ "${#}" -gt 0 ]] ; do
  case "${1}" in
    --help|-help|help|-h|h|-\?)  display_help | more ; exit 0 ;;
    --usage|-usage|usage|-u)  display_usage ; exit 0  ;;
    --version|-version|version|-v)  echo "${SCRIPT_NAME} ${SCRIPT_VERSION}" ; exit 0  ;;
    -c|--cluster)  if [[ "${2}" == "" ]] ; then  display_usage ; new_message "${LINENO}" "${RED}ERROR${WHITE}" "  Argument for ${BOLD}${YELLOW}${1}${NORMAL} is not found on command line" 1>&2 ; exit 1 ; fi ; CLUSTER=${2} ; shift 2 ;;
    -c=*|--cluster=*)  CLUSTER=$(echo "${1}" | cut -d '=' -f 2) ; shift  ;;
    -d|--datadir)  if [[ "${2}" == "" ]] ; then  display_usage ; new_message "${LINENO}" "${RED}ERROR${WHITE}" "  Argument for ${BOLD}${YELLOW}${1}${NORMAL} is not found on command line" 1>&2 ; exit 1 ; fi ; DATA_DIR=${2} ; shift 2 ;;
    -d=*|--datadir=*)  DATA_DIR=$(echo "${1}" | cut -d '=' -f 2) ; shift  ;;
    -s|--systems)  if [[ "${2}" == "" ]] ; then  display_usage ; new_message "${LINENO}" "${RED}ERROR${WHITE}" "  Argument for ${BOLD}${YELLOW}${1}${NORMAL} is not found on command line" 1>&2 ; exit 1 ; fi ; SYSTEMS_FILE=${2} ; shift 2 ;;
    -s=*|--systems=*)  SYSTEMS_FILE=$(echo "${1}" | cut -d '=' -f 2) ; shift  ;;
    *)  new_message "${LINENO}" "${RED}ERROR${WHITE}" "  Option, ${BOLD}${YELLOW}${1}${NORMAL}, entered on the command line is not supported." 1>&2 ; display_usage ; exit 1 ; ;;
# OR
#    *) break ;;
  esac
done

###

###  Production standard 7.0 Default variable value
#    Order of precedence: CLI argument, environment variable, default code
if [[ "${CLUSTER}" == "" ]] ; then CLUSTER=${DEFAULT_CLUSTER} ; fi
if [[ "${DATA_DIR}" == "" ]] ; then DATA_DIR=${DEFAULT_DATA_DIR} ; fi
if [[ "${SYSTEMS_FILE}" == "" ]] ; then SYSTEMS_FILE=${DEFAULT_SYSTEMS_FILE} ; fi
if [[ "${DEBUG}" == "1" ]] ; then new_message "${LINENO}" "DEBUG" "  CLUSTER >${CLUSTER}< DATA_DIR >${DATA_DIR}< SYSTEMS_FILE >${SYSTEMS_FILE}< PATH >${PATH}<" 1>&2 ; fi

#	REMOTECOMMAND="find /home/uadmin -type d \( -name 'git*' -o -name 'bitbucket' \)  -print"
#	REMOTECOMMAND="find ~/.. 2>/dev/null -type d -execdir test -d '.git' \; -print -prune"
REMOTECOMMAND="find ~/.. 2>/dev/null -type d -name '.git' -print"

#    Check if ${SYSTEMS_FILE} file is on system, one FQDN or IP address per line for all hosts in cluster
if ! [[ -e ${DATA_DIR}/${CLUSTER}/${SYSTEMS_FILE} ]] || ! [[ -s ${DATA_DIR}/${CLUSTER}/${SYSTEMS_FILE} ]] ; then
  new_message "${LINENO}" "${YELLOW}WARN${WHITE}" "  ${SYSTEMS_FILE} file missing or empty, creating ${SYSTEMS_FILE} file with local host.  Edit ${DATA_DIR}/${CLUSTER}/${SYSTEMS_FILE} file and add additional hosts that are in the cluster." 1>&2
  echo -e "###     List of hosts used by cluster-command.sh & create-message.sh"  > ${DATA_DIR}/${CLUSTER}/${SYSTEMS_FILE}
  echo -e "#       One FQDN or IP address per line for all hosts in cluster" > ${DATA_DIR}/${CLUSTER}/${SYSTEMS_FILE}
  echo -e "###" > ${DATA_DIR}/${CLUSTER}/${SYSTEMS_FILE}
  echo    "${LOCALHOST}" > ${DATA_DIR}/${CLUSTER}/${SYSTEMS_FILE}
fi

#    Loop through hosts in ${SYSTEMS_FILE} file
REMOTEHOST=$(grep -v "#" "${DATA_DIR}/${CLUSTER}/${SYSTEMS_FILE}")
for NODE in ${REMOTEHOST} ; do
  echo -e "\n${BOLD}  -->  ${CYAN}${NODE}${NORMAL}       ->${REMOTECOMMAND}<-" 
  if [ "${LOCALHOST}" != "${NODE}" ] ; then
    ssh -t "${USER}"@"${NODE}" "${REMOTECOMMAND}"
  else
    eval "${REMOTECOMMAND}"
  fi
done

#
new_message "${LINENO}" "${YELLOW}INFO${WHITE}" "  Operation finished..." 1>&2

###
