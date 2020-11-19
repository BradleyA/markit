#!/bin/bash
# 	find-code.sh  4.1.123.1049  2020-11-18T22:04:06.530310-06:00 (CST)  https://github.com/BradleyA/markit  master  uadmin  five-rpi3b.cptx86.com 4.1.122  
# 	   find-code.sh -->   testing  
# 	find-code.sh  4.1.108.1030  2020-11-12T13:13:54.908899-06:00 (CST)  https://github.com/BradleyA/markit  master  uadmin  five-rpi3b.cptx86.com 4.1.107 
# 	   find-code.sh -->   Production standard 9.3.606 Parse CLI options and arguments  
# 	find-code.sh  4.1.88.986  2020-10-25T22:59:40.978813-05:00 (CDT)  https://github.com/BradleyA/markit  master  uadmin  five-rpi3b.cptx86.com 4.1.87  
# 	   find-code.sh -->   Production standard 7.3.602 Default variable value  
# 	find-code.sh  4.1.58.954  2020-10-24T11:03:05.670656-05:00 (CDT)  https://github.com/BradleyA/markit  master  uadmin  five-rpi3b.cptx86.com 4.1.57  
# 	   find-code.sh -->   Production standard 0.3.595 --help  
# 	find-code.sh  4.1.25.912  2020-10-21T21:10:22.362937-05:00 (CDT)  https://github.com/BradleyA/markit  master  uadmin  five-rpi3b.cptx86.com 4.1.24 
# 	   find-code.sh -->   add test case for no found DATA_DIR and CLUSTER  
# 	find-code.sh  4.1.22.908  2020-10-21T14:20:37.170990-05:00 (CDT)  https://github.com/BradleyA/markit  master  uadmin  five-rpi3b.cptx86.com 4.1.21  
# 	   find-code.sh -->   begin testing options  
#86# find-code.sh - Search systems from clones from repositories
###  Production standard 5.3.559 Copyright                                    # 3.559
#    Copyright (c) 2020 Bradley Allen                                                # 3.555
#    MIT License is online in the repository as a file named LICENSE"         # 3.559
###  Production standard 3.0 shellcheck
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
PURPLE=$(tput setaf 5)
CYAN=$(tput   setaf 6)
WHITE=$(tput  setaf 7)

###  Production standard 7.3.602 Default variable value
DEFAULT_CLUSTER="us-tx-cluster-1/"
DEFAULT_DATA_DIR="/usr/local/data/"
DEFAULT_SYSTEMS_FILE="SYSTEMS"

###  Production standard 8.3.541 --usage
COMMAND_NAME=$(echo "${0}" | sed 's/^.*\///')                                               # 3.541
display_usage() {
echo -e "\n${NORMAL}${COMMAND_NAME}\n   Search systems for .git repositories"
echo -e "\n${BOLD}USAGE${NORMAL}"
echo -e "   ${COMMAND_NAME} [-c <CLUSTER>] [-d <DATA_DIR>] [-s <SYSTEMS_FILE>]\n"
echo    "   ${COMMAND_NAME} [--help | -help | help | -h | h | -?]"
echo    "   ${COMMAND_NAME} [--usage | -usage | -u]"
echo    "   ${COMMAND_NAME} [--version | -version | -v]"
}

