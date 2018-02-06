# markit

markit is a bash script that
 * Insert the file name, version, date, programmer, and hostname as the second line in the file.
 * Insert a one line breif description about the changes as a third line in the file.

## Usage
    markit <FILE_NAME> <VERSION_NUMBER>

## Output
      $ markit sample.sh
    Enter release number for sample.sh (example 3.01.01):
    2.02
    Enter Single-line comment character(s) to use in sample.sh (example: # // -- ;; ):
    #	
    Enter a one line description about the changes:
    sample change description
    [master f8b18d5] sample change description
     1 file changed, 2 insertions(+)

## Install

To install, change directory to the location you want to download the scripts. Use git to pull or clone these scripts into the directory. If you do not have git then enter; "sudo apt-get install git". On the github page of this script use the "HTTPS clone URL" with the 'git clone' command.

    git clone https://github.com/BradleyA/markit
    cd markit

#### System OS script tested
 * Ubuntu 14.04.3 LTS

#### Design Principles
 * Have a simple setup process and a minimal learning curve
 * Be usable as non-root
 * Be easy to install and configure

## License::

Permission is hereby granted, free of charge, to any person obtaining a copy of this software, associated documentation, and files (the "Software") without restriction, including without limitation of rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE. IN NO EVENT SHALL THE AUTHORS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
