## markit

### Goal
I wanted to know what version a piece of code was on any system running it. The system may or may not be connected to any network. The system may or may not have Git installed. The system may or may not have the GitHub repository installed on it. I wanted the same solution for several types of code (.sh, .go, .yml, .xml, .mk, dockerfile, etc). I wanted any person without knowledge of Git or GitHub to be able to **answer one question over the phone; What version are you running?**

### Description
markit is a bash script that adds two comment lines of information about file changes to all tracked modified files in your local Git repository.  Then it pushes those changed file(s) to GitHub.  The comment lines include:
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
    Files to be marked and pushed to GitHub:
    testfiles/sample.sh
    
    Current release number: 3.7
    
    Enter release number to commit files to GitHub (example 3.01).
    Press enter to use 3.7 release number or ctrl-c to stop.
    3.8
    /usr/local/bin/markit 124 [INFO]:	Using release number: 3.8
    
    Enter a one line description about the changes
       (example: Added logic for --help; closes #12, resolves #14):
    typo in sample.sh test file
    testfiles/sample.sh	sh
    [master 8b48eee] typo in sample.sh test file
     1 file changed, 3 insertions(+), 2 deletions(-)
     Username for 'https://github.com': BradleyA
     Password for 'https://BradleyA@github.com':
     Counting objects: 5, done.
     Delta compression using up to 4 threads.
     Compressing objects: 100% (5/5), done.
     Writing objects: 100% (5/5), 575 bytes | 0 bytes/s, done.
     Total 5 (delta 3), reused 0 (delta 0)
     remote: Resolving deltas: 100% (3/3), completed with 3 local objects.
     To https://github.com/BradleyA/markit
        3ac7e20..8b48eee  master -> master
	 * [new tag]         3.8 -> 3.8

### Modified File Example
    #!/bin/bash
    #	sample.sh  3.1.60  2018-02-09_17:03:42_CST  https://github.com/BradleyA/markit  uadmin  six-rpi3b.cptx86.com  3.1-17-g157c045 
    #	create output for README #6 
        
### Install
To install the latest commit of markit, change to the directory you want to download the script.

    curl -L https://api.github.com/repos/BradleyA/markit/tarball | tar -xzf - --wildcards */markit ; mv BradleyA*/markit . ; rmdir BradleyA*/

To download markit version 3.8, change to the directory you want to download the tar file with the README, markit, and testfiles.  

    curl -o markit-3.8.tar -L https://api.github.com/repos/BradleyA/markit/tarball/3.8

### System OS script tested
 * Ubuntu 14.04.3 LTS
 * Ubuntu 16.04.3 LTS (armv7l)

### Design Principles
 * Have a simple setup process and a minimal learning curve
 * Be usable as non-root
 * Be easy to install and configure

### License::
Permission is hereby granted, free of charge, to any person obtaining a copy of this software, associated documentation, and files (the "Software") without restriction, including without limitation of rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE. IN NO EVENT SHALL THE AUTHORS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
