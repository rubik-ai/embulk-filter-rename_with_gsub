# Rename With Gsub filter plugin for Embulk

TODO: Write short description here and embulk-filter-rename_with_gsub.gemspec file.

## Overview

* **Plugin type**: filter

## Configuration

- **option1**: description (integer, required)
- **option2**: description (string, default: `"myvalue"`)
- **option3**: description (string, default: `null`)

## Example

```yaml
filters:
  - type: rename_with_gsub
    option1: example1
    option2: example2
```


## Build

```
$ rake
```
