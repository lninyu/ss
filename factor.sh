#! /bin/bash
function factor () {
	num=2
	while [ ${num} -le `expr ${1} / ${num}` ]; do
		if [ `expr ${1} % ${num}` -eq 0 ] ; then
			echo -n " * ${num}"
			factor `expr ${1} / ${num}`
			return
		else
			num=`expr ${num} + 1`
		fi
	done
	echo " * ${1}"
}
if [ "${1}" == "" ]; then
	echo "Usage: ${0} number"
	exit 1
fi
echo -n "1"
factor ${1}
