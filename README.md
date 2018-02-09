# markit

markit is a bash script that adds two comment lines of information about file changes to all tracked modified files in your local Git repository.  Then it pushes those changed file(s) to GitHub.  The comment lines include:
 * file name, version, date, programmer, and hostname as the second line in the file.
 * a one line breif description about the changes as a third line in the file.

## Install

To install, change directory to the location you want to download the scripts. Use git to pull or clone this script into the directory. If you do not have Git then enter; "sudo apt-get install git". On the GitHub page of this script use the "HTTPS clone URL" with the 'git clone' command.

    git clone https://github.com/BradleyA/markit
    cd markit

## Usage

Mark a tracked modified file, sample.sh, in your local Git repository and push those changes to GitHub.

    markit 

## Output
    $ markit
    Files to be marked and pushed to GitHub:
    sample.sh
    Current release number: 3.1 
    Enter release number to commit files to GitHub (example 3.01).
	Press enter to use 3.1 release number.
    
    /usr/local/bin/markit 107 [INFO]:	Using release number: 3.1
    Enter single-line beginning comment character(s) to use
       (example: # // -- ' ! C !* -- // % ;;   /* <!-- <!--- {- /** --[[ %{ (* <# ):
    #	
    Enter a one line description about the changes
       (example: description of changes; closes #12, resolves #14, fixed #22):
    create output for README #6
    [master 874a7f5] create output for README #6
     1 file changed, 1 insertion(+), 1 deletion(-)
    Counting objects: 3, done.
    Delta compression using up to 4 threads.
    Compressing objects: 100% (3/3), done.
    Writing objects: 100% (3/3), 341 bytes | 0 bytes/s, done.
    Total 3 (delta 2), reused 0 (delta 0)
    remote: Resolving deltas: 100% (2/2), completed with 2 local objects.
    To https://github.com/BradleyA/markit
       157c045..874a7f5  master -> master
    /usr/local/bin/markit 196 [INFO]:	Done.

## Example File Modified
#### WARNING: These instructions are incomplete. Consider them as notes quickly drafted on a napkin rather than proper documentation!

    #!/bin/bash
    #       sample.sh       0.01.29 2018-02-05_20:51:50_CST uadmin six-rpi3b.cptx86.com 1.2-25-g0d6e47a
    #       Inital commit

#### System OS script tested
 * Ubuntu 14.04.3 LTS
 * Ubuntu 16.04.3 LTS (armv7l)

#### Design Principles
 * Have a simple setup process and a minimal learning curve
 * Be usable as non-root
 * Be easy to install and configure

## License::

Permission is hereby granted, free of charge, to any person obtaining a copy of this software, associated documentation, and files (the "Software") without restriction, including without limitation of rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE. IN NO EVENT SHALL THE AUTHORS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
