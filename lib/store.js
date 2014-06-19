
/*
 * sote
 * https://github.com/Leny/sote
 *
 * JS/COFFEE Document - /store.js - store class
 *
 * Copyright (c) 2014 Leny
 * Licensed under the MIT license.
 */
var all, exists, fs, get, load, oEmptyStore, oFSOptions, oStore, path, remove, sStorePath, save, set;

fs = require("fs");

path = require("path");

oFSOptions = {
  encoding: "utf8"
};

oEmptyStore = {
  version: 1,
  content: {}
};

sStorePath = path.resolve(process.env.HOME || process.env.HOMEPATH || process.env.USERPROFILE, ".sote");

oStore = null;

exports.all = all = function() {
  if (!oStore) {
    load();
  }
  return oStore.content;
};

exports.load = load = function() {
  if (!fs.existsSync(sStorePath)) {
    return oStore = oEmptyStore;
  }
  return oStore = JSON.parse(fs.readFileSync(sStorePath, oFSOptions));
};

exports.exists = exists = function(sKey) {
  if (!oStore) {
    load();
  }
  return !!oStore.content[sKey];
};

exports.get = get = function(sKey) {
  if (!oStore) {
    load();
  }
  return oStore.content[sKey];
};

exports.set = set = function(sKey, sValue) {
  if (!oStore) {
    load();
  }
  return oStore.content[sKey] = sValue;
};

exports.remove = remove = function(sKey) {
  if (!oStore) {
    load();
  }
  return delete oStore.content[sKey];
};

exports.save = save = function() {
  return fs.writeFileSync(sStorePath, JSON.stringify(oStore), oFSOptions);
};
