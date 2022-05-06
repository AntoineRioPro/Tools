#/bin/sh

if [ $# -eq 0 ]; then
    echo "usage: submit [files] [options], see -h for help"
    exit 1
fi

push=0
message=""
while [ $# -ne 0 ]; do
    case $1 in
        -h)
            echo "usage: submit [files]
-h: help
-u adds all the files that changed since last commit
-cm msg: commit and add a message msg to tag or/and commit
-t tag msg: adds a tag with tag to last commit
-l: show the logs
-p: push"
            exit 0
            ;;
        -cm)
            shift
            if [ $# -eq 0 ]; then
                echo "usage: submit -m message"
                exit 1
            fi
            message="$1"
            shift
            echo $message
            git commit -m "$message"
            if [ $? -ne 0 ]; then
                echo "submit: error in commit $message"
            else
                echo "submit: commit with: $message"
            fi
            push=1
            ;;
        -t)
            shift
            if [ $# -eq 0 ]; then
                echo "usage: submit -t tag (-m message (optionnal))"
                exit 1
            fi
            if [ ${#message} -eq 0 ]; then
                git tag -a $1 -m "$message"
                shift
            else
                git tag -a $1 -m "$message"
            fi
            ;;
        -l)
            git log
            exit 0
            ;;
        -p)
            if [ $push -eq 0 ]; then
                git push --tags
            else
                git push --follow-tags
            fi
            exit 0
            ;;
        -u)
            shift
            git add -u
            ;;
        *)
            if [ ! -f $1 && ! -d $1 ]; then
                echo "submit: $1 not found"
            else
                git add $1 --ignore-errors
                if [ $? -ne 0 ]; then
                    echo "submit: $1 error in adding"
                else
                    echo "submit: $1 added"
                fi
            fi
    esac
    shift
done
