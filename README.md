# markit
[![GitHub Stable Release](https://img.shields.io/badge/Release-4.1.8-blue.svg)](https://github.com/BradleyA/markit/releases/tag/4.1.8)
![GitHub Release Date](https://img.shields.io/github/release-date/BradleyA/markit?color=blue)
[![GitHub Commits Since](https://img.shields.io/github/commits-since/BradleyA/markit/4.1.8?color=orange)](https://github.com/BradleyA/markit/commits/)
[![GitHub Last Commits](https://img.shields.io/github/last-commit/BradleyA/markit.svg)](https://github.com/BradleyA/markit/commits/)

[![Open GitHub Issue](https://img.shields.io/badge/Open-Incident-brightgreen.svg)](https://github.com/BradleyA/markit/issues/new/choose)
[![GitHub Open Issues](https://img.shields.io/github/issues/BradleyA/markit?color=purple)](https://github.com/BradleyA/markit/issues?q=is%3Aopen+is%3Aissue)
[![GitHub Closed Issues](https://img.shields.io/github/issues-closed/BradleyA/markit?color=purple)](https://github.com/BradleyA/markit/issues?q=is%3Aclosed+is%3Aissue)

[<img alt="GitHub Clones" src="https://img.shields.io/static/v1?label=Clones&message=356&color=blueviolet">](https://github.com/BradleyA/markit/blob/master/images/clone.table.md)
[<img alt="GitHub Views" src="https://img.shields.io/static/v1?label=Views&message=1939&color=blueviolet">](https://github.com/BradleyA/markit/blob/master/images/view.table.md)
[![GitHub Size](https://img.shields.io/github/repo-size/BradleyA/markit.svg)](https://github.com/BradleyA/markit/)
![Language Bash](https://img.shields.io/badge/%20Language-bash-blue.svg)
[![MIT License](http://img.shields.io/badge/License-MIT-blue.png)](LICENSE)

## Goal
Answer one question over the phone by looking at the code; ***What version are you running?**

#### If you like this repository, select in the upper-right corner, [![GitHub stars](https://img.shields.io/github/stars/BradleyA/markit.svg?style=social&label=Star&maxAge=2592000)](https://GitHub.com/BradleyA/markit/stargazers/), thank you.

## Table of content
<details>

- [Description](#Description)
- [Objectives](#Objectives)
- [Quick Start Tutorials](#Quick-Start-Tutorials)
- [Clone](#Clone)
- [Install latest markit command](#Install-latest-markit-command)
- [Usage: markit](#Usage-markit)
- [Output: markit](#Output-markit)
- [Usage: check-markit](#Usage-check-markit)
- [Output: check-markit](#Output-check-markit)
- [Usage: find-code.sh](#Usage-find-codesh)
- [Output: find-code.sh](#Output-find-codesh)
----
- [Contribute](#Contribute)
- [Author](#Author)
- [Tested OS](#Tested-OS)
- [Design Principles](#Design-Principles)
- [License](#License)

</details>

----
  
## Description
Bash script that adds Git Verion Control information into files and pushes them to GitHub, Bitbucket, and/or GitLab.   Most scripts in this repository support --help and --usage options.

**Markit** is a bash script that is a wrapper around these Git commands; git add ${FILE_NAME}, git commit -m "${FILE_MESSAGE}", git tag -a ${RELEASE_VERSION}, and git push --follow-tags. It automates this Git commit process and adds two comment lines of metadata about file changes to all tracked modified files in your local Git repository.  This metadata allows any person to answer the question; What version are you running? 

Markit supports [Semantic Versioning](https://semver.org/) (MAJOR.MINOR.PATCH) and alphanumeric versioning (v0.1.64-alpha).  Markit will display the current version before prompting you to enter the next version.  Markit includes the number of commits with the version in the file(s).  I find this helpful when commiting several different changes while working on the same PATCH.

If environment variable MARKITLOCAL is set to 1, markit automates this git commit process, but does not push to GitHub repository or Bitbucket repository or GitLab project.  I find this helpful when working without network access to a remote Git repository.  If using the bash shell, enter; 'export MARKITLOCAL=1' on the command line to set the MARKITLOCAL environment variable to '1'.  Use the command, 'unset MARKITLOCAL' to remove the exported information from the MARKITLOCAL environment variable.  You are on your own defining environment variables if you are using other shells.

The two comment lines of metadata include:

 * file_name, version.commits, date, time, time zone, repository URL, Git branch, user, hostname, previous version
 * file name(s) updated and a one line breif description about changes made to the file(s)
 
Markit currently supports files with these file extensions:

c(c), C++(cc|cpp|c++|cxx), C header(h|H|hpp), C++ header(hxx|Hxx|HXX), Go(go), HTML(html|htm), Java(java|class|jar), JavaScript(js), Kotlin(kt|kts), Makefile(mk|MK), Pascal(p|pp|paa), Perl(pl|PL|psh), PHP(php|php3|php4|ph3|ph4), PowerShell(ps1|msh), Python(py), R(R), Ruby(rb), Rust(rs|rlib), Scala(scala|sc), Shell(sh|bash|csh|tcsh|ksh), Terraform(tf|tfstate), Text(txt), XML(xml), YAML(yml|yaml)

Markit currently supports these files without file extensions: Dockerfile, Makefile.  There will be a prompt to add comment character(s) for unknown file names when needed and a prompt to add a description about the changes.

[Return to top](https://github.com/BradleyA/markit/blob/master/README.md#markit)

## Objectives
<details>
  
* Any person without knowledge of Git or GitHub or Bitbucket or GitLab or markit to be able to answer one question; 
  **What version are you running?**
* Supports [Semantic Versioning](https://semver.org/) (MAJOR.MINOR.PATCH) and alphanumeric versioning (v0.1.64-alpha)
* Only update modified files by inserting two comment lines with metadata
* Insert the lines of metadata after the first line in files
* Support GitHub
* Use git commit message as part of metadata
* Use git tag as part of metadata
* Include date and remote Git repository as part of metadata
* Include path with filename in remote Git repository as part of metadata
* Don't create any requirements for markit other than the version and those required by Git
* Support several file extensions for comment character
* Support Bitbucket and GitLab
* Support Git local repository without network access (without 'git push')
* Support push to multiple Git remote repositories at once (edit .git/config)
* I use alias release-notes='git log --graph --pretty=format:'\''%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset'\'' --abbrev-commit' to help build release notes

[Return to top](https://github.com/BradleyA/markit/blob/master/README.md#markit)

</details>

## Quick Start Tutorials

1) First make a copy of or fork this GitHub repository so you can modify the test files while learning how simple it is to work with markit.

* To fork a GitHub repository you need to be logged into your GitHub account.

* Go to repository **https://github.com/BradleyA/markit**

* Click the fork icon in the upper right

2) Second download or clone the forked copy of markit from your GitHub \<YOUR-USERNAME\>/markit to your Linux system.

* Enter the following command with the name of your repository,
    
      git clone https://github.com/<YOUR-USERNAME>/markit.git

* Change into the cloned directory on your Linux system.

      cd markit

3) Third make a change to the file, testfiles/sample.sh, then git tag, git commit, and git push the change to your local and remote GitHub repository.

* Make any change to testfiles/sample.sh.

      vi testfiles/sample.sh
    
* Run ./markit and enter the next version number when prompted and a brief description of the changes to testfiles/sample.sh.  You will be prompted for your GitHub password when Git pushes testfiles/sample.sh to your remote GitHub repository. 

    ./markit

 **That is it!**
 
Check if your local version of testfiles/sample.sh is the same version that is on your remote Git repository.

    ./check-markit -f ./testfiles/sample.sh

On GitHub go to your Forked markit repository settings page and check the box next to Issues. Then open the first GitHub issue on your forked markit Git repository, #1.

Modify test file, testfiles/sample.sh, by adding a blank line to learn how markit works.

    vi testfiles/sample.sh
    
    #!/bin/bash
    #   testfiles/sample.sh  3.197.368  2019-02-08T20:33:53.600661-06:00 (CST)  https://github.com/BradleyA/markit  uadmin  six-rpi3b.cptx86.com 3.196-1-g46f4c0d  
    #      test markit for sample.sh 
    #
    #   ./sample.sh
    ###
    
    echo "Hello World"

Run ./markit.  Enter the next version number when prompted and this brief description '[testing markit issue changes close #1](https://help.github.com/articles/closing-issues-using-keywords/)'.  You will be prompted for your GitHub password when git pushes testfiles/sample.sh to your remote forked markit Git repository.

    ./markit
    
The file testfiles/sample.sh has been updated with metadata, git tag, git commit, git push, and the issue #1 on GitHub has been [closed](https://help.github.com/articles/closing-issues-using-keywords/).

View ./markit help pages to learn more about how markit works with tracked and untracked files and without network access to remote Git repository. 

    ./markit --help

Continue testing with the other test files to help you integrate markit with your development solutions.  Open a GitHub issue and then modify two test files.   When running markit enter a message and include the GitHub issue number and GitHub will update the issue.

#### If you like this repository, select in the upper-right corner, [![GitHub stars](https://img.shields.io/github/stars/BradleyA/markit.svg?style=social&label=Star&maxAge=2592000)](https://GitHub.com/BradleyA/markit/stargazers/), thank you.

[Return to top](https://github.com/BradleyA/markit/blob/master/README.md#markit)

## Clone

To Install, change into a directory that you want to download the scripts. Use git to pull or clone these scripts into the directory. If you do not have Git installed then enter; "sudo apt-get install git" if using Debian/Ubuntu. Other Linux distribution install methods can be found here: https://git-scm.com/download/linux. On the GitHub page of this script use the "HTTPS clone URL" with the 'git clone' command.

    git clone https://github.com/BradleyA/markit
    cd markit

Copy markit, check-markit, and find-code.sh to a directory that is included in your PATH (/usr/local/bin or ~/bin).

    cp -p {./markit,./check-markit,./find-code.sh} /usr/local/bin

[Return to top](https://github.com/BradleyA/markit/blob/master/README.md#markit)

## Install latest markit command
To install the latest commit of markit, change to the directory you want to download the script to (cd /usr/local/bin) and enter the follow command.

    curl -L https://api.github.com/repos/BradleyA/markit/tarball | tar -xzf - --wildcards BradleyA-markit-*/markit ; mv BradleyA-markit-*/markit . ; rm -r BradleyA-markit-*


To install the latest commit of check-markit, change markit to check-markit in the above command.

[Return to top](https://github.com/BradleyA/markit/blob/master/README.md#markit)

## Usage: markit
Mark **tracked modified file(s)**, in your local Git repository and push those changes to a remote Git repository.  This example shows markit pushing to three remote Git repositories; GitHub, GitLab, and Bitbucket.  Enter **markit --help** to see how .git/config was edited to support three repositories.

    markit 

[Return to top](https://github.com/BradleyA/markit/blob/master/README.md#markit)

## Output: markit

    $ markit
    Files to be marked and pushed to remote Git repository:

    testfiles/sample.sh

    Current Git repository release number:  4.1.5
    Enter release number to commit files (examples:  3.217  3.1.231  v0.1.64-alpha) or ctrl-c to stop.

    4.1.6

    Using release number:  4.1.6

    Enter a one line description about the changes or ctrl-c to stop.
    	(example:  testfiles/sample.sh   Added logic for --help; closes #12, resolves #14):

    testing markit after editing testfiles/sample.sh

    	testfiles/sample.sh	sh

    [master ef33d26] testfiles/sample.sh -->   testing markit after editing testfiles/sample.sh
     1 file changed, 1 insertion(+), 2 deletions(-)
    Counting objects: 5, done.
    Delta compression using up to 4 threads.
    Compressing objects: 100% (5/5), done.
    Writing objects: 100% (5/5), 617 bytes | 0 bytes/s, done.
    Total 5 (delta 3), reused 0 (delta 0)
    remote: Resolving deltas: 100% (3/3), completed with 3 local objects.
    To https://github.com/BradleyA/markit.git
       1331dac..ef33d26  master -> master
     * [new tag]         4.1.6 -> 4.1.6
    Counting objects: 5, done.
    Delta compression using up to 4 threads.
    Compressing objects: 100% (5/5), done.
    Writing objects: 100% (5/5), 617 bytes | 0 bytes/s, done.
    Total 5 (delta 3), reused 0 (delta 0)
    To https://axebbq@bitbucket.org/axebbq/markit.git
       1331dac..ef33d26  master -> master
     * [new tag]         4.1.6 -> 4.1.6
    Counting objects: 5, done.
    Delta compression using up to 4 threads.
    Compressing objects: 100% (5/5), done.
    Writing objects: 100% (5/5), 617 bytes | 0 bytes/s, done.
    Total 5 (delta 3), reused 0 (delta 0)
    To https://BradleyAxe@gitlab.com/BradleyAxe/markit.git
       1331dac..ef33d26  master -> master
     * [new tag]         4.1.6 -> 4.1.6

    Files marked and stored in remote Git repository.
    View commits example:  git log --graph --decorate --oneline --color --stat
    2020-09-10T16:46:14.812944-05:00 (CDT) five-rpi3b.cptx86.com markit[28951] 4.1.4.803 434 uadmin 10000:10000 [INFO]    Operation finished...

[Return to top](https://github.com/BradleyA/markit/blob/master/README.md#markit)

## Usage: check-markit
Check the release version of a file with the remote Git repository release version.  The **check-markit** script allows you to check if there is a newer release version of a file.  The following example uses the file 'markit', but can be used with any file that was marked with markit.

    check-markit markit 

[Return to top](https://github.com/BradleyA/markit/blob/master/README.md#markit)

## Output: check-markit
    $ check-markit markit
      % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                     Dload  Upload   Total   Spent    Left  Speed
      0     0    0     0    0     0      0      0 --:--:-- --:--:-- --:--:--     0
    100 2386k    0 2386k    0     0   939k      0 --:--:--  0:00:02 --:--:-- 1412k

      /usr/local/bin/markit release 4.1.4.803, commit date 2020-08-29T22:25:50.210493-05:00

      markit repository release 4.1.4.803, commit date 2020-08-29T22:25:50.210493-05:00

    Repository copy placed in /tmp/markit
    2020-09-10T17:03:50.405525-05:00 (CDT) five-rpi3b.cptx86.com check-markit[747] 4.1.4.803 259 uadmin 10000:10000 [INFO]    Operation finished...

[Return to top](https://github.com/BradleyA/markit/blob/master/README.md#markit)

## Usage: find-code.sh
Search each system found in <DATA_DIR>/<CLUSTER>/<SYSTEMS_FILE> file for .git repositories in ~/.. directories.

    find-code.sh

[Return to top](https://github.com/BradleyA/markit/blob/master/README.md#markit)

## Output: find-code.sh
    2020-10-19T08:52:23.693833-05:00 (CDT) six-rpi3b.cptx86.com find-code.sh[8972] 4.1.10.856 169 uadmin 10000:10000 [INFO]    Started...

      -->  five-rpi3b.cptx86.com    ->find ~/.. 2>/dev/null -type d -name '.git' -print | sed 's/^.*\.\./   \~/' | sed 's/\/\.git//'<-
     # #####   All connections monitored   ##### #
       ~/uadmin/github/BradleyA/Linux-admin
       ~/uadmin/github/BradleyA/docker-security-infrastructure
       ~/uadmin/github/BradleyA/git-TEST-commit-automation
       ~/uadmin/github/BradleyA/pi-display
       ~/uadmin/github/BradleyA/markit
       ~/uadmin/github/BradleyA/git-TEST-commit
       ~/uadmin/github/BradleyA/Search-docker-registry-v2-script
       ~/uadmin/github/BradleyA/user-files
       ~/uadmin/github/animated-GIF/ttygif
       ~/uadmin/github/animated-GIF/ttyrec
       ~/uadmin/github/animated-GIF/gifsicle
       ~/uadmin/github/animated-GIF/giflossy
       ~/uadmin/temp/temp/docker-security-infrastructure
    Connection to five-rpi3b.cptx86.com closed.

      -->  six-rpi3b.cptx86.com    ->find ~/.. 2>/dev/null -type d -name '.git' -print | sed 's/^.*\.\./   \~/' | sed 's/\/\.git//'<-
       ~/uadmin/github/animated-GIF/ttygif
       ~/uadmin/github/animated-GIF/ttyrec
       ~/uadmin/github/animated-GIF/gifsicle
       ~/uadmin/github/animated-GIF/giflossy
       ~/uadmin/github/franiglesias/versiontag
       ~/bob/github/BradleyA/pi-display
    2020-10-19T08:52:24.919012-05:00 (CDT) six-rpi3b.cptx86.com find-code.sh[8972] 4.1.10.856 230 uadmin 10000:10000 [INFO]    Operation finished...

[Return to top](https://github.com/BradleyA/markit/blob/master/README.md#markit)

----

#### Contribute
Please do contribute!  Issues and pull requests are welcome.  Thank you for your help improving software.

[Return to top](https://github.com/BradleyA/markit/blob/master/README.md#markit)

#### Author
[<img id="github" src="images/github.png" width="50" a="https://github.com/BradleyA/">](https://github.com/BradleyA/)    [<img src="images/linkedin.png" style="max-width:100%;" >](https://www.linkedin.com/in/bradleyhallen) [<img id="twitter" src="images/twitter.png" width="50" a="twitter.com/bradleyaustintx/">](https://twitter.com/bradleyaustintx/)       <a href="https://twitter.com/intent/follow?screen_name=bradleyaustintx"> <img src="https://img.shields.io/twitter/follow/bradleyaustintx.svg?label=Follow%20@bradleyaustintx" alt="Follow @bradleyaustintx" />    </a>          [![GitHub followers](https://img.shields.io/github/followers/BradleyA.svg?style=social&label=Follow&maxAge=2592000)](https://github.com/BradleyA?tab=followers)

[Return to top](https://github.com/BradleyA/markit/blob/master/README.md#markit)

#### Tested OS
 * Ubuntu 14.04.6 LTS (amd64,armv7l)
 * Ubuntu 16.04.7 LTS (amd64,armv7l)
 * Ubuntu 18.04.5 LTS (amd64,armv7l)
 * Raspbian GNU/Linux 10 (buster)

[Return to top](https://github.com/BradleyA/markit/blob/master/README.md#markit)

#### Design Principles
 * Have a simple setup process and a minimal learning curve
 * Be usable as non-root
 * Be easy to install and configure
 
[Return to top](https://github.com/BradleyA/markit/blob/master/README.md#markit)

#### License
MIT License

Copyright (c) 2020  [Bradley Allen](https://www.linkedin.com/in/bradleyhallen)

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

[Return to top](https://github.com/BradleyA/markit/blob/master/README.md#markit)
