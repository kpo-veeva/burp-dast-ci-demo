#!/bin/sh

if [ -z "$1" ]; then
    echo "Usage: $0 <directory-for-cleaning>"
    exit 1
fi

INPUT="$1/burp_junit_report.xml"

if [ ! -f "$INPUT" ]; then
    echo "❌ File structure integrity mismatch. $INPUT does not exist."
    echo "Contents of directory $1:"
    ls -la "$1"

    exit 1
fi

TEMP1=$(mktemp)
TEMP2=$(mktemp)

echo "⌛ Cleaning up"
tr -d '\000-\010\013\014\016-\037\177' < "$INPUT" > "$TEMP1"
sed -E 's/&#([0-9]|[1-2][0-9]|3[0-1]);?//g' "$TEMP1" > "$TEMP2"

if grep -q "<testsuite" "$TEMP2"; then
    echo "✅ Cleanup successful"
    mv "$TEMP2" "$INPUT"
else
    echo "❌ Cleanup failed - cleanup produced invalid structure"
    exit 1
fi