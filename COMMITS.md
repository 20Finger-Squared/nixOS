# How to format a commit message:
To format a commit you must prepend the commit message with one of these tags:
- module:
- package:
- config:
- docs:
- fix:
- feat:
- refactor:
- test:
- multiple:

# what each tag should be used for
## module:
This is for module updates to a specific module.
`module: increase DWM window border width`
## package:
Update/down-grade, implement, creation, or removal of a package.

### input:
For when you downgrade upgrade or remove a package simply use the relevant tag to do so.
Include the ./flake.lock in the staging area.
```
pkg: downgrade <flake.nix> to <input>
```

### implement
To implement a package do this format
`package: implement <package>`

### update or down-grade
To update a package give the nixpkgs version and the version of the package.
`package: update nixpkgs <nix-version> <package> to version <software-version-number>`

### creation
To create a package give this format:
`package: create custom package for <package>`
If it is a wrapper then do it like so:
`package: create custom wrapper for <package>`

### removal
To remove a package give this format
`package: remove <package>`
## config:
Changing the configuration for a multiple settings for a specific item.
`config: add Bluetooth`

## docs:
Update/down-grade, implement, creation, or removal of documentation.

### missing
To add missing parts of a doc.
`docs: add missing sub-tag called missing ./flake.nix`
`docs: <item> <file>`

### implement
To implement new docs and what they are for.

`docs: implement <file-name>.md`
```
Create new documentation: dwm module configuration options
```

### update
To update docs you must say what you are improving
`docs: update <item> in <file-name>.md`

## fix:
Fix an existing issue within a item.
`fix: <item>: <issue>`
`fix: dwm: borderpx not applying correctly`
or
`fix: dwm`
`borderpx not applying correctly - wasn't implemented yet`
The expectation is that if the commit needs a description as well,
then include more details as to why the issue happened.

## feat:
Introduction of a new feature:
`feat: <item> in <file>`
```
<why this is needed>
```

## refactor:

### file-structure:
`refactor: move hosts from <old-path> <new-path>`
These must always be relative paths from the root of the configuration; for example;
```
./custom-modules/dmenu/center.diff
./custom-modules/dmenu/new-dir/center.diff
```
if the path names are too long to make a commit message parsable then do this format:
`refactor: move`
```
from: <old-path>
to: <new-path>
```
i.e
```
from: ./custom-modules/dmenu/center.diff
to: ./custom-modules/dmenu/new-dir/center.diff
```

### module location:
`refactor: move <module> from <old-file-path> to <new-file-path>`
or
`refactor: move <module>`
```
from: <old-file-path>
to: <new-file-path>
```

## multiple actions:
This is for doing multiple actions that are related to the same tag and sub-tag.

example:
`<tag>: <sub-tag>`
```
<typical-description for each item>
```
each item must either be a bullet point or numbered list.
# The state of a pushed commit
The state of a commit is that it should be working.
If the commit works on the system and builds then it works.
If you get a build failure then I shouldn't push the commit.

# testing a new thing
If I am testing a new feature it will be added to a branch with the same format as whatever I hope for it to accomplish.
Branch names are formated like so:
a `/` instead of a `:` and `-` instead of spaces.
