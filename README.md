## markit

### Goal
I wanted to know what version a piece of code was on any system running it. The system may or may not be connected to any network. The system may or may not have Git installed. The system may or may not have access to GitHub repository or Bitbucket repository or GitLab project. I wanted the same solution for several types of code (.sh, .go, .yml, .xml, .mk, dockerfile, etc). I wanted any person without knowledge of Git or GitHub or Bitbucket or GitLab to be able to **answer one question over the phone; What version are you running?**

### Description
markit is a bash script that adds two comment lines of information about file changes to all tracked modified files in your local Git repository.  Then push those changed file(s) to either a GitHub repository or Bitbucket repository or GitLab project.  The comment lines include:
 * file_name, file_version.commits, date, remote_repository, developer, hostname, parent git-tag-commit_number-hash; as the second line
 * a one line breif description about the changes; as the third line
 
Markit currently supports these file extensions: UNIX shell(sh|bash|csh|tcsh|ksh) perl(pl|PL|psh) Python(py) ruby(rb) PowerShell(ps1|msh) PHP(php|php3|php4|ph3|ph4) R(R) YAML(yml|yaml) Makefile(mk|MK) text (txt) c(c) C header(h|H|hpp) C++ header(hxx|Hxx|HXX) C++(cc|cpp|c++|cxx) Go(go) Java(java|class|jar) JavaScript(js) Kotlin(kt|kts) Pascal (p|pp|paa) Rust(rs|rlib) Scala(scala|sc) XML(xml) HTML (html|htm)

Markit currently supports these files without file extensions: Dockerfile

#### If you like this repository, select in the upper-right corner, star, thank you.
#### To watch future updates in this repository select in the upper-right corner, the "Watch" list, and select Watching.

### Clone
To clone, change to the directory you want to download. Use git clone into the directory. If you do not have Git then enter; "sudo apt-get install git". On the GitHub page of this script use the "HTTPS clone URL" with the 'git clone' command.

    git clone https://github.com/BradleyA/markit
    cd markit

### Usage
Mark a **tracked modified file**, sample.sh, in your local Git repository and push those changes to GitHub.

    markit 

### Output
    $ markit
    Files to be marked and pushed:

    testfiles/sample.sh

    Current git repository release number:  3.107
    Enter release number to commit files (example 3.01) or ctrl-c to stop.

    3.108
    Using release number: 3.108

    Enter a one line description about the changes or ctrl-c to stop.
        (example: Added logic for --help; closes #12, resolves #14):

    test markit for sample.sh

    testfiles/sample.sh sh

    [master e29c001] test markit for sample.sh
     1 file changed, 2 insertions(+), 2 deletions(-)
    Counting objects: 5, done.
    Delta compression using up to 4 threads.
    Compressing objects: 100% (5/5), done.
    Writing objects: 100% (5/5), 637 bytes | 0 bytes/s, done.
    Total 5 (delta 2), reused 0 (delta 0)
    remote: Resolving deltas: 100% (2/2), completed with 2 local objects.
    To https://github.com/BradleyA/markit
       5a8c2a9..e29c001  master -> master
     * [new tag]         3.108 -> 3.108
    2018-10-07T13:31:09-05:00 (CDT) /usr/local/bin/markit  271 [INFO]  six-rpi3b.cptx86.com  uadmin  10000 10000  Done.

### Modified File Example
    ##!/bin/bash
    # 	sample.sh  3.96.247  2018-10-07T08:59:51-05:00 (CDT)  https://github.com/BradleyA/markit  uadmin  six-rpi3b.cptx86.com 3.95-1-g07806e2  
    # 	   update comments 
    #
    ###
    echo "Hello World"

### Usage
Check a file release that was marked using markit with the file repository release.

    check-markit markit 

### Output
        $ ./check-markit markit
    
    2018-10-07T08:47:06-05:00 (CDT) /usr/local/bin/check-markit  70 [INFO]  six-rpi3b.cptx86.com  uadmin  10000 10000  Begin
      % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                     Dload  Upload   Total   Spent    Left  Speed
      0     0    0     0    0     0      0      0 --:--:-- --:--:-- --:--:--     0
    100 11690    0 11690    0     0   7956      0 --:--:--  0:00:01 --:--:-- 16013

      /usr/local/bin/markit release 3.93.243, commit date 2018-10-06T20:09:21-05:00

      markit repository release 3.93.243, commit date 2018-10-06T20:09:21-05:00

    2018-10-07T08:47:07-05:00 (CDT) /usr/local/bin/check-markit  163 [INFO]  six-rpi3b.cptx86.com  uadmin  10000 10000  Done.
        
### Install
To install the latest commit of markit, change to the directory you want to download the script.

    curl -L https://api.github.com/repos/BradleyA/markit/tarball | tar -xzf - --wildcards */markit ; mv BradleyA*/markit . ; rmdir BradleyA*/

To download markit version 3.8, change to the directory you want to download the tar file with the README, markit, and testfiles.  

    curl -o markit-3.8.tar -L https://api.github.com/repos/BradleyA/markit/tarball/3.8
    
### System OS script tested
 * Ubuntu 14.04.3 LTS
 * Ubuntu 16.04.3 LTS (armv7l)
 * Ubuntu 16.04.5 LTS (armv7l)

### Design Principles
 * Have a simple setup process and a minimal learning curve
 * Be usable as non-root
 * Be easy to install and configure

## License
MIT License

Copyright (c) 2019  [Bradley Allen](https://www.linkedin.com/in/bradleyhallen)

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
