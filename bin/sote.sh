#!/bin/bash
###################################
# sote                            #
# https://github.com/leny/sote    #
#                                 #
# Copyright (c) 2014 leny         #
# Licensed under the MIT license. #
###################################

sote() {

    # sote vars

    local version=0.0.1
    local store="$HOME/.sote"

    # reset colors

    local NONE="\033[0m"

    # regular colors

    local K="\033[0;30m"    # black
    local R="\033[0;31m"    # red
    local G="\033[0;32m"    # green
    local Y="\033[0;33m"    # yellow
    local B="\033[0;34m"    # blue
    local M="\033[0;35m"    # magenta
    local C="\033[0;36m"    # cyan
    local W="\033[0;37m"    # white

    # emphasized (bolded) colors

    local EMK="\033[1;30m"
    local EMR="\033[1;31m"
    local EMG="\033[1;32m"
    local EMY="\033[1;33m"
    local EMB="\033[1;34m"
    local EMM="\033[1;35m"
    local EMC="\033[1;36m"
    local EMW="\033[1;37m"

    # usage text

    local usage="
    ${EMY}Usage: ${W}sote ${G}[options] ${C}<name>

    ${EMC}Name:

        ${C}*                      ${W}Jumps to the path corresponding to the given name.

    ${EMG}Options:

        ${G}-h, --help      ${W}output usage information
        ${G}-v, --version      ${W}output the version number
        ${G}-l, --list                   ${W}Lists the paths stored by sote.
        ${G}-s, --show ${B}<name>            ${W}Shows the path corresponding to the given name.
        ${G}-a, --add ${B}<name> ${Y}[path]      ${W}Add the path to the store with the given name. If no path is given, use current path.
        ${G}-r, --remove ${B}<name>          ${W}Remove the path stored by sote at the given name.
        ${G}-c, --clear                  ${W}Clear all the paths stored by sote. Ask for confirmation before acting.
    "


    # Check for git

    command -v git >/dev/null 2>&1 || { echo "sote requires git but it's not installed. Aborting." >&2; return 1; }

    # Check for store file

    if [ ! -f $store ]
    then
        echo "" > $store
    fi

    # Show help if no args

    if [ $# == 0 ] ; then
        echo -e "$usage${NONE}"
        return;
    fi

    # Commands

    action=$1
    name=$2
    path=$3

    case "$action" in
        "-v"|"--version")
            echo -e "${Y}sote ${W}v$version${NONE}"
            return;
            ;;
        "-h"|"--help")
            echo -e "$usage${NONE}"
            return;
            ;;
        "--completion")
            for i in $(git config --file $store --list) ; do
                i=${i//store./}
                i=${i//=*/}

                echo -e "$i"
            done
            return;
            ;;
        "-l"|"--list")
            for i in $(git config --file $store --list) ; do
                i=${i//store./$C}
                i=${i//=/ ${Y}› ${NONE}}

                echo -e "$i"
            done
            return;
            ;;
        "-s"|"--show")
            path=$( git config --file $store --get "store.$name" )
            if [ "$path" != "" ]
            then
                echo -e "${C}$name ${Y}› ${NONE}$path${NONE}"
            else
                echo -e "${EMR}error: ${NONE}no entry for ${C}$name${NONE}"
            fi
            return;
            ;;
        "-a"|"--add")
            if [ ! $path ]
            then
                path=$PWD
            else
                path=$(cd $path; pwd)
            fi
            git config --file $store --replace-all "store.$name" $path
            echo -e "${EMY}added: ${C}$name ${Y}› ${NONE}$path${NONE}"
            return;
            ;;
        "-r"|"--remove")
            git config --file $store --unset-all "store.$name"
            echo -e "${EMY}removed: ${C}$name${NONE}"
            return;
            ;;
        "-c"|"--clear")
            echo "" > $store
            echo -e "${EMY}cleared${NONE}"
            return;
            ;;
        *)
            path=$( git config --file $store --get "store.$action" )
            if [ "$path" != "" ]
            then
                cd $path
            else
                echo -e "${EMR}error: ${NONE}no entry for ${C}$action${NONE}"
            fi
            return;
            ;;
    esac
}

_sote_complete() {
    local word="${COMP_WORDS[COMP_CWORD]}"

    COMPREPLY=( $(compgen -W "$(sote --completion)" -- "$word") )
}

complete -F _sote_complete sote
