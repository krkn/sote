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
    oStore = JSON.parse fs.readFileSync sStorePath, oFSOptions

exports.exists = exists = ( sKey ) ->
    load() unless oStore
    !!oStore.content[ sKey ]

exports.get = get = ( sKey ) ->
    load() unless oStore
    oStore.content[ sKey ]

exports.set = set = ( sKey, sValue ) ->
    load() unless oStore
    oStore.content[ sKey ] = sValue

exports.remove = remove = ( sKey ) ->
    load() unless oStore
    delete oStore.content[ sKey ]

exports.save = save = ->
    fs.writeFileSync sStorePath, JSON.stringify( oStore ), oFSOptions
