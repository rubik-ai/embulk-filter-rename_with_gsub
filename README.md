# Rename With Gsub filter plugin for Embulk

## Overview

* **Plugin type**: filter

  Column name of Embulk is renamed using String.gsub method of Ruby.

## Configuration

- **rename_regexp**: regexp of gsub(Regexp.compile(regexp), replacement)

  If you would like to specify backslash espace (for instance "\s"), remove double quote.

- **replacement**: replacement of gsub(pattern, replacement)


## Example

```yaml
filters:
  - filter:
    type: rename_with_gsub
    rename_regexp: "-"
    replacement: " "

  - filter:
    type: rename_with_gsub
    rename_regexp: \s
    replacement: "/"

  - filter:
    type: rename_with_gsub
    rename_regexp: bar
    replacement: bread
```

original

column0 name: hoge-hoge
column1 name: foo
column3 name: bar-bar

```
+------------------+------------+--------------------+--------------------+-------------------+
| hoge/hoge:string | foo:string | bread/bread:string | @undefined:boolean |   @timestamp:long |
+------------------+------------+--------------------+--------------------+-------------------+
|                3 |          2 |                  1 |              false | 1,465,773,184,000 |
+------------------+------------+--------------------+--------------------+-------------------+
```

## Install
```
$ embulk gem install embulk-filter-rename_with_gsub
```

## Preview

```
$ embulk preview sample_config/sample_config.yml
```

**sample_config.yaml** requires embulk-parser-regexp.

## Run

```
$ embulk run sample_config/sample_config.yml
```

**sample_config.yaml** requires embulk-parser-regexp.
