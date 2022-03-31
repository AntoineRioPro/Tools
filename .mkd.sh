#!/bin/sh

if [ $# -eq 0 ]; then
    echo "usage: mkd [path]"
    exit 1
fi
path=$PWD
while [ $# -ne 0 ]; do
    IFS="/"
    l=0
    for i in $1; do
        l=$(($l+1))
    done
    i=1
    for d in $1; do
        if [ $i -ne $l ]; then
            if ! [ -e $d ]; then
                mkdir $d
            fi
            cd $d
        else
            if ! [ -e $d ]; then
                touch $d;
            fi
            if [[ "$d" == *.sh ]]; then
                chmod 744 $d
                echo "#!/bin/sh" >> $d
            fi
        fi
        i=$(($i+1))
    done
    shift
    IFS=" "
    cd $path
done
