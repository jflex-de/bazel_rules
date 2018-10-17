#!/bin/sh
echo "This is not really CUP"
echo "CUP ARGUMENTS=$*"

destdir="."
parser="parser"
sym="sym"

while true; do
    case "${1}" in
    -destdir)
        destdir=${2}
        shift 2
        ;;
    -parser)
        parser=${2}
        shift 2
        ;;
    -symbols)
        sym=${2}
        shift 2
        ;;
    *)
        args=${@}
        break
        ;;
    esac
done

cat > ${destdir}/${parser}.java << _EOF_
class ${parser} {}
_EOF_

cat > ${destdir}/${sym}.java << _EOF_
class ${sym} {}
_EOF_
