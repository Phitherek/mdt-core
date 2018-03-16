# MDT - Modular Deployment Tool (Core)

MDT is a deployment automation tool that is designed to be simple and easily extended by additional modules. It is written in Ruby and takes advantage of Ruby tools, but it can be used to deploy almost anything if there is a module for it.

## Requirements

* Ruby (tested with 2.5.0, earlier versions down to 2.0 may also work)
* RubyGems

## Installation

`gem install mdt-core`

Be sure to also install any modules that you need.

Alternatively, please see [mdt](https://github.com/Phitherek/mdt "mdt") for the convenience gem providing the basic modules.

## Usage

The gem installs an executable called `mdt` that is used in a way described below:

`mdt [options] <config_key>`

By default it searches for the deployment configuration in `config/mdt-deploy.yml`. Options can be any of: `-c CONFIG_FILE_PATH`, `--config CONFIG_FILE_PATH`, `-h`, `--help`. `config_key` is required.

## Deployment configuration file

See `config/mdt-deploy.yml.example` for example deployment configuration file with comments.

## The concept

MDT defines 5 modular objects that can be used to build a simple deploy flow. These objects are:

* Directory choosers - each of them defines how a deploy directory should be created, set as a working directory and, if necessary, removed on deploy failure.
* Fetchers - each of them defines how the project contents should be fetched into the deploy directory.
* Commands - each of them represents a single command executed in the deploy.
* Command modifiers - each of them represents an expression that can be prepended to the command (like e.g. `bundle exec` from Ruby Bundler or environment variables). The way they are prepended is ultimately decided by the specific command.
* Command groups - these are present only in the configuration and can be used to group together a set of other commands and command groups, describe it and add common parameters like command modifiers or make the whole group not fail the deploy.

## Known modules

* [mdt-dummy](https://github.com/Phitherek/mdt-dummy "mdt-dummy") - a module containing dummy implementations of each extensible MDT class. They can be used to skip a particular deployment step.
* [mdt-simple](https://github.com/Phitherek/mdt-simple "mdt-simple") - a module that contains simple implementations for MDT.
* [mdt-versioned](https://github.com/Phitherek/mdt-versioned "mdt-versioned") - a module that implements versioned releases deployment flow for MDT.

## Contributing

You can contribute to the development of MDT by submitting an issue or pull request. You can also extend MDT's capabilities by creating your own module in accordance with guidelines in MODULE_GUIDELINES.md and submitting it to RubyGems.

## Documentation

Generated RDoc documentation can be found [here](http://www.rubydoc.info/github/Phitherek/mdt-core "here").