#!/bin/bash
{ #variable_section
    __variable_="" #dummy
    __variable_argument_1="${1}"
}

{ #function_section
    __function() { :; } #dummy
    __function_usage() {
        echo "usage  :"
        echo "   ${0} [option]"
        echo "option :"
        echo "   -h --help   : show help"
    }
}

function __main() {
    case ${__variable_argument_1} in
        "-h" | "--help" ) __function_usage ;;
        [-]* ) echo "unknown option: ${__variable_argument_1}" ;;
        * ) echo "e: this is not option" ;;
    esac
}
__main
