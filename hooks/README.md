# git-TEST-commit-automation  [![Stable Release](https://img.shields.io/badge/Release-2.211-blue.svg)](https://github.com/BradleyA/git-TEST-commit-automation/releases/tag/2.200)    [![GitHub commits](https://img.shields.io/github/commits-since/BradleyA/git-TEST-commit-automation/2.211.svg)](https://github.com/BradleyA/git-TEST-commit-automation/commits/)

## Strategy
Scripts to assist running something, and checking something, then reporting something; when you commit something.

    git commit -m 'latest changes' <COMMIT_FILE_NAME>

After entering the above command, Git runs any Git hooks found in \<REPOSITORY-NAME>/.git/hooks/ directory.  Git hooks are scripts that Git executes before and/or after events. Two local Git hooks are included with git-TEST-commit-automation.

#### If you like this repository, select in the upper-right corner, star, thank you.

## About

git-TEST-commit-automation runs pre-commit and post-commit hooks when "git commit -m 'message' " is executed. Pre-commit creates a file (${REPOSITORY-NAME}/hooks/COMMIT_FILE_LIST) which includes files being commited. Post-commit searches in the same directory as the commited filename for a TEST/\<filename>/ directory. If found post-commit runs TEST/\<filename>/SA-setup.sh and/or TEST/\<filename>/FVT-setup.sh then searches for files beginning with SA- of FVT- and runs them.

TL;DR - Why did I create git-TEST-commit-automation when there are so many great open software and enterprise level testing solutions available.  I needed something that would run some basic SA and FVT tests with minimal learning curve.  A solution that would inform, not impede code development.  That would encourage 'git commit -m 'message', not exit 1 if there is any code incident.  A solution that allows basic test cases to be included with code in a Git repository.  A solution that could be setup and uninstall without effecting the code being developed.  A solution that would support adding other test solutions to this solution with minimal changes.

TL;DR - During code design, a software developer's focus is on how to solve parts of a bigger solution.  A developer may throw out a couple to dozens of lines of code.  It did not matter that those lines of code did or didn't meet every test requirement.  As a design matures it is increasingly important to have code PASS tests.  It is also important for a developer to design SA and FVT test cases for their new code.  At that time their code is ready for additional testing with open software and enterprise level solutions.

## Objectives
1) Quick setup with default test cases for any Git repository (in seconds)
2) Quick uninstall on any Git repository
3) Quick check of test case depth for a file (option -f) and all files for any Git repository (option -a)
4) Quick setup of default SA- test cases for a file (options --filename sample.sh --add)
5) Quick upgrade of default test cases and git-TEST-commit-automation commands (setup-git-TEST-cases.sh)
6) Quick reduction of untracked TEST case files (option -c)

## Quick Start
	
#### [Install/evaluate git-TEST-commit-automation solution](https://github.com/BradleyA/git-TEST-commit-automation/tree/master/hooks/docs/STEPS-TO-EVALUTE.md)

#### [Uninstall git-TEST-commit-automation solution](https://github.com/BradleyA/git-TEST-commit-automation/tree/master/hooks/docs/STEPS-TO-UNINSTALL.md)

#### [View test case depth for a file](https://github.com/BradleyA/git-TEST-commit-automation/tree/master/hooks/docs/STEPS-TO-CHECK-DEPTH.md)

#### [Setup default SA- test cases for a new file](https://github.com/BradleyA/git-TEST-commit-automation/tree/master/hooks/docs/STEPS-TO-SETUP-DEFAULT-SA-TEST-CASES.md)

#### [Create custom test cases for a file](https://github.com/BradleyA/git-TEST-commit-automation/tree/master/hooks/docs/STEPS-TO-CREATE-TEST-CASES.md)
  
## Description

