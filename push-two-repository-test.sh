#!/bin/bash
# 	push-two-repository-test.sh  3.208.499  2019-02-25T13:40:52.842182-06:00 (CST)  https://github.com/BradleyA/markit.git  uadmin  six-rpi3b.cptx86.com 3.207  
# 	   again modified .git/config to push to github, gitlab, and bitbucket 
# 	push-two-repository-test.sh  3.207.498  2019-02-25T13:30:40.766777-06:00 (CST)  https://github.com/BradleyA/markit.git  uadmin  six-rpi3b.cptx86.com 3.206-3-g31765fb  
# 	   modified .git/config to push to github, gitlab, and bitbucket 

###
#	push to github and bitbucket
#	push to github, bitbucket, and gitlab
[remote "origin"]
	url = https://github.com/BradleyA/markit.git
	fetch = +refs/heads/*:refs/remotes/origin/*
	pushurl = https://github.com/BradleyA/markit.git
	pushurl = https://axebbq@bitbucket.org/axebbq/markit.git
	pushurl = https://BradleyAxe@gitlab.com/BradleyAxe/markit.git
