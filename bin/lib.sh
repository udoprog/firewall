#!/bin/sh

FILE=$0
[ -L $FILE ] && FILE=`readlink $FILE`
ROOTDIR=`dirname $FILE`/..

. $ROOTDIR/conf/variables

# Read the configuration file and print only appropriate lines to stdout.
read_conf() {
    cat $1 | egrep -v "^(\s*#|\s*$)"
}

# Exec a statement
# if VERBOSE is "y", echo the statement to stdout is set.
exec_stmt() {
    out_info "$@"
    eval "$@"
}

out_info() {
    [ "x$VERBOSE" = "xy" ] && { echo "$@"; }
}

assert_root() {
    [ "`id -u`" != "0" ] && {
        echo "You must be superuser";
        exit 1;
    }
}
