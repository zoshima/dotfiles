#!/bin/bash
bus=1
addresses=(0x61 0x63)

for address in "${addresses[@]}"; do
  # begin
  i2cset -y $bus $address 0x08 0x53
  sleep 0.1

  # mode static
  i2cset -y $bus $address 0x09 0x00
  sleep 0.1

  # dim
  i2cset -y $bus $address 0x20 0x00 
  sleep 0.1

  # end
  i2cset -y $bus $address 0x08 0x44
done
