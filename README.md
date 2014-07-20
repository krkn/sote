# sote 

> Shell favorites paths, for faster `cd`.

* * *

**sote** is like a perpetual `pushd` : he stores your favorites system paths, so you can jump to it by typing `sote <name>`.

## Getting Started

**sote** is a *bash function*, so you'll need to install it somewhere and tell your bash shell to use it.  
I suggest you the following procedure : it will stores **sote** in your `HOME` directory, then link it in your `~/.bash_profile`, and finally call sote to be able to use it directly.

    $ git clone https://github.com/leny/sote ~/.sote && echo "source ~/.sote/bin/sote" >> ~/.bash_profile && source ~/.sote/bin/sote

## Usage

    sote [options] <name>

        Name:

            *                      Jumps to the path corresponding to the given name.

        Options:

            -h, --help                   Output usage information
            -v, --version                Output the version number
            -l, --list                   Lists the paths stored by sote.
            -s, --show <name>            Shows the path corresponding to the given name.
            -a, --add <name> [path]      Add the path to the store with the given name. If no path is given, use current path.
            -r, --remove <name>          Remove the path stored by sote at the given name.
            -c, --clear                  Clear all the paths stored by sote. Ask for confirmation before acting.
    
### Example

An explicit image is better than thousands words, so : 

[!sote example](./example.png)

## Contributing

In lieu of a formal styleguide, take care to maintain the existing coding style.

## Release History

* **0.1.0**: Rewrite in bash, first release (*17/07/14*)
* **0.0.1**: Starting project (*19/06/14*)

### TODO

* [ ] Check/Fix compatibility with
    * [ ] Linux
    * [ ] Windows

## License

Copyright (c) 2014 leny  
Licensed under the MIT license.
