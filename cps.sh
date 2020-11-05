#!/bin/bash
{ #variable_section
    __variable_="" #dummy
    __variable_argument_1="${1}"
    __variable_argument_2="${2}"
    __variable_filedata=""
}

{ #function_section
    __function_() { :; } #dummy
    __function_usage() {
        echo "usage  :"
        echo "   ${0} [option]"
        echo "option :"
        echo "   -h --help    : show help"
        echo "   -e --encrypt : encrypt to .cps"
        echo "   -d --decrypt : decrypt from .cps"
    }
    __function_encrypt(){
        if [[ -z ${1} ]] ; then
            echo "file empty"
        else
            echo "encrypting:${1}"
            __function_encrypt_process "${1}"
        fi
    }
    __function_decrypt(){
        if [[ -z ${1} ]] ; then
            echo "file empty"
        elif [[ ${1} =~ .*\.cps ]] ; then
            echo "decrypting:${1}"
            __function_decrypt_process "${1}"
        else
            echo "cant decrypt this file"
        fi
    }
    __function_encrypt_process(){
        echo ${1}
        __variable_filedata=$(echo "obase=16;ibase=8;$(od -An ${1} | tr -d "\n ")" | bc | tr -d "\n\\")
        echo ${#__variable_filedata}
        echo $(od -An ${1})
        for (( i = 0; i < 10; i++ )); do
            :
        done
        #odじゃなくてxxd使ったらいいかも
        echo ${__variable_filedata} > ${1}.cps
    }
    __function_decrypt_process(){
        echo "obase=8;ibase=16;$(od -An ${1} | tr -d "\n ")" | bc | tr -d "\n\\"
    }
}

function __main() {
    #cd `dirname "$0"`
    pwd
    if [[ ${__variable_argument_1} =~ -[a-zA-Z0-9]+ ]] ; then
        echo "debug:sec_option"
        case ${__variable_argument_1} in
            "-h" | "--help" ) __function_usage ;;
            "-e" | "--encrypt" ) __function_encrypt "${__variable_argument_2}" ;;
            "-d" | "--decrypt" ) __function_decrypt "${__variable_argument_2}" ;;
            [-]* ) echo "unknown option: ${__variable_argument_1}" ;;
            * ) echo "e: this is not option" ;;
        esac
    elif [[ ${__variable_argument_1} =~ [^\ \t\f\r\n]+ ]] ; then
        echo "debug:sec_string"
        if [[ ${__variable_argument_1} =~ .*\.cps ]] ; then
            __function_decrypt "${__variable_argument_1}"
        else
            __function_encrypt "${__variable_argument_1}"
        fi
    else
        echo "debug:sec_none"
        echo "file empty"
    fi
}
__main
