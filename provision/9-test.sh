#!/bin/bash
tput setaf 2; echo '#1 [OS]'; tput sgr0;
lsb_release -a
tput setaf 2; echo '#2 [disk]'; tput sgr0;
df -h | grep /dev/sda1
tput setaf 2; echo '#3 [dbdeployer]'; tput sgr0;
dbdeployer versions
tput setaf 2; echo '#4 [postgresql]'; tput sgr0;
psql -V
tput setaf 2; echo '#5 [anyenv]'; tput sgr0;
anyenv version
