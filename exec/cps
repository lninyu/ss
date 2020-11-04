#!/bin/bash
{ #variable_section
    __variable_="" #dummy
    __variable_argument_1="${1}"
    __variable_argument_2="${2}"
}

{ #function_section
    __function() { :; } #dummy
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
            echo "cant decrypt this file"
        else
            echo "decrypting:${1}"
            __function_decrypt_process "${1}"
        fi
    }
    __function_encrypt_process(){
        echo "obase=2;ibase=16;$(od -An ${1} | tr -d "\n ")" | bc | tr -d "\n\\" > "${1}".cps
        #二進数のデータにできるようにはした / echo "o ~ -d "\n\\"
        #factorがないので詰み
        #一応ファイルに書き出しするようにはしてる / > ${1}.cps
        #つかいものにならないfactorくんはしのうねふぁっきん
    }
    __function_decrypt_process(){
        :
    }
}

function __main() {
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
