## markit

### Goal
I wanted to know what version a piece of code was on any system running it. The system may or may not be connected to any network. The system may or may not have Git installed. The system may or may not have access to GitHub repository or GitLab project. I wanted the same solution for several types of code (.sh, .go, .yml, .xml, .mk, dockerfile, etc). I wanted any person without knowledge of Git or GitHub or GitLab to be able to **answer one question over the phone; What version are you running?**

### Description
markit is a bash script that adds two comment lines of information about file changes to all tracked modified files in your local Git repository.  Then push those changed file(s) to either a GitHub repository or GitLab project.  The comment lines include:
 * file_name, file_version.commits, date, remote_repository, developer, hostname, parent git-tag-commit_number-hash; as the second line
 * a one line breif description about the changes; as the third line
 
Markit currently supports these file extensions: UNIX shell(sh) perl(pl|PL) python(py) ruby(rb) PowerShell(ps1) PHP(php|php3|php4|ph3|ph4) R(R) YAML(yml|yaml) makefile(mk|MK) text (txt) c(c) C header(h|H|hpp) C++ header(hxx|Hxx|HXX) C++(cc|cpp|c++|cxx) Go(go) Java(java|class|jar) JavaScript(js) Kotlin(kt|kts) Pascal (p|pp|paa) Rust(rs|rlib) Scala(scala|sc) XML(xml) HTML (html|htm)

Markit currently supports these files without file extensions: Dockerfile

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
    sample.sh

    Current git repository release number: 3.95 

    Enter release number to commit files (example 3.01) or ctrl-c to stop.
    3.96
    /usr/local/bin/markit 139 [INFO]:	Using release number: 3.96

    Enter a one line description about the changes or ctrl-c to stop.
       (example: Added logic for --help; closes #12, resolves #14):
    update comments

    sample.sh	sh

    [master 7a17705] update comments
     1 file changed, 3 insertions(+), 2 deletions(-)
    Counting objects: 5, done.
    Delta compression using up to 4 threads.
    Compressing objects: 100% (5/5), done.
    Writing objects: 100% (5/5), 622 bytes | 0 bytes/s, done.
    Total 5 (delta 2), reused 0 (delta 0)
    remote: Resolving deltas: 100% (2/2), completed with 2 local objects.
    To https://github.com/BradleyA/markit
       07806e2..7a17705  master -> master
     * [new tag]         3.96 -> 3.96

    /usr/local/bin/markit 237 [INFO]:	Done.

### Modified File Example
    ##!/bin/bash
    # 	sample.sh  3.96.247  2018-10-07T08:59:51-05:00 (CDT)  https://github.com/BradleyA/markit  uadmin  six-rpi3b.cptx86.com 3.95-1-g07806e2  
    # 	   update comments 
    #
    ###
    echo "Hello World"
        
### Install
To install the latest commit of markit, change to the directory you want to download the script.

    curl -L https://api.github.com/repos/BradleyA/markit/tarball | tar -xzf - --wildcards */markit ; mv BradleyA*/markit . ; rmdir BradleyA*/

To download markit version 3.8, change to the directory you want to download the tar file with the README, markit, and testfiles.  

    curl -o markit-3.8.tar -L https://api.github.com/repos/BradleyA/markit/tarball/3.8
    
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

### System OS script tested
 * Ubuntu 14.04.3 LTS
 * Ubuntu 16.04.3 LTS (armv7l)
 * Ubuntu 16.04.5 LTS (armv7l)

### Design Principles
 * Have a simple setup process and a minimal learning curve
 * Be usable as non-root
 * Be easy to install and configure

### License::
Permission is hereby granted, free of charge, to any person obtaining a copy of this software, associated documentation, and files (the "Software") without restriction, including without limitation of rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE. IN NO EVENT SHALL THE AUTHORS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
