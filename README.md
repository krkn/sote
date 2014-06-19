# sote 

[![NPM version](http://img.shields.io/npm/v/sote.svg)](https://www.npmjs.org/package/sote) ![Dependency Status](https://david-dm.org/leny/sote.svg) ![Downloads counter](http://img.shields.io/npm/dm/sote.svg)

> Shell favorites paths, for faster `cd`.

* * *

**Note:** sote is not ready yet. I should probably rewrite it in bash. Wait & see... :)

* * *

**sote** is like a perpetual `pushd` : he stores your favorites system paths, so you can jump to it by typing `sote name`.

## Getting Started

**sote** is a command-line tool, so it is preferable to install it globally.

    (sudo) npm install -g sote
    
**note:** for now, **sote** has only been tested with *Mac OS X*.

## Usage

    sote [options] [name]
    
### Basic usage

    sote name
    
Jumps to the path corresponding to the given name.

### List

    sote list
    
Lists the paths stored by **sote**.

### Add

    sote add name path
    
Add the path to the store with the given name. If no path is given, use current path.

### Show

    sote show name
    
Shows the path corresponding to the given name.

### Remove

    sote remove name
    
Remove the path stored by **sote** at the given name.

### Clear 

    sote clear
    
Clear all the paths stored by **sote**. Ask for confirmation before acting.

## Contributing

In lieu of a formal styleguide, take care to maintain the existing coding style. Lint your code using [Grunt](http://gruntjs.com).

## Release History

* **0.0.1**: Starting project (*19/06/14*)

### TODO

* [ ] Check/Fix compatibility with
    * [ ] Linux
    * [ ] Windows
* [ ] Add bash completion
* [ ] Add unit tests

## License

Copyright (c) 2014 leny  
Licensed under the MIT license.
