###
 * sote
 * https://github.com/Leny/sote
 *
 * JS/COFFEE Document - /store.js - store class
 *
 * Copyright (c) 2014 Leny
 * Licensed under the MIT license.
###

fs = require "fs"
path = require "path"

oFSOptions =
    encoding: "utf8"

oEmptyStore =
    version: 1
    content: {}

sStorePath = path.resolve process.env.HOME or process.env.HOMEPATH or process.env.USERPROFILE, ".sote"

oStore = null

exports.all = all = ->
    load() unless oStore
    oStore.content

exports.load = load = ->
    return oStore = oEmptyStore unless fs.existsSync sStorePath
    oStore = fs.readFileSync sStorePath, oFSOptions

exports.get = get = ( sKey ) ->
    load() unless oStore
    oStore.content[ sKey ]

exports.set = set = ( sKey, sValue ) ->
    load() unless oStore
    oStore.content[ sKey ] = sValue

exports.save = save = ->
    fs.writeFileSync sStorePath, oStore, oFSOptions
