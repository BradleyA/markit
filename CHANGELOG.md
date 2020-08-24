**Notes:** Use the following example to guide you to; How to download an earlier release.

    git clone https://github.com/BradleyA/<REPOSITORY>.git --branch 2.42
#### WARNING: These instructions are incomplete. Consider them as notes quickly drafted on a napkin rather than proper documentation!

# Version  3.76.225
#### Release Name  3.76
#### Release Date  2018-09-10_13:56:21_CDT
* Includes the addition of check-markit, and find-code.sh to markit

### Features Added
* Updated sync to standard script design changes
* Moved find-code.sh from user-work-files to markit
* Changed grep <string-one> && <string-two, closes #32
* redirect stderr to /dev/null to stop permission denied, closes #34
* check-markit: print commit date of local command, closes #35

### Issues
* close #32  check-markit: change grep <string-one> && <string-two
* close #34  find-code.sh redirect stderr to /dev/null to stop permission denied
* close #35  check-markit: print commit date of local command

# Version  3.66.212
#### Release Name  3.66
#### Release Date  2018-08-09_16:08:45_CDT
* help information about failed login solution

### Features Added
* markit
  * Added help information about failed login, closes #30
  * Added DEBUG lines and LANG check asking for LANG help, #17

### Issues
* close #30  markit add to help information about failed login

# Version  3.50.193
#### Release Name  3.50
#### Release Date  2018-08-05_21:08:54_CDT
* Added check-markit

### Features Added
* Changed formating of file names while processing those files
* Added check-markit
    * create new script to check if the current installed version is the latest version, closes #29
    * Updated display_help
    * Changed script name from markcheck to check-markit
    * check-markit work on Gitlab, closes #31

### Issues
* close #29  create new script to check if the current installed version is the latest version
* close #31  check-markit include GitLab repository

# Version  3.23.164
#### Release Name  3.23
#### Release Date  2018-07-22_23:11:39_CDT
* Issue WARNING

### Features Added
* Updated README.md to include GitLab information with GitHub information
* Issue WARNING if release number not greater than current release number, closes #14

### Issues
* close #14  Check if release number is newer than add tag reference with new release number

# Version  3.22.161
#### Release Name  3.22
#### Release Date  2018-07-21_22:46:13_CDT
* Use markit on GitLab

### Features Added
* Added comment to git push section
* Updated README.md
* Add ${BOLD} & ${NORMAL} to messages for stdout  closes #27
* error & exit 1 if repository not setup or not git cloned from remote repository, closes #28
* Modify text to use markit on GitLab, closes #26

### Issues
* close #26  modify text to use markit on GitLab
* close #27  Add ${BOLD} & ${NORMAL} to messages for stdout
* close #28  error & exit 1 if repository not setup or not git cloned from remote repository

# Version  3.15.152
#### Release Name  3.15
#### Release Date  2018-05-17_17:58:57_CDT
* New release, all issues closed and tested, ready for production

### Features Added
* Added -version
* Fixed fatal: No names found, cannot describe anything. closes #23

### Issues
* close #23  returned error : fatal: No names found, cannot describe anything

# Version  3.12.149
#### Release Name  3.12
#### Release Date  2018-03-18_13:30:07_CDT
* New release, all issues closed and tested, ready for production

### Features Added
* Updated push error messages
* Updated README.md

# Version  3.11.145
#### Release Name  3.11
#### Release Date  2018-02-27_19:16:56_CST
* New release, all issues closed and tested, ready for production

### Features Added
* Updated README.md
* Updated comments with issue numbers
* Added remote repository so I could determine where the code came from, closes #22
* Added version flag

### Issues
* close #22  add GitHub repository

# Version  3.8
#### Release Name  3.8
#### Release Date  Feb 21, 2018 
* New release, all issues closed and tested, ready for production

### Features Added
* Update README.md

# Version  3.7.130
#### Release Name  3.7
#### Release Date  2018-02-20_21:56:02_CST
* New release, all issues closed and tested, ready for production

### Features Changes
* testfiles/Dockerfile  Removed dockerfile debug statement
* change CURRENT_RELEASE command to work for 3.10 and across branches; closes #19
* markit fails if new code in new repository; closes #20

### Issues
* close #19  markit order of tags not displaying latest
  * change CURRENT_RELEASE command to work for 3.10 and across branches
* close #20  markit fails if new code in new repository

