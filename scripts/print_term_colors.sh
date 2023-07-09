#/bin/bash
colors=$@
for (( n=0; n < $colors; n++ )) do
    printf "[%d] $(tput setaf $n)%s\n$(tput sgr0)" $n "abcdefgABCDEFG"
done
