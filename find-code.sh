#!/bin/bash
# 	find-code.sh  3.71.220  2018-09-04_17:12:40_CDT  https://github.com/BradleyA/markit  uadmin  six-rpi3b.cptx86.com 3.70  
# 	   move find-code.sh from user-work-files to markit 
# 	find-code.sh  1.7.28  2018-08-22_20:42:43_CDT  https://github.com/BradleyA/user-work-files.git  uadmin  six-rpi3b.cptx86.com 1.6  
# 	   change find command 
###
###
DEBUG=0                 # 0 = debug off, 1 = debug on
#	set -x
#	set -v
BOLD=$(tput bold)
NORMAL=$(tput sgr0)
###
display_help() {
echo -e "\n${NORMAL}${0} - Search systems from clones from repositories"
echo -e "\nUSAGE\n   ${0} [<path>/<HOSTFILE>]"
echo    "   ${0} [--help | -help | help | -h | h | -? | ?]"
echo    "   ${0} [--version | -version | -v]"
echo -e "\nDESCRIPTION\nThis script runs a command xxxxx ->"
echo    "xxx"
echo -e "\nOPTIONS\n"
echo    "   HOSTFILE   File with hostnames, default /usr/local/data/us-tx-cluster-1/SYSTEMS"
echo -e "\nDOCUMENTATION\nhttps://github.com/BradleyA/user-work-files"
echo -e "\nEXAMPLES\n   ${0}\n\n   what does it do\n"
if ! [ "${LANG}" == "en_US.UTF-8" ] ; then
	echo -e "${NORMAL}${0} ${LINENO} [${BOLD}WARNING${NORMAL}]:	Your language, ${LANG}, is not supported.\n\tWould you like to help?\n"	1>&2
fi
}
if [ "$1" == "--help" ] || [ "$1" == "-help" ] || [ "$1" == "help" ] || [ "$1" == "-h" ] || [ "$1" == "h" ] || [ "$1" == "-?" ] || [ "$1" == "?" ] ; then
	display_help
	exit 0
fi
if [ "$1" == "--version" ] || [ "$1" == "-version" ] || [ "$1" == "version" ] || [ "$1" == "-v" ] ; then
	head -2 ${0} | awk {'print$2"\t"$3'}
	exit 0
fi
###
HOSTFILE=${1:-"/usr/local/data/us-tx-cluster-1/SYSTEMS"}
LOCALHOST=`hostname -f`
#	REMOTECOMMAND="find /home/uadmin -type d \( -name 'git*' -o -name 'bitbucket' \)  -print"
REMOTECOMMAND="find ~/.. -type d -execdir test -d '.git' \; -print -prune"
#
if [ "${DEBUG}" == "1" ] ; then echo -e "> DEBUG ${LINENO}  LOCALHOST >${LOCALHOST}<  HOSTFILE >${HOSTFILE}<" 1>&2 ; fi
#       Check for ${HOSTFILE} file
if [ ! -e ${HOSTFILE} ] ; then
        echo -e "${0} ${LINENO} [WARN]:        ${HOSTFILE} NOT found"   1>&2
        exit 0
fi
REMOTEHOST=`grep -v "#" ${HOSTFILE}`
for NODE in ${REMOTEHOST} ; do
        echo -e "\n${BOLD}  -->  ${NODE}${NORMAL}       ->${REMOTECOMMAND}<-" 
        if [ "${LOCALHOST}" != "${NODE}" ] ; then
                ssh -t ${USER}@${NODE} ${REMOTECOMMAND}
        else
                eval ${REMOTECOMMAND}
        fi
done
#
echo -e "${NORMAL}\n${0} ${LINENO} [${BOLD}INFO${NORMAL}]:	Done.\n"	1>&2
###