# Version  3.5.126
#### Release Name  3.5
#### Release Date  2018-02-18_21:33:53_CST
* New release, all issues closed and tested, ready for production

### Features Added
* Updated comments and formating
* Added --version prompt, closes #16
* Update README.md  install section and clone section
* Moved testfiles into testfile directory
  * testfiles/sample.*   updated sample.* files and .gitignore
  * testfiles/Dockerfile  Test for dockerfile, closes #12

### Features Deprecations
* Removed TEMP_MARKIT_FILE, closes #18

### Issues
* close #12  Test for dockerfile
* close #16  add --version prompt
* close #18  remove TEMP_MARKIT_FILE

# Version  3.4.102
#### Release Name  beta
#### Release Date  2018-02-12_21:42:38_CST
* New release, all issues closed and tested, ready for production

### Features Added
* Check argument $1 complete and tested, closes #3
* Updated display_help and continue working on case statement #5 and other typos
* Updated usage, description
* Updated README.md after markit rewrite, closes #6
* Added command usage, closes #4
* Completed ruff draft of comment file extension case statement #5
* Check if in Git repository; closes #7
* login failed during git push, closes #8
* Check if user has write permission; closes #9
* Start 3.2 beta release; major code rewrite for #5
* Added test cases sample.go sample.c sample.xml sample.scala sample.htm sample.rb dockerfile
* Start beta 3.3 for #5
* Display a list of untracked files at end, closes #10
* Support comments that use file extension to determine what type of comment, closes #5
* Remove deleted file when creating file list, closes #11
* Test for dockerfile, closes #12

### Issues
* close #3 check argument $1
* close #4 add command and help usage
* close #5 support comments that use file extension to determine what type of comment
* close #6 Updated README.md after markit rewrite
* close #7 markit; Not a git repository (or any of the parent directories): .git
* close #8 login failed during git push
* close #9 Check if user has write permission
* close #10 display a list of untracked files at end
* close #11 remove deleted file when creating file list
* close #12 Test for dockerfile

# Version  3.1.48
#### Release Name  alpha-2
#### Release Date  2018-02-07_22:39:36_CST
* Major rewrite to support multiple files

### Features Added
* Added FQDN to version line to help understand the system the code was tested on and add git commands
* Added license
* Added logic for errors and display_help
* Added sample.sh test case
* Corrected logic with line description string
* Added README.md
* Show current release when entering new release number closes #1
* Added an argument $1 to support -u for untracked files closes #2

### Issues
* close #1 show current release when entering new release number
* close #2 Add an argument $1 to support -u for untracked files

# Version  1.1
#### Release Name  alpha-1
#### Release Date  2017-12-18_19:09:50_CST
* markit
  * I created this script because git fails me when it comes to including the version 
	number and change description in the file being checked in.
	Maybe it does but I don't have the time to figure that out.
	Git helps with the team source code management challenge but omits the very basic
	function of version control, which was first developed with SCCS and RCS (%W% %G% %U%).
	Version control must place the version number in the text when code is checked in!
	Even if the code is a fork or branch of the orginal code!   Bite me

### Features Added
* Original Design with first draft ready for test.
* Added code to support one line description
  * Insert the file name, version, date, and programmer as the second line in the file.
  * Insert a one line breif description about the changes as a third line in the file.

### Misc
At a later time I need to see if I can add some git commands and use this script as a git wrapper
* Add change description message
  * git commit -m ‘$FILE_MESSAGE’ $FILE_NAME
* Add tag reference
  * git tag -a $FILE_RELEASE -m ‘$FILE_MESSAGE’
    
## EXAMPLE: Next Version Under Construction {Version  X.X.????}  <img id="Construction" src="images/construction-icon.gif" width="120">
# EXAMPLE: Latest Release -->  Version  X.X.????
#### Release Name  {unreleased rc-# alpha-# beta prerelease latest}
#### Release Date  ????
* Brief description
* sub-repository
  * Brief description

### Features Added
* Updated feature||file
* Added the following test cases
    * hooks/bin/EXAMPLES/FVT-exit-code-error-0-001
* sub-repository
  * directory/command   git commit message
  * directory/command   git commit message closes #XX

### Features Changes
### Features Deprecations
### Issues
* close #X  directory/command   git commit message
* sub-repository
  * close #XX directory/command git commit message
  
### Misc
