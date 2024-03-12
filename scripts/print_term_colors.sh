#/bin/bash
declare -A color_names
color_names[0]="Black"
color_names[1]="DarkBlue"
color_names[2]="DarkGreen"
color_names[3]="DarkCyan"
color_names[4]="DarkRed"
color_names[5]="DarkMagenta"
color_names[6]="Brown,DarkYellow"
color_names[7]="LightGray,LightGrey,Gray,Grey"
color_names[8]="DarkGray,DarkGrey"
color_names[9]="Blue,LightBlue"
color_names[10]="Green,LightGreen"
color_names[11]="Cyan,LightCyan"
color_names[12]="Red,LightRed"
color_names[13]="Magenta,LightMagenta"
color_names[14]="Yellow,LightYellow"
color_names[15]="White"

for (( i=0; i < 16; i++ )) do 
  echo "[$i]: $(tput setaf $i)${color_names[$i]}$(tput sgr0)"
done

if [ -n "$1" ]; then
  num_colors=$@
  if [[ $num_colors -lt 16 || $num_colors -gt 256 ]]; then
    exit 1
  fi

  for (( i=16; i < $num_colors; i++ )) do 
    echo "[$i]: $(tput setaf $i)abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ$(tput sgr0)"
  done
fi


