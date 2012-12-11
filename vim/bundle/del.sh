#!/bin/sh 

find ./*/ -type d -name ".gitignore"|xargs rm -rvf

#filelist='ls ./*/*'
#echo $filelist
