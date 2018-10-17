#!/bin/sh
echo "This is not really CUP"

destdir="."
parser="parser"
sym="sym"
args=""
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

"FAKE CUP -destdir=${destdir} -parser ${parser} -symbols ${sym} -- ${args}"

cat > ${destdir}/${parser}.java << _EOF_
class ${parser} {}
_EOF_

cat > ${destdir}/${sym}.java << _EOF_
class ${sym} {}
_EOF_
