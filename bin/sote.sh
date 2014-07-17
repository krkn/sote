#!/bin/bash
###################################
# sote                            #
# https://github.com/leny/sote    #
#                                 #
# Copyright (c) 2014 leny         #
# Licensed under the MIT license. #
###################################

sote() {
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

    # Check for git

    command -v git >/dev/null 2>&1 || { echo "sote requires git but it's not installed. Aborting." >&2; return 1; }

    # Check for store file

    if [ ! -f $store ]
    then
        echo "" > $store
    fi

    # Show help if no args

    if [ $# == 0 ] ; then
        echo "$usage"
        return;
    fi

    # Commands

    action=$1
    arg1=$2
    arg2=$3

    case "$action" in
        "-v")
            echo "sote v$version"
            return;
            ;;
        "--version")
            echo "sote v$version"
            return;
            ;;
        "-h")
            echo "$usage"
            return;
            ;;
        "--help")
            echo "$usage"
            return;
            ;;
        "list")
            # TODO : parse & show
            git config --file $store --list
            return;
            ;;
        "show")
            git config --file $store --get "store.$arg1"
            return;
            ;;
        "add")
            git config --file $store --replace-all "store.$arg1" $arg2
            return;
            ;;
        "remove")
            git config --file $store --unset-all "store.$arg1"
            return;
            ;;
        "clear")
            echo "" > $store
            return;
            ;;
        *)
            path=$( git config --file $store --get "store.$action" )
            cd $path
            return;
            ;;
    esac
}
