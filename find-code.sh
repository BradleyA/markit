#!/bin/bash
# 	find-code.sh  3.129.285  2018-10-31T21:19:55.719763-05:00 (CDT)  https://github.com/BradleyA/markit  uadmin  six-rpi3b.cptx86.com 3.128  
# 	   find-code.sh support environment variables close #44 
#
###	find-code.sh - Search systems from clones from repositories
#       Order of precedence: environment variable (export DEBUG=1), default code
if [ "${DEBUG}" == "" ] ; then DEBUG="0" ; fi	# 0 = debug off, 1 = debug on, 'unset DEBUG' to unset environment variable (bash)
#	set -x
#	set -v
BOLD=$(tput bold)
NORMAL=$(tput sgr0)
###
display_help() {
echo -e "\n${NORMAL}${0} - Search systems for .git repositories"
echo -e "\nUSAGE\n   ${0}  [<CLUSTER>] [<DATA_DIR>] [SYSTEMS_FILE]"
echo    "   ${0} [--help | -help | help | -h | h | -?]"
echo    "   ${0} [--version | -version | -v]"
echo -e "\nDESCRIPTION\nThis script searches each system found in SYSTEMS file for .git repositories"
echo    "in ~/.. directories."
echo -e "\nThis script reads /usr/local/data/us-tx-cluster-1/SYSTEMS file for hosts."
echo    "The hosts are one FQDN or IP address per line for all hosts in a cluster."
echo    "Lines in SYSTEMS file that begin with a # are comments.  The SYSTEMS file is"
echo    "used by Linux-admin/cluster-command/cluster-command.sh, markit/find-code.sh,"
echo    "pi-display/create-message/create-message.sh, and other scripts.  A different"
echo    "SYSTEMS file can be entered on the command line or environment variable."
echo -e "\nTo avoid many login prompts for each host in a cluster, enter the following:"
echo    "${BOLD}ssh-copy-id uadmin@<host-name>${NORMAL} to each host in the SYSTEMS file."
echo -e "\nEnvironment Variables"
echo    "If using the bash shell, enter; export CLUSTER='us-west1' on the command"
echo    "line to set the CLUSTER environment variable to 'us-west1'.  Use the command,"
echo    "unset CLUSTER to remove the exported information from the CLUSTER environment"
echo    "variable.  To set an environment variable to be defined at login, add it to"
echo    "~/.bashrc file or you can modify this script with your default location for"
echo    "CLUSTER, DATA_DIR, MESSAGE_FILE, and SYSTEMS_FILE.  You are on your own"
echo    "defining environment variables if you are using other shells."
echo    "   CLUSTER       (default us-tx-cluster-1/)"
echo    "   DATA_DIR      (default /usr/local/data/)"
echo    "   SYSTEMS_FILE  (default SYSTEMS)"
echo -e "\nOPTIONS"
echo    "   CLUSTER       name of cluster directory (default us-tx-cluster-1)"
echo    "   DATA_DIR      path to cluster data directory (default /usr/local/data/)"
echo    "   SYSTEMS_FILE  name of SYSTEMS file (default SYSTEMS)"
echo -e "\nDOCUMENTATION\nhttps://github.com/BradleyA/markit"
echo -e "\nEXAMPLES\n   ${0}\n\n   Search systems for .git repositories using defaults\n"
#       After displaying help in english check for other languages
if ! [ "${LANG}" == "en_US.UTF-8" ] ; then
        get_date_stamp ; echo -e "${NORMAL}${DATE_STAMP} ${0} ${SCRIPT_VERSION} ${LINENO} ${BOLD}[WARN]${NORMAL}  ${LOCALHOST}  ${USER}  ${USER_ID} ${GROUP_ID}  Your language, ${LANG}, is not supported, Would you like to help translate?" 1>&2
#       elif [ "${LANG}" == "fr_CA.UTF-8" ] ; then
#               get_date_stamp ; echo -e "${NORMAL}${DATE_STAMP} ${0} ${SCRIPT_VERSION} ${LINENO} ${BOLD}[WARN]${NORMAL}  ${LOCALHOST}  ${USER}  ${USER_ID} ${GROUP_ID}  Display help in ${LANG}" 1>&2
#       else
#               get_date_stamp ; echo -e "${NORMAL}${DATE_STAMP} ${0} ${SCRIPT_VERSION} ${LINENO} ${BOLD}[WARN]${NORMAL}  ${LOCALHOST}  ${USER}  ${USER_ID} ${GROUP_ID}  Your language, ${LANG}, is not supported.\tWould you like to translate?" 1>&2
fi
}

#       Date and time function ISO 8601
get_date_stamp() {
DATE_STAMP=`date +%Y-%m-%dT%H:%M:%S.%6N%:z`
TEMP=`date +%Z`
DATE_STAMP=`echo "${DATE_STAMP} (${TEMP})"`
}

#  Fully qualified domain name FQDN hostname
LOCALHOST=`hostname -f`

#  Version
SCRIPT_NAME=`head -2 ${0} | awk {'printf$2'}`
SCRIPT_VERSION=`head -2 ${0} | awk {'printf$3'}`

#       UID and GID
USER_ID=`id -u`
GROUP_ID=`id -g`

