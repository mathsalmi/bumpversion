# bumpversion

Bumps version semver-style and stores the result in a file.

## Options

- 1st arg: the file to store the versions. Required
- 2nd arg: the semver part to be bumped (`major`,  `minor`, or `patch`). Optional, defaults to `patch`.

## Examples

```
# creates the file and stores 0.0.1
$ bumpversion.sh file_name 

# increments major and zeroes minor and patch
$ bumpversion.sh file_name major

# keeps major, increments minor and zeroes patch
$ bumpversion.sh file_name minor

# keeps major and minor, and increments patch
$ bumpversion.sh file_name patch

```
