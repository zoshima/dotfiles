#!/bin/bash
for file in ./*; do
  exiftool -overwrite_original \
    "-FileCreateDate<CreateDate" \
    "-FileModifyDate<CreateDate" \
    "-FileAccessDate<CreateDate" \
    ${file}
done
