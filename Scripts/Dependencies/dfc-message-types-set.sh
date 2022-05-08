#!/bin/bash

if [[ $1 == "-d1" ]]; then
    GLOBAL_LEVEL_DEBUG=1
else
    GLOBAL_LEVEL_DEBUG=2
fi

message_info() {
    text=$1
    level_debug=$2
    Color_Off='\033[0m'
    BIGreen='\033[0;32m'
    
    if [[ $level_debug -le $GLOBAL_LEVEL_DEBUG ]]; then
        printf "${BIGreen}| ⓘ  ${text}${Color_Off}\n" >&3
    elif [[ $level_debug > $GLOBAL_LEVEL_DEBUG ]]; then
        echo "| ${text}\n" >&1
    fi
}

message_input() {
    text=$1
    Color_Off='\033[0m'
    BIGreen='\033[0;32m'
    printf "${BIGreen}| ${text}${Color_Off}" >&3
}

message_error() {
    text=$1
    Color_Off='\033[0m'
    BIGreen='\033[0;32m'
    printf "${BIGreen}| ⓘ  ${text}${Color_Off}\n"
}

message_space() {
    level_debug=$1
    Color_Off='\033[0m'
    BIGreen='\033[0;32m'

    if [[ $level_debug -le $GLOBAL_LEVEL_DEBUG ]]; then
        printf "${BIGreen}|${Color_Off}\n" >&3
    elif [[ $level_debug > $GLOBAL_LEVEL_DEBUG ]]; then
        echo "| ${text}\n" >&1
    fi
}

message_space_null() {
    printf "\n" >&3
}
