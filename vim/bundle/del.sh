#!/bin/sh 

find ./*/ -type d -name ".git"|xargs rm -rvf

#filelist='ls ./*/*'
#echo $filelist
