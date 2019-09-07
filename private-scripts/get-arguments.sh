#!/bin/bash

# A common script to parse arguments passed to shell script and convert it as a map. Every arguments that starts with "--" like
# "--force" or "-f" will be available in the FLAG_ARGUMENTS map. The other positional parameters will be available in the
# POSITIONAL_ARGUMENTS map based on there position.
#
# source get-arguments.sh $@
#
# echo FLAG_ARGUMENTS["name"]                 # Value will be "john"
# echo FLAG_ARGUMENTS["force"]                # Value will be "true"
# echo POSITIONAL_ARGUMENTS[1]                # Value will be "foo"
# echo POSITIONAL_ARGUMENTS[2]                # Value will be "bar"
#
# You will get above output if you run the following script in any of the pattern below:
#
# ./some-script.sh --name=john foo bar --force
# ./some-script.sh --name=john --force foo bar

argumentPosition=1
declare -A FLAG_ARGUMENTS
declare -A POSITIONAL_ARGUMENTS

while [[ "$1" != "" ]]; do
    ARGUMENT_KEY=`echo $1 | awk -F= '{print $1}'`
    ARGUMENT_VALUE=`echo $1 | awk -F= '{print $2}'`

    case ${ARGUMENT_KEY} in
        *)
            # If the input is not the position parameter and starts with "--" or "-"
            if [[ ${ARGUMENT_KEY} == "--"* ]] || [[ ${ARGUMENT_KEY} == "-"* ]]; then
                # Replace "-" or "--" string from the starting
                ARGUMENT_KEY=$(echo ${ARGUMENT_KEY} | sed -r 's/^(-){1,2}//g')

                # If empty (no value) arguments are provided like "--force" or "-f"
                if [[ "$ARGUMENT_VALUE" == "" ]]; then
                    FLAG_ARGUMENTS[$ARGUMENT_KEY]=true
                else
                    FLAG_ARGUMENTS[$ARGUMENT_KEY]=${ARGUMENT_VALUE}
                fi
            else
                POSITIONAL_ARGUMENTS[$argumentPosition]=${ARGUMENT_KEY}
                argumentPosition=$((argumentPosition+1))
            fi
    esac
    shift
done

echo -e $FLAG_ARGUMENTS
echo -e $POSITIONAL_ARGUMENTS

# Reset all changes in terminal.
tput sgr0