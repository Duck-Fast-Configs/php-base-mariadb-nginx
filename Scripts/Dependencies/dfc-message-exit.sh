#!/bin/bash

if [[ $1 != "-d1" ]]; then
    message_space 1
    message_input "Нажмите на ENTER чтобы выйти\n"
    message_input "=> "
    read -p '' >&3
fi

exit
