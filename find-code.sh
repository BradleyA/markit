#!/bin/bash
# 	find-code.sh  3.265.595  2020-01-15T17:21:01.330286-06:00 (CST)  https://github.com/BradleyA/markit  dev  uadmin  five-rpi3b.cptx86.com 3.264-1-g64e80aa  
# 	   find-code.sh   changes for #74 
# 	find-code.sh  3.264.593  2020-01-15T16:55:24.503397-06:00 (CST)  https://github.com/BradleyA/markit  dev  uadmin  five-rpi3b.cptx86.com 3.263-1-g61e5b03  
# 	   find-code.sh   begin change for #74 
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
echo -e "   ${COMMAND_NAME} [<CLUSTER>] [<DATA_DIR>] [<SYSTEMS_FILE>]\n"
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
echo    "   <CLUSTER>"
echo -e "\tCluster directory name (default '${DEFAULT_CLUSTER}')\n"
echo    "   <DATA_DIR>"
echo -e "\tPath to cluster data directory (default '${DEFAULT_DATA_DIR}')\n"
echo    "   <SYSTEMS_FILE>"
echo -e "\tName of systems file (default ${DEFAULT_SYSTEMS_FILE})\n"


echo -e "\nDOCUMENTATION\nhttps://github.com/BradleyA/markit"
echo -e "\nEXAMPLES\n   ${0}\n\n   Search systems for .git repositories using defaults\n"
}

#       Date and time function ISO 8601
get_date_stamp() {
DATE_STAMP=$(date +%Y-%m-%dT%H:%M:%S.%6N%:z)
TEMP=$(date +%Z)
DATE_STAMP="${DATE_STAMP} (${TEMP})"
}

#       Fully qualified domain name FQDN hostname
LOCALHOST=$(hostname -f)

#       Version
SCRIPT_NAME=$(head -2 "${0}" | awk {'printf $2'})
SCRIPT_VERSION=$(head -2 "${0}" | awk {'printf $3'})

#       UID and GID
USER_ID=$(id -u)
GROUP_ID=$(id -g)

#       Default help and version arguments
if [ "$1" == "--help" ] || [ "$1" == "-help" ] || [ "$1" == "help" ] || [ "$1" == "-h" ] || [ "$1" == "h" ] || [ "$1" == "-?" ] ; then
        display_help | more
        exit 0
fi
if [ "$1" == "--version" ] || [ "$1" == "-version" ] || [ "$1" == "version" ] || [ "$1" == "-v" ] ; then
        echo "${SCRIPT_NAME} ${SCRIPT_VERSION}"
        exit 0
fi

#       INFO
get_date_stamp ; echo -e "${NORMAL}${DATE_STAMP} ${LOCALHOST} ${0}[$$] ${SCRIPT_VERSION} ${LINENO} ${USER} ${USER_ID}:${GROUP_ID} ${BOLD}[INFO]${NORMAL}  Started..." 1>&2

#       DEBUG
if [ "${DEBUG}" == "1" ] ; then get_date_stamp ; echo -e "${NORMAL}${DATE_STAMP} ${LOCALHOST} ${0}[$$] ${SCRIPT_VERSION} ${LINENO} ${USER} ${USER_ID}:${GROUP_ID} ${BOLD}[DEBUG]${NORMAL}  Name_of_command >${0}< Name_of_arg1 >${1}< Name_of_arg2 >${2}< Name_of_arg3 >${3}<  Version of bash ${BASH_VERSION}" 1>&2 ; fi

#       Order of precedence: CLI argument, environment variable, default code
if [ $# -ge  1 ]  ; then CLUSTER=${1} ; elif [ "${CLUSTER}" == "" ] ; then CLUSTER="us-tx-cluster-1/" ; fi
#       order of precedence: CLI argument, environment variable, default code
if [ $# -ge  3 ]  ; then DATA_DIR=${2} ; elif [ "${DATA_DIR}" == "" ] ; then DATA_DIR="/usr/local/data/" ; fi
#       order of precedence: CLI argument, environment variable, default code
if [ $# -ge  5 ]  ; then SYSTEMS_FILE=${3} ; elif [ "${SYSTEMS_FILE}" == "" ] ; then SYSTEMS_FILE="SYSTEMS" ; fi
if [ "${DEBUG}" == "1" ] ; then get_date_stamp ; echo -e "${NORMAL}${DATE_STAMP} ${LOCALHOST} ${0}[$$] ${SCRIPT_VERSION} ${LINENO} ${USER} ${USER_ID}:${GROUP_ID} ${BOLD}[DEBUG]${NORMAL}  CLUSTER >${CLUSTER}< DATA_DIR >${DATA_DIR}< SYSTEMS_FILE >${SYSTEMS_FILE}< PATH >${PATH}<" 1>&2 ; fi

###
#	REMOTECOMMAND="find /home/uadmin -type d \( -name 'git*' -o -name 'bitbucket' \)  -print"
#	REMOTECOMMAND="find ~/.. 2>/dev/null -type d -execdir test -d '.git' \; -print -prune"
REMOTECOMMAND="find ~/.. 2>/dev/null -type d -name '.git' -print"

#       Check if ${SYSTEMS_FILE} file is on system, one FQDN or IP address per line for all hosts in cluster
if ! [ -e ${DATA_DIR}/${CLUSTER}/${SYSTEMS_FILE} ] || ! [ -s ${DATA_DIR}/${CLUSTER}/${SYSTEMS_FILE} ] ; then
        get_date_stamp ; echo -e "${NORMAL}${DATE_STAMP} ${LOCALHOST} ${0}[$$] ${SCRIPT_VERSION} ${LINENO} ${USER} ${USER_ID}:${GROUP_ID} ${BOLD}[WARN]${NORMAL}  ${SYSTEMS_FILE} file missing or empty, creating ${SYSTEMS_FILE} file with local host.  Edit ${DATA_DIR}/${CLUSTER}/${SYSTEMS_FILE} file and add additional hosts that are in the cluster." 1>&2


        echo -e "###     List of hosts used by cluster-command.sh & create-message.sh"  > ${DATA_DIR}/${CLUSTER}/${SYSTEMS_FILE}
        echo -e "#       One FQDN or IP address per line for all hosts in cluster" > ${DATA_DIR}/${CLUSTER}/${SYSTEMS_FILE}
        echo -e "###" > ${DATA_DIR}/${CLUSTER}/${SYSTEMS_FILE}
        echo    "${LOCALHOST}" > ${DATA_DIR}/${CLUSTER}/${SYSTEMS_FILE}
fi

#	Loop through hosts in ${SYSTEMS_FILE} file
REMOTEHOST=$(grep -v "#" ${DATA_DIR}/${CLUSTER}/${SYSTEMS_FILE})
for NODE in ${REMOTEHOST} ; do
        echo -e "\n${BOLD}  -->  ${NODE}${NORMAL}       ->${REMOTECOMMAND}<-" 
        if [ "${LOCALHOST}" != "${NODE}" ] ; then
                ssh -t "${USER}"@"${NODE}" "${REMOTECOMMAND}"
        else
                eval "${REMOTECOMMAND}"
        fi
done

#
get_date_stamp ; echo -e "${NORMAL}${DATE_STAMP} ${LOCALHOST} ${0}[$$] ${SCRIPT_VERSION} ${LINENO} ${USER} ${USER_ID}:${GROUP_ID} ${BOLD}[INFO]${NORMAL}  Operation finished." 1>&2
###
