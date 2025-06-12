#!/bin/bash
for file in ./*; do
  exiftool "-FileModifyDate<CreateDate" "-FileCreateDate<CreateDate" ${file}
done
