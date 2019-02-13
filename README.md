# markit

## Goal
Answer one question over the phone by looking at the code; ***What version are you running?**

## Description
Markit is a bash script that adds two comment lines of metadata about file changes to all tracked modified files in your ``local Git repository``.  Then markit automates Git adding, commiting, tagging, and pushing those changed file(s) to either a **GitHub repository** or **Bitbucket repository** or **GitLab project**.  This metadata allows any person to answer; What version are you running?

Markit supports Semantic Versioning (MAJOR.MINOR.PATCH) and alphanumeric versioning.  Markit will display the current version before prompting you to enter the next version.  Markit includes the number of commits with the version in the file(s).  I find this helpful when commiting several different changes while working on the same PATCH.

If environment variable MARKITLOCAL is set to 1, markit adds two comment lines, commits modified tracked file(s) in your local Git repository, but does not push to remote Git repository.  I find this helpful when working without network access to a remote Git repository.  If using the bash shell, enter; 'export MARKITLOCAL=1' on the command line to set the MARKITLOCAL environment variable to '1'.  Use the command, 'unset MARKITLOCAL' to remove the exported information from the MARKITLOCAL environment variable.  You are on your own defining environment variables if you are using other shells.

The comment lines include:

 * file_name, file_version.commits, date, remote_repository, developer, hostname, parent git-tag-commit_number-hash
 * a one line breif description about the changes
 
Markit currently supports files with these file extensions:

c(c), C++(cc|cpp|c++|cxx), C header(h|H|hpp), C++ header(hxx|Hxx|HXX), Go(go), HTML(html|htm), Java(java|class|jar), JavaScript(js), Kotlin(kt|kts), Makefile(mk|MK), Pascal(p|pp|paa), Perl(pl|PL|psh), PHP(php|php3|php4|ph3|ph4), PowerShell(ps1|msh), Python(py), R(R), Ruby(rb), Rust(rs|rlib), Scala(scala|sc), Shell(sh|bash|csh|tcsh|ksh), Text(txt), XML(xml), YAML(yml|yaml)

Markit currently supports these files without file extensions: Dockerfile, Makefile.  There will be a prompt to add comment character(s) for unknown file names when needed and a prompt to add a description about the changes.
     
## Objectives
* Any person without knowledge of Git or GitHub or Bitbucket or GitLab or markit to be able to answer one question; 
  **What version are you running?**
