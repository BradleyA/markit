**Notes:** Use the following example to guide you to; How to download an earlier release.

    git clone https://github.com/BradleyA/<REPOSITORY>.git --branch 2.42
#### WARNING: These instructions are incomplete. Consider them as notes quickly drafted on a napkin rather than proper documentation!

# Version  3.5.126
#### Release Name  3.5
#### Release Date  2018-02-18_21:33:53_CST
* Brief description
* sub-repository
  * Brief description


### Features Added
* Updated comments and formating
* Added --version prompt
* Update README.md  install section and clone section
* Moved testfiles into testfile directory
  * testfiles/sample.*   updated sample.* files and .gitignore

### Features Deprecations
* Removed TEMP_MARKIT_FILE, closes #18

### Issues
* close #18  remove TEMP_MARKIT_FILE
* close #16  add --version prompt

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
* Update feature||file
* Added the following test cases
    * hooks/bin/EXAMPLES/FVT-exit-code-error-0-001
* sub-repository
  * directory/command   git commit message
  * directory/command   git commit message close #XX

### Features Changes
### Features Deprecations
### Issues
* close #X  directory/command   git commit message
* sub-repository
  * close #XX directory/command git commit message
  
### Misc