###  Production standard 0.3.595 --help
display_help() {
display_usage
#    Displaying help DESCRIPTION in English en_US.UTF-8, en.UTF-8, C.UTF-8
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

###  Production standard 4.3.587 Documentation Language                                     # 3.550
#    Displaying help DESCRIPTION in French fr_CA.UTF-8, fr_FR.UTF-8, fr_CH.UTF-8
if [[ "${LANG}" == "fr_CA.UTF-8" ]] || [[ "${LANG}" == "fr_FR.UTF-8" ]] || [[ "${LANG}" == "fr_CH.UTF-8" ]] ; then
  echo -e "\n--> ${LANG}"
  echo    "<Votre aide va ici>" # Your help goes here
  echo    "Souhaitez-vous traduire la section description?" # Would you like to translate the description section?
elif ! [[ "${LANG}" == "en_US.UTF-8" ||  "${LANG}" == "en.UTF-8" || "${LANG}" == "C.UTF-8" ]] ; then  # 3.550
  new_message "${LINENO}" "${YELLOW}INFO${WHITE}" "  Your language, ${LANG}, is not supported.  Would you like to translate the description section?" 1>&2
fi

echo -e "\n${BOLD}ENVIRONMENT VARIABLES${NORMAL}"
echo    "If using the bash shell, enter; 'export DEBUG=1' on the command line to set"
echo    "the environment variable DEBUG to '1' (0 = debug off, 1 = debug on).  Use the"
echo    "command, 'unset DEBUG' to remove the exported information from the environment"
echo    "variable DEBUG.  You are on your own defining environment variables if"
echo    "you are using other shells."

###  Production standard 1.3.550 DEBUG variable                                             # 1.3.550
echo    "   DEBUG           (default off '0')  The DEBUG environment variable can be set"   # 1.3.550
echo    "                   to 0, 1, 2, 3, 4 or 5.  The setting '' or 0 will turn off"      # 1.3.550
echo    "                   all DEBUG messages during execution of this script.  The"       # 1.3.550
echo    "                   setting 1 will print all DEBUG messages during execution."      # 1.3.550
echo    "                   Setting 2 (set -x) will print a trace of simple commands"       # 1.3.550
echo    "                   before they are executed.  Setting 3 (set -v) will print"       # 1.3.550
echo    "                   shell input lines as they are read.  Setting 4 (set -e) will"   # 1.3.550
echo    "                   exit immediately if non-zero exit status is recieved with"      # 1.3.550
echo    "                   some exceptions.  Setting 5 (set -e -o pipefail) will do"       # 1.3.550
echo    "                   setting 4 and exit if any command in a pipeline errors.  For"   # 1.3.550
echo    "                   more information about the set options, see man bash."          # 1.3.550
#
echo    "   CLUSTER         Cluster name (default '${DEFAULT_CLUSTER}')"
echo    "   DATA_DIR        Data directory (default '${DEFAULT_DATA_DIR}')"
echo    "   SYSTEMS_FILE    Name of file that includes hosts in cluster"
echo    "                   (default '${DEFAULT_SYSTEMS_FILE}')"

echo -e "\n${BOLD}OPTIONS${NORMAL}"
echo -e "Order of precedence: CLI options, environment variable, default value.\n"                     # 0.3.595
echo    "   --help, -help, help, -h, h, -?"                                                            # 0.3.595
echo -e "\tOn-line brief reference manual\n"                                                           # 0.3.595
echo    "   --usage, -usage, -u"                                                                       # 0.3.595
echo -e "\tOn-line command usage\n"                                                                    # 0.3.595
echo    "   --version, -version, -v"                                                                   # 0.3.595
echo -e "\tOn-line command version\n"                                                                  # 0.3.595
#
echo    "   --cluster <CLUSTER>, -c <CLUSTER>, --cluster=<CLUSTER>, -c=<CLUSTER>"                      # 0.3.595
echo -e "\tCluster name (default '${DEFAULT_CLUSTER}')\n"
echo    "   --datadir <DATA_DIR>, -d <DATA_DIR>, --datadir=<DATA_DIR>, -d=<DATA_DIR>"                  # 0.3.595
echo -e "\tData directory (default '${DEFAULT_DATA_DIR}')\n"
echo    "   --systems <SYSTEMS_FILE>, -s <SYSTEMS_FILE>, --systems=<SYSTEMS_FILE>, -s=<SYSTEMS_FILE>"  # 0.3.595
echo -e "\tName of systems file (default '${DEFAULT_SYSTEMS_FILE}')"

###  Production standard 6.3.547  Architecture tree
echo -e "\n${BOLD}ARCHITECTURE TREE${NORMAL}"  # STORAGE & CERTIFICATION
echo    "/usr/local/data/                           <-- <DATA_DIR>"
echo    "└── <CLUSTER>/                             <-- <CLUSTER>"
echo    "    └── SYSTEMS                            <-- List of hosts in cluster"

echo -e "\n${BOLD}DOCUMENTATION${NORMAL}"
echo    "   ${UNDERLINE}https://github.com/BradleyA/markit/blob/master/README.md${NORMAL}"

echo -e "\n${BOLD}EXAMPLES${NORMAL}"
echo -e "   Search systems for .git repositories using defaults\n\t${BOLD}${COMMAND_NAME}${NORMAL}\n"  # 0.3.595
echo -e "   Search systems for .git repositories using a different <CLUSTER>.\n\t${BOLD}${COMMAND_NAME} -c australia-southeast1 ${NORMAL}\n" # 0.3.595
echo -e "   Search systems for .git repositories using a different <SYSTEMS_FILE>.\n\t${BOLD}${COMMAND_NAME} -s SYSTEMS-RASPBERRY ${NORMAL}" # 0.3.595

echo -e "\n${BOLD}SEE ALSO${NORMAL}"                                                                   # 0.3.595
echo    "   ${BOLD}markit${NORMAL} (${UNDERLINE}https://github.com/BradleyA/markit/blob/master/README.md#markit------${NORMAL})" # 0.3.595
echo    "   ${BOLD}check-markit${NORMAL}  (${UNDERLINE}https://github.com/BradleyA/markit/blob/master/README.md#usage-check-markit${NORMAL})" # 0.3.595

echo -e "\n${BOLD}AUTHOR${NORMAL}"
echo    "   ${COMMAND_NAME} was written by Bradley Allen <allen.bradley@ymail.com>"

echo -e "\n${BOLD}REPORTING BUGS${NORMAL}"                                                             # 0.3.595
echo    "   Report ${COMMAND_NAME} bugs ${UNDERLINE}https://github.com/BradleyA/markit/issues/new/choose${NORMAL}"  # 0.3.595

###  Production standard 5.3.559 Copyright
echo -e "\n${BOLD}COPYRIGHT${NORMAL}"
echo    "   Copyright (c) 2020 Bradley Allen"
echo    "   MIT License is online in the repository as a file named LICENSE"
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

###  Production standard 2.3.578 Log format (WHEN WHERE WHAT Version Line WHO UID:GID [TYPE] Message)
new_message() {  #  $1="${LINENO}"  $2="DEBUG INFO ERROR WARN"  $3="message"
  get_date_stamp
  echo -e "${NORMAL}${DATE_STAMP} ${LOCALHOST} ${SCRIPT_NAME}[$$] ${BOLD}${BLUE}${SCRIPT_VERSION} ${PURPLE}${1}${NORMAL} ${USER} ${UID}:${GROUP_ID} ${BOLD}[${2}]${NORMAL}  ${3}"
}

#    INFO
if [[ "${DEBUG}" == "1" ]] ; then new_message "${LINENO}" "${YELLOW}INFO${WHITE}" "  Started..." 1>&2 ; fi  #  2.3.578

#    Added following code because USER is not defined in crobtab jobs
if ! [[ "${USER}" == "${LOGNAME}" ]] ; then  USER=${LOGNAME} ; fi
if [[ "${DEBUG}" == "1" ]] ; then new_message "${LINENO}" "DEBUG" "  Setting USER to support crobtab...  USER >${YELLOW}${USER}${WHITE}<  LOGNAME >${YELLOW}${LOGNAME}${WHITE}<" 1>&2 ; fi  #  2.3.578

#    DEBUG
if [[ "${DEBUG}" == "1" ]] ; then new_message "${LINENO}" "DEBUG" "  Name_of_command >${YELLOW}${SCRIPT_NAME}${WHITE}< Name_of_arg1 >${YELLOW}${1}${WHITE}< Name_of_arg2 >${YELLOW}${2}${WHITE}< Name_of_arg3 >${YELLOW}${3}${WHITE}<  Version of bash ${YELLOW}${BASH_VERSION}${WHITE}" 1>&2 ; fi  #  2.3.578

###  Production standard 9.3.606 Parse CLI options and arguments
while [[ "${#}" -gt 0 ]] ; do
  case "${1}" in
    --help|-help|help|-h|h|-\?)  display_help | more ; exit 0 ;;
    --usage|-usage|usage|-u)  display_usage ; exit 0  ;;
    --version|-version|version|-v)  echo "${SCRIPT_NAME} ${SCRIPT_VERSION}" ; exit 0  ;;
    -c|--cluster)  if [[ "${2}" == "" ]] ; then echo -e "\n${BOLD}    Argument for ${YELLOW}${1}${WHITE} is not found on command line.${NORMAL}\n" ; exit 1 ; fi ; CLUSTER=${2} ; shift 2  ;;  # 9.3.596
    -c=*|--cluster=*) CLUSTER="${1#*=}" ;      if [[ "${CLUSTER}" == "" ]]      ; then echo -e "\n${BOLD}    Argument for ${YELLOW}${1}${WHITE} is not found on command line.${NORMAL}\n" ; exit 1 ; fi ; shift  ;;  # 9.3.596
    -d|--datadir)  if [[ "${2}" == "" ]] ; then echo -e "\n${BOLD}    Argument for ${YELLOW}${1}${WHITE} is not found on command line.${NORMAL}\n" ; exit 1 ; fi ; DATA_DIR=${2} ; shift 2  ;;  # 9.3.596
    -d=*|--datadir=*) DATA_DIR="${1#*=}" ;     if [[ "${DATA_DIR}" == "" ]]     ; then echo -e "\n${BOLD}    Argument for ${YELLOW}${1}${WHITE} is not found on command line.${NORMAL}\n" ; exit 1 ; fi ; shift  ;;  # 9.3.596
    -s|--systems)  if [[ "${2}" == "" ]] ; then echo -e "\n${BOLD}    Argument for ${YELLOW}${1}${WHITE} is not found on command line.${NORMAL}\n" ; exit 1 ; fi ; SYSTEMS_FILE=${2} ; shift 2  ;;  # 9.3.596
    -s=*|--systems=*) SYSTEMS_FILE="${1#*=}" ; if [[ "${SYSTEMS_FILE}" == "" ]] ; then echo -e "\n${BOLD}    Argument for ${YELLOW}${1}${WHITE} is not found on command line.${NORMAL}\n" ; exit 1 ; fi ; shift  ;;  # 9.3.596
    *) echo -e "\n${BOLD}    Invalid option, ${YELLOW}${1}${WHITE}, try ${YELLOW}--usage${NORMAL}\n" ; exit 1 ; ;; # 9.3.606
  esac
