#!/bin/bash

if which docsify-auto-sidebar
then
    echo ""
else
    echo "Pls install 'docsify-tools'\n'npm i -g docsify-tools'"
fi

docsify-auto-sidebar -d ./
