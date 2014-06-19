#!/usr/bin/env node

/*
 * sote
 * https://github.com/Leny/sote
 *
 * JS/COFFEE Document - /sote.js - main entry point, commander setup and runner
 *
 * Copyright (c) 2014 Leny
 * Licensed under the MIT license.
 */
"use strict";
var NO_COMMAND_SPECIFIED, chalk, error, pkg, program, store, success, table;

program = require("commander");

store = require("./store.js");

chalk = require("chalk");

table = require("text-table");

error = chalk.bold.red;

success = chalk.bold.green;

pkg = require("../package.json");

NO_COMMAND_SPECIFIED = process.argv.length === 2;

program.version(pkg.version);

program.command("list").description("Lists the paths stored by sote.").action(function() {
  var aProperties, sProperty, sValue;
  aProperties = (function() {
    var _ref, _results;
    _ref = store.all();
    _results = [];
    for (sProperty in _ref) {
      sValue = _ref[sProperty];
      _results.push([sProperty, sValue]);
    }
    return _results;
  })();
  if (!aProperties.length) {
    console.log("There's no path in the store (yet)");
    process.exit(0);
  }
  console.log(table(aProperties));
  return process.exit(0);
});

program.command("add <name> <path>").description("Add the path to the store with the given name.").action(function(sName, sPath) {
  return console.log("add: " + sName + ", " + sPath);
});

program.command("show <name>").description("Shows the path corresponding to the given name.").action(function(sName) {
  return console.log("show: " + sName);
});

program.command("remove <name>").description("Remove the path stored by sote at the given name.").action(function(sName) {
  return console.log("remove: " + sName);
});

program.command("clear").description("Clear all the paths stored by sote. Ask for confirmation before acting.").action(function() {
  return console.log("clear");
});

program.command("*").description("Jumps to the path corresponding to the given name.").action(function(sName) {
  return console.log("jump: " + sName);
});

program.parse(process.argv);

if (NO_COMMAND_SPECIFIED) {
  program.help();
}