**pre-commit** - Creates \<REPOSITORY-NAME>/hooks/**COMMIT_FILE_LIST** with a list of \<REPOSITORY-NAME>/\<FILE> being committed.

**post-commit** 
- Loop through committed files found in \<REPOSITORY-NAME>/hooks/**COMMIT_FILE_LIST**
- if COMMIT_FILE has a \<REPOSITORY-NAME>/\<PATH>/TEST/\<COMMIT_FILE>/' directory run FVT-setup.sh and/or SA-setup.sh
- Loop through and run \<REPOSITORY-NAME>/\<PATH>/TEST/\<COMMIT_FILE>/SA-<TEST_CASE> and/or FVT-<TEST_CASE>
- Report output as **PASS** or **FAIL** or **ERROR**, through stdout 
      . . . some methed will notify someone of the results. (not sure which method is going to work for me and you? 
      . . . stdout, logs-scrape, tables, email, twitter, slack, call a friand, etc.)
 
**git-TEST-cases.sh** - lists and manages files in TEST case directories in current Git repository

**setup-git-TEST-cases.sh** - setup git-TEST-commit-automation in top directory of current repository

**uninstall-git-TEST-cases.sh** - uninstall git-TEST-commit-automation in current repository

## Test Case Types

**Funciotnal Verification (FVT)** is defined as the process of verifying that the design meets its specification from a functional perspective. ... Functional verification establishes that the design under test (DUT) implements the functionality of the specification correctly.

**Static Analysis (SA)** is the examination of code prior to the program’s execution SA is code analysis, syntax, permission, code inspection, code review, etc.

#### ARCHITECTURE TREE

    /usr/local/bin/                           <-- <BIN_DIR>
    ├── git-TEST-cases.sh
    ├── setup-git-TEST-cases.sh
    └── uninstall-git-TEST-cases.sh>

**hooks directory**  The hooks directory was created because I wanted to modify the GitHub hooks and track changes per repository.  Include hooks/ in repostory because .git/hooks is not pushed and hooks change and these changes need to be tracked in a Git repository.  A symbolic link from \<REPOSITORY-NAME>/.git/hooks to this hooks directory that are managed in this repository using [markit](https://github.com/BradleyA/markit/blob/master/README.md). 

Place the expected results from the test case into a file with the same test case name but add '.expected' ('dot'expected).  Pipe the output from the test case into a file with the same name but add '.test-case-output'. 

    . . . /<REPOSITORY-NAME>/hooks
    ├── bin/
    │   ├── git-TEST-cases.sh
    │   ├── setup-git-TEST-cases.sh
    │   ├── TEST/
    │   │   ├── git-TEST-cases.sh/
    │   │   │   ├── FVT-cleanup.sh
    │   │   │   ├── FVT-option-a-001
    │   │   │   ├── FVT-option-a-002
    │   │   │   ├── FVT-option-add-001.expected
    │   │   │   ├── FVT-option-a-hooks-001
    │   │   │   ├── FVT-option-a-hooks-001.expected
    │   │   │   ├── FVT-option-a-hooks-002
    │   │   │   ├── FVT-option-a-hooks-002.expected
    │   │   │   ├── FVT-option-c-hooks-001.expected
    │   │   │   ├── FVT-option-f-001.expected
    │   │   │   ├── FVT-option-n-001.expected
    │   │   │   ├── FVT-setup.sh
    │   │   │   ├── SA-cleanup.sh -> ../../../EXAMPLES/SA-cleanup.sh
    │   │   │   ├── SA-setup.sh -> ../../../EXAMPLES/SA-setup.sh
    │   │   │   └── SA-shellcheck-001.expected
    │   │   ├── setup-git-TEST-cases.sh/
    │   │   │   ├── SA-cleanup.sh -> ../../../EXAMPLES/SA-cleanup.sh
    │   │   │   ├── SA-setup.sh -> ../../../EXAMPLES/SA-setup.sh
    │   │   │   └── SA-shellcheck-001.expected
    │   │   └── uninstall-git-TEST-cases.sh/
    │   │       ├── SA-cleanup.sh -> ../../../EXAMPLES/SA-cleanup.sh
    │   │       ├── SA-setup.sh -> ../../../EXAMPLES/SA-setup.sh
    │   │       └── SA-shellcheck-001.expected
    │   └── uninstall-git-TEST-cases.sh
    ├── docs/
    │   ├── STEPS-TO-CHECK-DEPTH.md
    │   ├── STEPS-TO-CREATE-CUSTOM-TEST-CASES.md
    │   ├── STEPS-TO-CREATE-TEST-CASES.md
    │   ├── STEPS-TO-EVALUTE.md
    │   ├── STEPS-TO-SETUP-DEFAULT-SA-TEST-CASES.md
    │   └── STEPS-TO-UNINSTALL.md
    ├── EXAMPLES/
    │   ├── FVT-cleanup.sh
    │   ├── FVT-exit-code-error-0-001
    │   ├── FVT-exit-code-error-1-001
    │   ├── FVT-exit-code-error-124-001
    │   ├── FVT-exit-code-error-124-002
    │   ├── FVT-exit-code-error-126-001
    │   ├── FVT-exit-code-error-127-001
    │   ├── FVT-exit-code-error-128-001
    │   ├── FVT-exit-code-error-130-001
    │   ├── FVT-exit-code-error-2-001
    │   ├── FVT-option-help-001
    │   ├── FVT-option-help-002
    │   ├── FVT-option-help-003
    │   ├── FVT-option-help-004
    │   ├── FVT-option-help-005
    │   ├── FVT-option-help-006
    │   ├── FVT-option-usage-001
    │   ├── FVT-option-usage-002
    │   ├── FVT-option-usage-003
    │   ├── FVT-option-version-001
    │   ├── FVT-option-version-002
    │   ├── FVT-option-version-003
    │   ├── FVT-setup.sh
    │   ├── GIT-VARIABLES-EXAMPLES.sh
    │   ├── SA-cleanup.sh
    │   ├── SA-exit-code-error-124-001
    │   ├── SA-exit-code-error-124-002
    │   ├── SA-exit-code-error-2-001
    │   ├── SA-permission-400-001
    │   ├── SA-permission-440-001
    │   ├── SA-permission-444-001
    │   ├── SA-permission-600-001
    │   ├── SA-permission-640-001
    │   ├── SA-permission-644-001
    │   ├── SA-permission-660-001
    │   ├── SA-permission-664-001
    │   ├── SA-permission-666-001
    │   ├── SA-permission-700-001
    │   ├── SA-permission-750-001
    │   ├── SA-permission-755-001
    │   ├── SA-permission-770-001
    │   ├── SA-permission-775-001
    │   ├── SA-permission-777-001
    │   ├── SA-permission-dir-001
    │   ├── SA-permission-grp-10000-001
    │   ├── SA-permission-own-10000-001
    │   ├── SA-setup.sh
    │   ├── SA-shellcheck-001
    │   ├── SA-type-tar-archive-001
    │   ├── SA-type-tar-gzip-001
    │   ├── SA-type-tar-POSIX-archive-001
    │   ├── SA-type-tar-POSIX-archive-GNU-001
    │   ├── SA-type-tar-V7-001
    │   ├── SA-type-tar-XZ-001
    │   ├── TEST/
    │   │   ├── FVT-cleanup.sh/
    │   │   │   ├── SA-cleanup.sh -> ../../SA-cleanup.sh
    │   │   │   ├── SA-setup.sh -> ../../SA-setup.sh
    │   │   │   └── SA-shellcheck-001.expected
    │ . . . . . .
    ├── images/
    │   ├── github.png
    │   ├── git-TEST-commit-automation-1.gif
    │   ├── git-TEST-commit-automation-2-1.gif
    │   ├── git-TEST-commit-automation-2.gif
    │   ├── git-TEST-commit-automation-3-1.gif
    │   ├── git-TEST-commit-automation-3.gif
    │   ├── git-TEST-commit-automation-4-1.gif
    │   ├── git-TEST-commit-automation-4.gif
    │   ├── linkedin.png
    │   └── twitter.png
    ├── post-commit
    ├── pre-commit
    ├── README.md
    └── TEST/
        ├── post-commit/
        │   ├── SA-cleanup.sh -> ../../EXAMPLES/SA-cleanup.sh
        │   ├── SA-setup.sh -> ../../EXAMPLES/SA-setup.sh
        │   └── SA-shellcheck-001.expected
        └── pre-commit/
            ├── SA-cleanup.sh -> ../../EXAMPLES/SA-cleanup.sh
            ├── SA-setup.sh -> ../../EXAMPLES/SA-setup.sh
            └── SA-shellcheck-001.expected

#### Future Objectives 

**WARNING**: These instructions are incomplete. Consider them as notes quickly drafted on a napkin rather than proper documentation!

- <COMMIT_FILE_NAME>.test-case-input - Add support   #12
- Design for quick test case git branch merge (include steps)
- Quick test case branch merge from test team's custom test cases without merge conflicts (include steps)

      git remote --verbose
      git remote add origin https://github.com/BradleyA/git-TEST-commit.git
      git remote --verbose
      git push -u origin master

      git-TEST-cases.sh -c --hooks

      git branch -a
      git branch git-TEST-commit-#1

      git push origin git-TEST-commit-#1
      git branch -a
      
      #  create a branch
      git pull                      #  get latest pushed commits
      git checkout -b development   #  create development branch
      git push --set-upstream origin development   #  create github development branch upstream (github)
        #  or
      git push -u origin development
        #  write code in development branch
        #  create README on github master branch
      git pull origin master        #  pull chnages to master bransh to development bransh
        #  write code in development branch
      	
    
  - challenge is SA-setup.sh & FVT-setup.sh could be changed by development and test teams 
  - Quick backup of all test cases in repository (\<FILE-NAME>.tar) (code is in uninstall-) (option: --backup --restore)
  - Include support for other test or CI solutions ... Scan for Credentials, BATS, Travis CI, ...

#### Traffic
 * <img alt="Clones" src="https://img.shields.io/static/v1?label=Clones&message=118&color=blue">  [Clones Table](https://github.com/BradleyA/git-TEST-commit-automation/blob/master/hooks/images/clone.table.md)
 * <img alt="Views" src="https://img.shields.io/static/v1?label=Views&message=1654&color=blue">  [Views Table](https://github.com/BradleyA/git-TEST-commit-automation/blob/master/hooks/images/view.table.md)

#### Author
[<img id="twitter" src="https://github.com/BradleyA/git-TEST-commit-automation/blob/master/hooks/images/twitter.png" width="50" a="twitter.com/bradleyaustintx/">
](https://twitter.com/bradleyaustintx/)   [<img id="github" src="https://github.com/BradleyA/git-TEST-commit-automation/blob/master/hooks/images/github.png" width="50" a="https://github.com/BradleyA/">
](https://github.com/BradleyA/)    [<img src="https://github.com/BradleyA/git-TEST-commit-automation/blob/master/hooks/images/linkedin.png" style="max-width:100%;" >](https://www.linkedin.com/in/bradleyhallen)

#### System OS script tested
 * Ubuntu 16.04.6 LTS (GNU/Linux 4.4.38-v7+ armv7l)
 * Ubuntu 14.04.6 LTS (GNU/Linux 4.4.0-148-generic x86_64)

#### Design Principles
 * Have a simple setup process and a minimal learning curve
 * Be usable as non-root
 * Be easy to install and configure

#### License
MIT License

Copyright (c) 2020 [Bradley Allen](https://www.linkedin.com/in/bradleyhallen)

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
