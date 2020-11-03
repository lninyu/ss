#!/bin/bash
{ #variable_section
    __variable_=""
    __variable_filename=""
    __variable_loop_0=""
    __variable_argument_1="${1}"
}

{ #function_section
    __function() { :; }
    __function_usage() {
        echo "usage  :"
        echo "   ${0} [option]"
        echo "option :"
        echo "   -h --help   : show help"
        echo "   -b --build  : build"
        echo "   -u --update : overwrite (default)"
    }
    __function_update() {
        for __variable_loop_0 in $(ls) ; do
            if [[ ${__variable_loop_0} =~ .*\.sh ]] ; then
                printf "f_update:${__variable_loop_0}    "
                __variable_filename=$(echo ${__variable_loop_0} | tr -d ".sh")
                cp -v ${__variable_filename}.sh exec
                mv exec/${__variable_filename}.sh exec/${__variable_filename}
                chmod +x exec/${__variable_filename}
            fi
        done
    }
    __function_build() {
        : ; echo "ignored"
    }
}

function __main() {
    cd `dirname $0`
    mkdir exec > /dev/null 2>&1
    if [ -z "${__variable_argument_1}" ] ; then
        __function_build
    else
        case ${__variable_argument_1} in
            "-h" | "--help" ) __function_usage ;;
            "-u" | "--update" ) __function_update ;;
            "-b" | "--build" ) __function_build ;;
            [-]* ) echo "unknown option: ${__variable_argument_1}" ;;
            * ) echo "e: this is not option" ;;
        esac
    fi
}
__main
