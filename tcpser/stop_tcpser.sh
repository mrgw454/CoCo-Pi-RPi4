#!/bin/bash

echo "Stopping modem emulator (tcpser)..."
echo ""

kill $(ps aux | grep 'tcpser' | awk '{print $2}')

cd $HOME/.mame


