**Notes:** Use the following example to guide you to; How to download an earlier release.

    git clone https://github.com/BradleyA/<REPOSITORY>.git --branch 2.42

## Next Version Under Construction {Version  4.2.????}  <img id="Construction" src="images/construction-icon.gif" width="120">
#### Release Name  prerelease
#### Release Date  ????
* Brief description

### Features Added
* Updated .github/ISSUE_TEMPLATE/feature_request.md changed command example
* Updated .github/ISSUE_TEMPLATE/incident_report.md changed command example
* Updated .gitignore added hooks/ directory to .gitignore for git-TEST-commit-automation testing
* Updated README.md
* check-markit 
  * Added unique temporary directory names to support automation,  close #84
  * Added find-code.sh to check-markit SEE ALSO section
* find-code.sh markit
  * change output color to help review of output
  * minor code cleanup
* markit
  * minor code cleanup

### Features Changes
### Features Deprecations

### Issues
* close #84  define unique temporary directory names to support automation

### Misc
* backlog
    * Need to test with [git-secrets](https://github.com/awslabs/git-secrets) (Prevents you from committing passwords and other sensitive information to a Git repository), should work [git-hound](https://github.com/ezekg/git-hound) (Git plugin that prevents sensitive data from being committed.)  [truffleHog](https://github.com/dxa4481/truffleHog) (Searches through git repositories for high entropy strings and secrets, digging deep into commit history)

# Latest Release -->  Version  4.1.8.836
#### Release Name  4.1.8
#### Release Date  2020-10-03T15:36:36.764370-05:00 (CDT)
* Added ISSUE_TEMPLATES, security policy - SECURITY.md, CHANGELOG.md, clone.table.md, view.table.md
* Added file name(s) to beginning of git commit message, line 2, to help locate file(s) that changed 
* Added branch name to line 1, to help locate changes to file(s)
* Added default BradleyA/git-TEST-commit-automation testcases

### Features Added
* Added .github/ISSUE_TEMPLATE/feature_request.md
* Added .github/ISSUE_TEMPLATE/incident-report.md
* Added .github/ISSUE_TEMPLATE/comment.md
* Added CHANGELOG.md
* Added SECURITY.md - create repository SECURITY.md, closes #78
* Added images/clone.table.md
* Added images/construction-icon.gif
* Added images/view.table.md
* Updated README.md
* Added default BradleyA/git-TEST-commit-automation testcases for testing during code development
* markit
    * Added display_help about how to git push to more than one repository
    * Updated Production standards 5.3.559 Copyright,  2.3.578 Log format,  9.3.562 Parse CLI options and arguments, closes #76
    * Automate adding file name(s) to beginning of message, closes #75
    * Added test cases, closes #73
    * Testing changes to markit add branch to line 1, closes #69
    * Testing with branching, closes #68
    * Added repository and branch to display_help, closes #82
* find-code.sh
    * Production standards:  5.3.550 Copyright, 0.3.550 --help, 4.3.550 Documentation Language, 1.3.550 DEBUG variable, closes #74
* check-markit
    * Updated Production Standards 3.550, closes #72
    * Added test cases, closes #73
    * Correct display-usage
    * Upgraded Production standards, closes #79

### Issues
* close #68  Testing with branching
* close #69  Testing changes to markit add branch to line 1
* close #71  Review: https://github.com/commitizen/cz-cli
* close #72  Updated Production Standards 3.550
* clone #73  Added test cases
* close #74  Production standards:  5.3.550 Copyright, 0.3.550 --help, 4.3.550 Documentation Language, 1.3.550 DEBUG variable
* close #75  Automate adding file name(s) to beginning of message
* close #76  Updated Production standards 5.3.559 Copyright,  2.3.578 Log format,  9.3.562 Parse CLI options and arguments
* close #78  Feature Request - SECURITY.md - create repository SECURITY.md
* close #79  Upgraded Production standards
* close #82  Added repository and branch to display_help

# Version  3.213.519
#### Release Name  3.213
#### Release Date  2019-06-07T20:00:24.218494-05:00 (CDT)
* Bug fix

### Features Added
* markit
    * Remove quotes from [ERROR] about requiring a git pull first, closes #67 

### Issues
* close #67  Remove quotes from [ERROR] about requiring a git pull first

# Version  3.212.517
#### Release Name  3.212
#### Release Date  2019-05-27T17:06:49.252530-05:00 (CDT)
* check-markit - changed output to include date vers version

### Features Added
* Updated README.md
* check-markit
    * Changed output to include date vers version, closs #66

### Issues
* close #66  Changed output to include date vers version

# Version  3.210.512
#### Release Name  3.210.512
#### Release Date  2019-05-21T13:32:34.729227-05:00 (CDT)
* Added file types for terraform

### Features Added
* Updated README.md
* markit
    * Added file types for terraform, closes #64
    * Test git push using markit to github, gitlab, and bitbucket, closes #63
    * From bitbucket includes github URL not Bitbucket URL on line 2, closes #62
    * Modified .git/config to push to github, gitlab, and bitbucket
    * Push-two-repository-test
    * Incident - retesting markit only works repositories that have been clone from a remote repository. something to do with master origin, closes #28
* find-code.sh 
    * failed to find any when in ~/kubernets, closes #45

### Issues
* close #28  Incident - retesting markit only works repositories that have been clone from a remote repository. something to do with master origin
* close #45  find-code.sh - failed to find any when in ~/kubernets
* close #62  From bitbucket includes github URL not Bitbucket URL on line 2
* close #63  Test git push using markit to github, gitlab, and bitbucket
* close #64  Added file types for terraform

# Version  3.197.368
#### Release Name  3.197
#### Release Date  2019-02-08T20:33:53.600661-06:00 (CST)
* Markit adds two comment lines with information about file changes to all
modified tracked file(s) in your local Git repository. Then pushes those
modified file(s) to either a GitHub repository or Bitbucket repository or
GitLab project. If environment variable MARKITLOCAL is set to 1, markit
adds two comment lines, commits modified tracked file(s) in your local
Git repository, but does not push to remote Git repository. I find this
helpful when working without network access to a remote Git repository.
* Added support for additional file types
* Moved find-code.sh from user-work-files to markit

### Features Added
* Updated LICENSE file
* Updated README.md, closes #60
* markit
    * Updated display_help
    * Added Environment Variables MARKITLOCAL to support markit on local system, closes #61
    * Updated user help message during failed git push
    * Updated user help message for untracked files
    * Tested with Makefile c ruby scala go
    * Added support for tcsh csh ksh etc, closes #59
    * Added presentation notes and slides
    * Updated production standard 5 include Copyright notice
    * Adapted to work with Bitbucket, closes #38
    * Updated production standard 4 update display_help LANGUAGE, closes #58
    * Added nano seconds to the 6 most significant digits
    * Order of precedence: add support for environment variable (export DEBUG=1), default code, closes #50
    * Changed log format and order, closes #49
    * shellcheck to clean up future minor incidents, closes #51
* check-markit
    * Added section for bitbucket check-markit include Bitbucket repository, closes #37
    * shellcheck to clean up future minor incidents, closes #52
    * Changed log format and order, closes #54
    * Order of precedence: add support for environment variable (export DEBUG=1), default code, closes #53
* find-code.sh
    * shellcheck to clean up future minor incidents, closes #57
    * Changed log format and order, closes #56
    * Order of precedence: add support for environment variable (export DEBUG=1), default code, closes #55
    * Support environment variables, closes #44
    * Completed display_help, closes #43

### Issues
* close #37  Added section for bitbucket check-markit include Bitbucket repository
* close #38  Adapted to work with Bitbucket
* close #43  Completed display_help
* close #44  Support environment variables
* close #49  Changed log format and order
* close #50  Order of precedence: add support for environment variable (export DEBUG=1), default code
* close #51  shellcheck to clean up future minor incidents
* close #52  shellcheck to clean up future minor incidents
* close #53  Order of precedence: add support for environment variable (export DEBUG=1), default code
* close #54  Changed log format and order
* close #55  Order of precedence: add support for environment variable (export DEBUG=1), default code
* close #56  Changed log format and order
* close #57  shellcheck to clean up future minor incidents
* close #58  Updated production standard 4 update display_help LANGUAGE
* close #59  Added support for tcsh csh ksh etc
* close #60  Added gitlog to README.md
* close #61  Added Environment Variables MARKITLOCAL to support markit on local system

# Version  3.120.273
#### Release Name  3.120
#### Release Date  2018-10-18T14:36:15-05:00 (CDT)
* Changed to get_date_stamp() function
* Added directory name to file_name so users can go directly to a file on GitHub or GitLab

### Features Added
* Update README.md
* markit
    * Added directory with file name on line one item 2, closes #39
    * Updated sample.sh
    * Changed echo or print DEBUG INFO WARNING ERROR, closes #40
* find-code.sh
    * Changed echo or print DEBUG INFO WARNING ERROR, closes #42
    * Updated for display_help, closes #43 
* check-markit
    * Changed echo or print DEBUG INFO WARNING ERROR, closes #41
    * Added ISO 8601 for date, closes #46

### Issues
* close #39  Added directory with file name on line one item 2
* close #40  Changed echo or print DEBUG INFO WARNING ERROR
* close #41  Changed echo or print DEBUG INFO WARNING ERROR
* close #42  Changed echo or print DEBUG INFO WARNING ERROR
* close #43  Updated for display_help
* close #46  check-markit Added ISO 8601 for date 
* close #47  README.md Added ISO 8601 for date
* close #48  duplicate incident

# Version  3.81.231
#### Release Name  3.81
#### Release Date  2018-09-27_06:07:59_CDT
* Correct incident with check-markit

### Features Added
* Added code to check if /usr/share/bash-completion/completions/git, closes #36
* No incident after testing, closes #33
* Updated README.md

### Issues
* close #33  No incident after testing
* close #36  Added code to check if /usr/share/bash-completion/completions/git

# Version  3.76.225
#### Release Name  3.76
#### Release Date  2018-09-10_13:56:21_CDT
* Includes the addition of check-markit, and find-code.sh commands to markit

### Features Added
* Updated sync to standard script design changes
* Moved find-code.sh from user-work-files to markit
* Changed grep <string-one> && <string-two, closes #32
* Redirect stderr to /dev/null to stop permission denied, closes #34
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
* backlog
