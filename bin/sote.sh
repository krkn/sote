#!/bin/bash
###################################
# sote                            #
# https://github.com/leny/sote    #
#                                 #
# Copyright (c) 2014 leny         #
# Licensed under the MIT license. #
###################################

# Globals

version=0.0.1
usage="
    Usage: sote [options] [command]

    Commands:

        list                   Lists the paths stored by sote.
        show <name>            Shows the path corresponding to the given name.
        add <name> [path]      Add the path to the store with the given name. If no path is given, use current path.
        remove <name>          Remove the path stored by sote at the given name.
        clear                  Clear all the paths stored by sote. Ask for confirmation before acting.
        *                      Jumps to the path corresponding to the given name.

    Options:

        -h      output usage information
        -V      output the version number
"
store="$HOME/.sote"

# Show help if no args

if [ $# == 0 ] ; then
    echo "$usage"
    exit 1;
fi

# Options

while getopts ":vh" optname
  do
    case "$optname" in
      "v")
        echo "sote v$version"
        exit 0;
        ;;
      "h")
        echo "$usage"
        exit 0;
        ;;
      "?")
        echo "Unknown option $OPTARG"
        exit 0;
        ;;
      ":")
        echo "No argument value for option $OPTARG"
        exit 0;
        ;;
      *)
        echo "Unknown error while processing options"
        exit 0;
        ;;
    esac
  done

# Commands

action=$1
arg1=$2
arg2=$3

case "$action" in
    "list")
        echo "list."
        exit 0;
        ;;
    "show")
        echo "show $arg1."
        exit 0;
        ;;
    "add")
        echo "add $arg1 $arg2."
        exit 0;
        ;;
    "remove")
        echo "remove $arg1."
        exit 0;
        ;;
    "clear")
        echo "clear."
        exit 0;
        ;;
    *)
        echo "jumpto $action."
        exit 0;
        ;;
esac