done

###

###  Production standard 7.3.602 Default variable value
#    Order of precedence: CLI argument, environment variable, default code
if [[ "${CLUSTER}" == "" ]] ; then CLUSTER="${DEFAULT_CLUSTER}" ; fi
if [[ "${DATA_DIR}" == "" ]] ; then DATA_DIR="${DEFAULT_DATA_DIR}" ; fi
if [[ "${SYSTEMS_FILE}" == "" ]] ; then SYSTEMS_FILE="${DEFAULT_SYSTEMS_FILE}" ; fi
if [[ "${DEBUG}" == "1" ]] ; then new_message "${LINENO}" "DEBUG" "  CLUSTER >${CLUSTER}< DATA_DIR >${DATA_DIR}< SYSTEMS_FILE >${SYSTEMS_FILE}< PATH >${PATH}<" 1>&2 ; fi
#
#    Check if ${DATA_DIR} directory is on system
if ! [[ -d "${DATA_DIR}" ]] ; then
  new_message "${LINENO}" "${RED}ERROR${WHITE}" "  Path to cluster data directory, ${DATA_DIR}, not found." 1>&2
  exit 1
fi
#
#    Check if ${CLUSTER} directory is on system
if ! [[ -d "${DATA_DIR}"/"${CLUSTER}" ]] ; then
  new_message "${LINENO}" "${RED}ERROR${WHITE}" "  Cluster directory name, ${CLUSTER}, not found." 1>&2
  exit 1
