#!/bin/bash
# name=tool.sh #
{ #define variables
  #ln_genid=`echo "obase=16;\`date "+%Y%m%d%H%M%S"\`${RANDOM}" | bc | tr -d "-"`
  ln_argument=`echo ${1} | tr -d "-"`

}

{ #define function
function ln_func_usage() { cat << USAGE
usage:
  $0 [option] arg1
  $0 [-m] <type> <name>
Options:
  -m --make : make file
  -h --help : display help
  -[string] : string hoge
  -[number] : number hoge
USAGE
exit 1 ; }

function ln_func_make() {
  vim ${1}.sh
  chmod +x ${1}
exit 1 ; }
}

case ${1} in
  "-m" | "--make" ) ln_func_make `date "+%Y%m%d%H%M%S"` ;;
  "-h" | "--help" ) ln_func_usage ;;
  -${ln_argument} )
    case ${ln_argument} in
      *[a-zA-Z]* ) echo "string" ;;
      [0-9]* ) echo "number" ;;
    esac ;;
esac

{ #reset
  unset ln_argument
  unset ln_genid
}
