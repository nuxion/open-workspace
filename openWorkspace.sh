#!/bin/bash
# script for open and setup workspaces in i3wm 
# using i3-msg command. 

## VARS ##
workspace=$1
# Change this var
home="/home/nuxion" 
# Change this var
pathConfigs=$home"/Projects/scripts/open-workspace"
fullpath=$pathConfigs/$workspace.props

## FUNCTIONS ##
openApps () {
    # with this function, we list all apps
    # to prepare for execute i3-msg command 
    for app in `cat $fullpath | grep app | awk -F "=" '{print $2}'`
    do 
        echo $line
	i3-msg "workspace $workspace; exec $app"
	sleep 2
    done
}
openLayout () {
   # take from workspace properties file, i
   # the workspace and layout to open
   layout=`cat $fullpath | grep layoutName | awk -F "=" '{print $2}'`
   i3-msg  "workspace $workspace; append_layout $layout"
}
## MAIN () ##
# check if the config file exists
if [ ! -r $fullpath ]; then exit 1; fi
#echo $fullpath # debug

# $workspace var its reused
workspace=`cat $fullpath | grep workspaceName | awk -F "=" '{print $2}'` 

# then, firts open layout, and after 
# exec every app in the config file
openLayout
openApps