* Supports Semantic Versioning (MAJOR.MINOR.PATCH) and alphanumeric versioning
* Only update modified files by inserting two comment lines with metadata
* Insert the lines of metadata after the first line in files
* Support GitHub
* Use git commit message as part of metadata
* Use git tag as part of metadata
* Include date and remote repository as part of metadata
* Include path with file in remote repository as part of metadata
* Include git commit number as part of metadata
* Don't create any requirements for markit other than those required by Git
* Same solution for several types of code
* Support Bitbucket or GitLab
* Include metadata to locate file on a remote repository
* Able to use markit on local Git repository without network access (without 'git push')
* Need to test with [git-secrets](https://github.com/awslabs/git-secrets), should work

## Clone
To clone, change to the directory you want to download into. Use git clone into the directory. If you do not have Git then enter; "sudo apt-get install git". On the GitHub page of this script use the "HTTPS clone URL" with the 'git clone' command.  Copy markit and check-markit to a directory include in your PATH (/usr/local/bin, ~/bin).

    git clone https://github.com/BradleyA/markit
    cd markit

## Usage
Mark a **tracked modified file**, in your local Git repository and push those changes to GitHub.

    markit 

## Output
    $ markit
    Files to be marked and pushed to  remote  repository:

    testfiles/sample.sh

    Current git repository release number:  3.196
    Enter release number to commit files (example 3.41.7) or ctrl-c to stop.

    3.197
    
    Using release number:  3.197

    Enter a one line description about the changes or ctrl-c to stop.
        (example: Added logic for --help; closes #12, resolves #14):

    test markit for sample.sh

        testfiles/sample.sh     sh

    [master 7cfa702] test markit for sample.sh
     1 file changed, 7 insertions(+), 19 deletions(-)
     rewrite testfiles/sample.sh (91%)
    Counting objects: 5, done.
    Delta compression using up to 4 threads.
    Compressing objects: 100% (5/5), done.
    Writing objects: 100% (5/5), 658 bytes | 0 bytes/s, done.
    Total 5 (delta 2), reused 0 (delta 0)
    remote: Resolving deltas: 100% (2/2), completed with 2 local objects.
    To https://github.com/BradleyA/markit
       46f4c0d..7cfa702  master -> master
     * [new tag]         3.197 -> 3.197

    Files marked and stored in  remote  repository.
    View commits example:  'git log --graph --decorate --oneline --color --stat'
    2019-02-08T20:33:57.987383-06:00 (CST) six-rpi3b.cptx86.com /usr/local/bin/markit[16972] 3.196.366 356 uadmin 10000:10000 [INFO]  Operation finished.

## Modified File Example
    #!/bin/bash
    #   testfiles/sample.sh  3.197.368  2019-02-08T20:33:53.600661-06:00 (CST)  https://github.com/BradleyA/markit  uadmin  six-rpi3b.cptx86.com 3.196-1-g46f4c0d  
    #      test markit for sample.sh 
    #
    #   ./sample.sh
    ###
    echo "Hello World"

## Usage
Check a file release that was marked using markit with the file repository release.

    check-markit markit 

## Output
    $ check-markit markit
    2019-02-08T20:48:42.953908-06:00 (CST) six-rpi3b.cptx86.com /usr/local/bin/check-markit[25119] 3.154.314 96 uadmin 10000:10000 [INFO]  Started...
      % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                     Dload  Upload   Total   Spent    Left  Speed
      0     0    0     0    0     0      0      0 --:--:-- --:--:-- --:--:--     0
    100 2265k    0 2265k    0     0  1035k      0 --:--:--  0:00:02 --:--:-- 2946k

      /usr/local/bin/markit release 3.196.366, commit date 2019-02-08T20:04:48.891593-06:00

      markit repository release 3.196.366, commit date 2019-02-08T20:04:48.891593-06:00

    2019-02-08T20:48:45.397890-06:00 (CST) six-rpi3b.cptx86.com /usr/local/bin/check-markit[25119] 3.154.314 195 uadmin 10000:10000 [INFO]  Operation finished.

## Getting Started
Fork https://github.com/BradleyA/markit repository so you can modify the test files while learning how simple it is to work with markit.  

On your system, git clone the forked copy of markit from \<YOUR-REPOSITORY\>.  

    git clone https://github.com/<YOUR-REPOSITORY>/markit.git

Change into clone directory on your system.

    cd markit

Make a change to testfiles/sample.sh.

    edit testfiles/sample.sh
    
Run ./markit to tag, commit, and push the change in testfiles/sample.sh to your repository.  Enter the next version number when prompted and a brief description of the change to testfiles/sample.sh.  You will be prompted for your GitHub password when git pushes testfiles/sample.sh to your remote repository.  **That is it!**

    ./markit

Check if your local version of testfiles/sample.sh is the same version that is on your remote GitHub repository.

    ./check-markit -f ./testfiles/sample.sh

On GitHub open the first issue on your markit repository, but first go to settings page and check the box next to issues.

Make a change to testfiles/sample.sh

    edit testfiles/sample.sh

Run ./markit.  Enter the next version number when prompted and this brief description '[testing markit issue changes close #1](https://help.github.com/articles/closing-issues-using-keywords/)'.  You will be prompted for your GitHub password when git pushes testfiles/sample.sh to your remote repository.

    ./markit
    
The file testfiles/sample.sh has been updated with metabeta, git tag, git commit, git push, and the issue #1 on GitHub has been [closed](https://help.github.com/articles/closing-issues-using-keywords/).

View ./markit help pages to learn more about how markit works with tracked and untracked files and without network access to Git remote repository. 

    ./markit --help

Continue testing with the other test files to help you integrate markit with your development solutions.  Open a GitHub issue and then modify two test files.   When running markit enter a message and include the GitHub issue number so GitHub will update the issue with the changes.

#### If you like this repository, select in the upper-right corner, star, thank you.

## Install
To install the latest commit of markit, change to the directory you want to download the script to (usr/local/bin) and enter the follow command.

    curl -L https://api.github.com/repos/BradleyA/markit/tarball | tar -xzf - --wildcards */markit ; mv BradleyA*/markit . ; rmdir BradleyA*/

To install the latest commit of check-markit, change markit to check-markit in the above command.

#### System OS script tested
 * Ubuntu 14.04.3 LTS
 * Ubuntu 16.04.5 LTS (armv7l)

#### Design Principles
 * Have a simple setup process and a minimal learning curve
 * Be usable as non-root
 * Be easy to install and configure

## License
MIT License

Copyright (c) 2019  [Bradley Allen](https://www.linkedin.com/in/bradleyhallen)

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
