# Module creation guidelines

There are a few things to take into account when creating a MDT module. This document is an attempt to summarize them.

## Gem naming convention

Because of the way MDT handles autoloading gems, you should always use `mdt-<something>` as a name of the gem. Otherwise the autoloading process will not include them and that may cause problems with the users of your module.

## Gem structure

An MDT module gem should have the following structure:

```
-- Gemfile
-- Gemfile.lock
-- mdt-<something>.gemspec
-- .gitignore
-- LICENSE
-- README.md
-- lib
  |
  -- mdt-<something>.rb
  -- mdt
    |
    -- version.rb
    -- fetchers.rb
    -- directory_choosers.rb
    -- commands.rb
    -- command_modifiers.rb
    -- fetchers
      |
      <fetchers_key>.rb
      ...
    -- directory_choosers
      |
      <directory_choosers_key>.rb
      ...
    -- commands
      |
      <commands_key>.rb
      ...
    -- command_modifiers
      |
      <command_modifiers_key>.rb
      ...
-- spec
```

The most important thing to remember is that the top file in lib should be named exactly as a gem because of the MDT autoloading process. The rest is just an example, if your module does not define a subclass for a particular object type then it is not required.

## Module separation convention

A module can include commands for a programming language and its standard tooling or custom tools. It can also define a flow using directory choosers and/or fetchers. A decision whether or not to separate the objects to a separate module or to keep them together in one should take these points into account:

* When making a module for a programming language it should refer only to the standard tools included with the language. Any additional tools should be separated to their own modules.

* When making a module that includes a way to fetch a code with a particular tool or to choose a deploy directory with the use of a particular tool or flow, it should also include commands and command modifiers related to the tool or flow. When making a module that uses a tool to define commands or command modifiers, it should also include fetchers or directory choosers if it can be used to define a deploy flow. A module for a particular tool or flow should be single and as complete as possible.

## Module distribution

MDT modules that meet these guidelines should be distributed as gems, preferrably through the official RubyGems service.

## Testing and documentation

Modules should be tested and documented as good as possible.