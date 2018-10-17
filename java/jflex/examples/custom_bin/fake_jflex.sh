#!/bin/sh
echo "This is not really Jflex"
echo "JFLEX ARGUMENTS=$*"

OPTIND=1
while getopts "d:" opt; do
    echo "opt=$opt=${OPTARG}"
    case "$opt" in
    d)  output_dir=${OPTARG}
        ;;
    esac
done
shift $((OPTIND-1))

[ "${1:-}" = "--" ] && shift

cat > ${output_dir}/Empty.java << _EOF_
class Empty {}
_EOF_