fi
#
#    Check if ${SYSTEMS_FILE} file contains /
if [[  "${SYSTEMS_FILE}" == *"/"* ]] ; then
  new_message "${LINENO}" "${RED}ERROR${WHITE}" "  SYSTEMS filename, ${SYSTEMS_FILE}, includes a '/'." 1>&2
  exit 1
fi
#
#    Check if ${SYSTEMS_FILE} file is on system, one FQDN or IP address per line for all hosts in cluster
if ! [[ -e "${DATA_DIR}"/"${CLUSTER}"/"${SYSTEMS_FILE}" ]] || ! [[ -s "${DATA_DIR}"/"${CLUSTER}"/"${SYSTEMS_FILE}" ]] ; then
  new_message "${LINENO}" "${YELLOW}WARN${WHITE}" "  Name of systems file, ${SYSTEMS_FILE} not found or empty.  Creating ${SYSTEMS_FILE} file and including local host.  Edit ${DATA_DIR}/${CLUSTER}/${SYSTEMS_FILE} file and add additional hosts that are in the cluster." 1>&2
  echo -e "###     List of hosts used by cluster-command.sh & create-message.sh"  > "${DATA_DIR}/${CLUSTER}/${SYSTEMS_FILE}"
  echo -e "#       One FQDN or IP address per line for all hosts in cluster" > "${DATA_DIR}/${CLUSTER}/${SYSTEMS_FILE}"
  echo -e "###" > "${DATA_DIR}/${CLUSTER}/${SYSTEMS_FILE}"
  echo    "${LOCALHOST}" > "${DATA_DIR}/${CLUSTER}/${SYSTEMS_FILE}"
fi

#    Loop through hosts in ${SYSTEMS_FILE} file
REMOTE_COMMAND="find ~/.. 2>/dev/null -type d -name '.git' -print | sed 's/^.*\.\./   \~/' | sed 's/\/\.git//'"
REMOTEHOST=$(grep -v "#" "${DATA_DIR}/${CLUSTER}/${SYSTEMS_FILE}")
for NODE in ${REMOTEHOST} ; do
  echo -e "\n${BOLD}  -->  ${CYAN}${NODE}${NORMAL}    ->${PURPLE}${REMOTE_COMMAND}${WHITE}<-"
  if [[ "${LOCALHOST}" != "${NODE}" ]] ; then
    ssh -t "${USER}"@"${NODE}" "echo -e '${BOLD}${YELLOW}\c' ; ${REMOTE_COMMAND} ; echo -e '${NORMAL}\c'"
  else
    eval "echo -e '${BOLD}${YELLOW}\c' ; ${REMOTE_COMMAND} ; echo -e '${NORMAL}\c'"
  fi
done

#
new_message "${LINENO}" "${YELLOW}INFO${WHITE}" "  Operation finished..." 1>&2
###
