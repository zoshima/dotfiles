#!/bin/bash

# ioreg -lw0 | grep -i 'DisplayAttributes'`
#   "LegacyManufacturerID": 4268,
#   "ProductID": 53595,
# printf '%x\n' 4268 -> 10ac
# printf '%x\n' 53595 -> d15b

dir='/Library/Displays/Contents/Resources/Overrides/DisplayVendorID-10ac'
sudo mkdir -p ${dir}
sudo cp ./DisplayProductID-d15b ${dir}/