#       Default help and version arguments
if [ "$1" == "--help" ] || [ "$1" == "-help" ] || [ "$1" == "help" ] || [ "$1" == "-h" ] || [ "$1" == "h" ] || [ "$1" == "-?" ] ; then
        display_help
        exit 0
fi
if [ "$1" == "--version" ] || [ "$1" == "-version" ] || [ "$1" == "version" ] || [ "$1" == "-v" ] ; then
        echo "${SCRIPT_NAME} ${SCRIPT_VERSION}"
        exit 0
fi

#       INFO
get_date_stamp ; echo -e "${NORMAL}${DATE_STAMP} ${0} ${SCRIPT_VERSION} ${LINENO} ${BOLD}[INFO]${NORMAL}  ${LOCALHOST}  ${USER}  ${USER_ID} ${GROUP_ID}  Begin" 1>&2

#       DEBUG
if [ "${DEBUG}" == "1" ] ; then get_date_stamp ; echo -e "${NORMAL}${DATE_STAMP} ${0} ${SCRIPT_VERSION} ${LINENO} ${BOLD}[DEBUG]${NORMAL}  ${LOCALHOST}  ${USER}  ${USER_ID} ${GROUP_ID}  Name_of_command >${0}< Name_of_arg1 >${1}<" 1>&2 ; fi

#       Order of precedence: CLI argument, environment variable, default code
if [ $# -ge  1 ]  ; then CLUSTER=${1} ; elif [ "${CLUSTER}" == "" ] ; then CLUSTER="us-tx-cluster-1/" ; fi
#       order of precedence: CLI argument, environment variable, default code
if [ $# -ge  3 ]  ; then DATA_DIR=${2} ; elif [ "${DATA_DIR}" == "" ] ; then DATA_DIR="/usr/local/data/" ; fi
#       order of precedence: CLI argument, environment variable, default code
if [ $# -ge  5 ]  ; then SYSTEMS_FILE=${3} ; elif [ "${SYSTEMS_FILE}" == "" ] ; then SYSTEMS_FILE="SYSTEMS" ; fi
if [ "${DEBUG}" == "1" ] ; then get_date_stamp ; echo -e "${NORMAL}${DATE_STAMP} ${0} ${SCRIPT_VERSION} ${LINENO} ${BOLD}[DEBUG]${NORMAL}  ${LOCALHOST}  ${USER}  ${USER_ID} ${GROUP_ID}  CLUSTER >${CLUSTER}< DATA_DIR >${DATA_DIR}< SYSTEMS_FILE >${SYSTEMS_FILE}< PATH >${PATH}<" 1>&2 ; fi

###
#	REMOTECOMMAND="find /home/uadmin -type d \( -name 'git*' -o -name 'bitbucket' \)  -print"
REMOTECOMMAND="find ~/.. 2>/dev/null -type d -execdir test -d '.git' \; -print -prune"

#       Check if ${SYSTEMS_FILE} file is on system, one FQDN or IP address per line for all hosts in cluster
if ! [ -e ${DATA_DIR}/${CLUSTER}/${SYSTEMS_FILE} ] || ! [ -s ${DATA_DIR}/${CLUSTER}/${SYSTEMS_FILE} ] ; then
        get_date_stamp ; echo -e "${NORMAL}${DATE_STAMP} ${0} ${SCRIPT_VERSION} ${LINENO} ${BOLD}[WARN]${NORMAL}  ${LOCALHOST}  ${USER}  ${USER_ID} ${GROUP_ID}  ${SYSTEMS_FILE} file missing or empty, creating ${SYSTEMS_FILE} file with local host.  Edit ${DATA_DIR}/${CLUSTER}/${SYSTEMS_FILE} file and add additional hosts that are in the cluster." 1>&2
        echo -e "###     List of hosts used by cluster-command.sh & create-message.sh"  > ${DATA_DIR}/${CLUSTER}/${SYSTEMS_FILE}
        echo -e "#       One FQDN or IP address per line for all hosts in cluster" > ${DATA_DIR}/${CLUSTER}/${SYSTEMS_FILE}
        echo -e "###" > ${DATA_DIR}/${CLUSTER}/${SYSTEMS_FILE}
        hostname -f > ${DATA_DIR}/${CLUSTER}/${SYSTEMS_FILE}
fi

#	Loop through hosts in ${SYSTEMS_FILE} file
REMOTEHOST=`grep -v "#" ${DATA_DIR}/${CLUSTER}/${SYSTEMS_FILE}`
for NODE in ${REMOTEHOST} ; do
        echo -e "\n${BOLD}  -->  ${NODE}${NORMAL}       ->${REMOTECOMMAND}<-" 
        if [ "${LOCALHOST}" != "${NODE}" ] ; then
                ssh -t ${USER}@${NODE} ${REMOTECOMMAND}
        else
                eval ${REMOTECOMMAND}
        fi
done

#
get_date_stamp ; echo -e "${NORMAL}${DATE_STAMP} ${0} ${SCRIPT_VERSION} ${LINENO} ${BOLD}[INFO]${NORMAL}  ${LOCALHOST}  ${USER}  ${USER_ID} ${GROUP_ID}  Done." 1>&2
###
