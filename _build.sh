#!/bin/bash
{ #variable_section
    ln_build_variable_=""
    ln_build_variable_filename=""
    ln_build_variable_loop_0=""
    ln_build_variable_argument_1="${1}"
}

{ #function_section
    ln_build_function() { :; }
    ln_build_function_usage() {
        echo "usage  :"
        echo "   ${0} [option]"
        echo "option :"
        echo "   -h --help   : show help"
        echo "   -b --build  : build"
        echo "   -u --update : overwrite (default)"
    }
    ln_build_function_update() {
        for ln_build_variable_loop_0 in $(ls) ; do
            if [[ ${ln_build_variable_loop_0} =~ .*\.sh ]] ; then
                printf "${ln_build_variable_loop_0}    "
                ln_build_variable_filename=$(echo ${ln_build_variable_loop_0} | sed -e 's/.sh//g')
                cp -v ${ln_build_variable_filename}.sh exec
                mv exec/${ln_build_variable_filename}.sh exec/${ln_build_variable_filename}
                chmod +x exec/${ln_build_variable_filename}
            fi
        done
    }
    ln_build_function_build() {
        : ; echo "ignored"
    }
}

function ln_build_main() {
    echo "update:$(date "+%Y/%d/%m/%H:%M:%S")"
    cd `dirname $0`
    mkdir exec > /dev/null 2>&1
    if [ -z "${ln_build_variable_argument_1}" ] ; then
        ln_build_function_build
    else
        case ${ln_build_variable_argument_1} in
            "-h" | "--help" ) ln_build_function_usage ;;
            "-u" | "--update" ) ln_build_function_update ;;
            "-b" | "--build" ) ln_build_function_build ;;
            [-]* ) echo "unknown option: ${ln_build_variable_argument_1}" ;;
            * ) echo "e: this is not option" ;;
        esac
    fi
}
ln_build_main
unset ln_build_variable_ ln_build_variable_loop_0 ln_build_variable_filename ln_build_variable_argument_1
unset ln_build_function ln_build_function_build ln_build_function_usage ln_build_function_update ln_build_main
