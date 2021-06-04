#! /bin/bash

#
# Bumps file versions semver-style
#
# Matheus Salmi
# See: github.com/mathsalmi/bumpversion
#

_FILE=$1
_TYPE=$2

if [ -z "$_TYPE" ]
then
    _TYPE="patch"
fi

if ! grep -q "$_TYPE" <<<"major minor patch"
then
    echo_err "bumpversion: invalid increment type. Use major, minor or patch"
    exit 1
fi

VALUE=$(head -n 1 "$_FILE" 2>/dev/null)
MAJOR=$(echo "$VALUE" | perl -n -e'/(\d+)\.(\d+)\.(\d+)/ && defined($1) ? print $1 : print 0')
MINOR=$(echo "$VALUE" | perl -n -e'/(\d+)\.(\d+)\.(\d+)/ && defined($2) ? print $2 : print 0')
PATCH=$(echo "$VALUE" | perl -n -e'/(\d+)\.(\d+)\.(\d+)/ && defined($3) ? print $3 : print 0')

if [ "$_TYPE" = "major" ]
then
	MAJOR=$((MAJOR+1))
	MINOR=0
	PATCH=0
elif [ "$_TYPE" = "minor" ]
then
	MINOR=$((MINOR+1))
	PATCH=0
else
	PATCH=$((PATCH+1))
fi

echo "$MAJOR.$MINOR.$PATCH" > "$_FILE"

#
# echo_err displays an error message in red color
#
# params:
# $1 - the message
#
function echo_err {
    local -r MESSAGE="$1"

    color_err_start
    echo -e "$MESSAGE"
    color_end
}

#
# color_err_start echoes the error color markers
#
function color_err_start {
    printf '\001\033[0;91m\002'
}

#
# color_end echoes the marker that stops color modifications
#
function color_end {
    printf '\001\033[0m\002'
}
