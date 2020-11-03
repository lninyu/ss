#!/bin/bash
{ #variable_section
    ln_ary_variable_="" #dummy
    ln_ary_variable_argument_1="${1}"
    ln_ary_variable_argument_2="${2}"
}

{ #function_section
    ln_ary_function() { :; } #dummy
    ln_ary_function_usage() {
        echo "usage  :"
        echo "   ${0} num [ibase]"
        echo "option :"
        echo "   -h --help   : show help"
    }
}

function ln_ary_main() {
    case ${ln_ary_variable_argument_1} in
        "-h" | "--help" ) ln_ary_function_usage ;;
        [0-9A-F]* )
        if [ -z "${ln_ary_variable_argument_2}" ] ; then
            ln_ary_variable_argument_2=10
        fi
        if [ -z "${ln_ary_variable_argument_1}" ] ; then
            echo "'$1' is empty"
        else
            echo " > > ${ln_ary_variable_argument_1}"
            for ln_ary_variable_loop_0 in {2..16}; do
                echo "$(echo ${ln_ary_variable_loop_0} | xargs -P1 printf '%02g\n') : $(echo "obase=${ln_ary_variable_loop_0};ibase=${ln_ary_variable_argument_2};${ln_ary_variable_argument_1}" | bc | tr -d '\' | tr -d '\n')"
            done
        fi ;;
        [-]* ) echo "unknown option: ${ln_ary_variable_argument_1}" ;;
        * ) echo "e: this is not option" ;;
    esac
}
ln_ary_main
unset ln_ary_variable_ ln_ary_variable_argument_1 ln_ary_variable_argument_2 ln_ary_function ln_ary_function_usage ln_ary_main
