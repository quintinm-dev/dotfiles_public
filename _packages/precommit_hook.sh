#!/bin/bash

# modified from https://stackoverflow.com/questions/3231804/in-bash-how-to-add-are-you-sure-y-n-to-any-command-or-alias
# Arg 1: prompt text override
prompt_confirm() {
    read -r -n 1 -p "${1:-Are you sure you want to continue?} [y/n] " reply
    echo ''
    if ! [[ $reply =~ [yY] ]]
    then
        return 1
    fi
}

#######################################################################################################

OUTPUT_FILE=$(pwd)/_packages/installed_debs.txt

# `eval` is bad but the command is hard-coded
query_cmd="aptitude search '~i' | grep -Fxv -f $(pwd)/_packages/initial_debs.txt | grep -iv '^..A'"
new_installs=$(eval "$query_cmd")

# Note the need to quote variables to preserve line breaks
diff_install=$(echo "$new_installs" | diff "$OUTPUT_FILE" -)
diff_status=$?

# Prevent commit if output out of date
if [ $diff_status -ne 0 ];
then
    echo -e 'Outdated deb install list, printing diff:'
    echo -e "$diff_install"

    echo -e '\nUpdate command:'
    update_cmd="$query_cmd > $OUTPUT_FILE"
    echo -e "$update_cmd"
    echo ''

    # https://stackoverflow.com/questions/3417896/how-do-i-prompt-the-user-from-within-a-commit-msg-hook
    # Allows us to read user input below, assigns stdin to keyboard
    exec < /dev/tty
    prompt_confirm "Do you want to update the file automatically?" && \
        # exit on update to add changes to git (prefer to do this manually)
        echo "$new_installs" > "$OUTPUT_FILE" && exit 1 || \
        prompt_confirm "Do you want to skip this check and commit anyway?" || exit 1
else
    echo 'Debian install list up to date'
fi
