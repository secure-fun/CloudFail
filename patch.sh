#!/bin/bash
if [ $UID -ne 0 ]; then
        echo "Please run this script as root!"
        exit 1
fi
pyver=$( python -c 'import sys; print(sys.version_info.minor)' )
bs4=/usr/local/lib/python3.$pyver/dist-packages/bs4/element.py
sed -i "s/import collections/import collections\ncollections.Callable = collections.abc.Callable/gi" $bs4
if [ $? -ne 0 ]; then
        echo "Error patching file $bs4 ! :-("
        exit 2
fi
echo "File $bs4 successfully patched! :-)"

exit 0
