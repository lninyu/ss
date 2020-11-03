_func0 () {
    for _loop in _str _key ; do
        case `eval echo '$'${_loop}` in
            *[a-zA-Z2-9]* )
                echo "${loop} isnt bin" #d
                _str=
                _key=
            ;;
            [0-1]* )
                echo "${_loop} is bin" #d

            ;;
        esac
    done
    echo -n "log:"
    echo "obase=2;$((2#${_str} ^ 2#${_key}))" | bc
    }

_usage() {
    printf ""
    }

case ${1} in
    [0-1]* )
        _c
        _str="${1}"
        _key="${2}"
    ;;
    "-e" | "--encode" )
        _c
        _str="${2}"
        _key="${3}"
    ;;
    "-h" | "--help" )
        _usage
    ;;
esac

# length() { echo "$((`eval echo "${#1}"` * 8))" ; }
# length hogefugapiyohogeraqrarapqapapapapapraparaparaprapa
