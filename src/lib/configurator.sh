#!/bin/bash

. lib/function_exists.sh

FILE_PATH=/tmp/sinopia-config.yml

function_exists "configurator" || configurator () {
    case $1 in

        path)
            echo $FILE_PATH
        ;;

        clean)
            echo "" > $FILE_PATH
        ;;

        append)
            echo "$2" >> $FILE_PATH
        ;;

        stdinappend)
            cat >> $FILE_PATH
        ;;

        dump)
            echo "################# BEGIN SINOPIA CONFIG #################"
            cat $FILE_PATH
            echo "################## END SINOPIA CONFIG ##################"
        ;;

        *)
            error "command not found"
            return 1;
        ;;

    esac
}
