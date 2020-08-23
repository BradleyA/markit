**Notes:** Use the following example to guide you to; How to download an earlier release.

    git clone https://github.com/BradleyA/<REPOSITORY>.git --branch 2.42
#### WARNING: These instructions are incomplete. Consider them as notes quickly drafted on a napkin rather than proper documentation!

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
