#!/bin/bash

ln_random_arg=`echo ${1} | tr -d "-"`
#ln_random_cg="\033[32m%s\033[m"
ln_random_cr="\033[31m%s\033[m"
ln_random_n(){
    echo ""
    }

ln_random_ee(){
    printf "${ln_random_cr}\n" "${1}"
    }

ln_random_ge(){
    for ln_random_l1 in `seq ${ln_random_con}`
    do echo -n "$((${RANDOM}%${ln_random_num}))"
    done
    ln_random_n
    }

ln_random_ua(){
    printf "\033[36musage : g_random <length>\n        g_random [option] <length>\noption: -h --help : show help\n        -[1-16]   : n-ary (default 10)\033[m\n"
    }

case ${1} in
    [0-9]* )
        ln_random_num=10
        ln_random_con=${1}
        printf "${ln_random_cg}" `ln_random_ge`
        [[ -n "${2}" ]] && ln_random_ee "	warn:unnecessary argument" || ln_random_n
    ;;
    "-h" | "--help" )
        for ln_random_l0 in "tr" "printf" "seq" "bc"; do
            type ${ln_random_l0} > /dev/null 2>&1 && printf "hello ${ln_random_l0}!  " || printf "who is ${ln_random_l0}?  "
        done
        ln_random_n
        ln_random_ua
    ;;
    -1 )
        ln_random_num=1
        [[ -n "${2}" ]] && {
                ln_random_con=${2}
                printf "%s\n" `ln_random_ge`
            } || ln_random_ee "error:second argument is empty"
    ;;
    -${ln_random_arg} )
    [[ ${ln_random_arg} -le 16 ]] && {
            ln_random_num=${ln_random_arg}
            [[ -n "${2}" ]] && {
                    ln_random_con=$((${2}*2))
                    ln_random_s0=`ln_random_ge`
                    ln_random_s1=`echo "obase=${ln_random_arg};ibase=10;${ln_random_s0}" | bc | tr -d '\' | tr -d '\n'`
                    printf "%s\n" ${ln_random_s1:0:$((${ln_random_con}/2))}
                } || ln_random_ee "error:illegal arguments"
        } || ln_random_ee "error:${ln_random_arg}<17"
    ;;
    * )
        ln_random_ee "error:illegal argument"
        ln_random_ua
    ;;
esac
unset ln_random_ge ln_random_ua ln_random_arg ln_random_cr ln_random_cg ln_random_l0 ln_random_l1 ln_random_con ln_random_num ln_random_s0 ln_random_s1
