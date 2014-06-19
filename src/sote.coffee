###
 * sote
 * https://github.com/Leny/sote
 *
 * JS/COFFEE Document - /sote.js - main entry point, commander setup and runner
 *
 * Copyright (c) 2014 Leny
 * Licensed under the MIT license.
###

"use strict"

program = require "commander"
fs = require "fs"
path = require "path"
chalk = require "chalk"
error = chalk.bold.red
success = chalk.bold.green

pkg = require "../package.json"

NO_COMMAND_SPECIFIED = process.argv.length is 2

program.version pkg.version

# list command
program
    .command "list"
    .description "Lists the paths stored by sote."
    .action ->
        console.log "list"

# add command
program
    .command "add <name> <path>"
    .description "Add the path to the store with the given name."
    .action ( sName, sPath ) ->
        console.log "add: #{ sName }, #{ sPath }"

# show command
program
    .command "show <name>"
    .description "Shows the path corresponding to the given name."
    .action ( sName ) ->
        console.log "show: #{ sName }"

# remove command
program
    .command "remove <name>"
    .description "Remove the path stored by sote at the given name."
    .action ( sName ) ->
        console.log "remove: #{ sName }"

# clear command
program
    .command "clear"
    .description "Clear all the paths stored by sote. Ask for confirmation before acting."
    .action ->
        console.log "clear"

# jump (default) command
program
    .command "*"
    .description "Jumps to the path corresponding to the given name."
    .action ( sName ) ->
        console.log "jump: #{ sName }"

program.parse process.argv

program.help() if NO_COMMAND_SPECIFIED
