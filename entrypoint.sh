#!/bin/bash
set -e

command_string=("pint")

if [[ "${INPUT_TESTMODE}" ]]; then
  command_string+=" --test"
fi

if [[ "${INPUT_VERBOSEMODE}" ]]; then
  command_string+=" -v"
fi

if [[ "${INPUT_CONFIGPATH}" ]]; then
  command_string+=" --config ${INPUT_CONFIGPATH}"
fi

if [[ "${INPUT_PRESET}" ]]; then
  command_string+=" --preset ${INPUT_PRESET}"
fi

echo "Running Command: " "${command_string[@]}"

stdout=$( ${command_string[@]} )
echo $stdout

echo "stdout<<EOF" >> $GITHUB_OUTPUT
echo "$stdout" >> $GITHUB_OUTPUT
echo "EOF" >> $GITHUB_OUTPUT
