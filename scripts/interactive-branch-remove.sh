#!/bin/zsh
branches=( $( git branch --format='%(refname:short)' ) )
current_branch=$(git branch --show-current)
prompt=true
deleted_count=0

for branch in $branches; do
  if [ $branch = $current_branch ] || [ $branch = "master" ]; then
    echo "skipping '$branch'"
    continue
  fi

  if [ $prompt = true ]; then
    read response\?"delete '$branch' (Y/N/y/n)? "

    case $response in
      y|Y) 
        git branch -D $branch

        deleted_count=$((deleted_count+1))

        if [ $response = "Y" ]; then
          prompt=false
        fi
        ;;
      n) 
        continue
        ;;
      N) 
        break
        ;;
      * )
        echo "invalid input, skipping '$branch'"
        continue
        ;;
    esac
  else
    git branch -D $branch
    deleted_count=$((deleted_count+1))
  fi
done

echo "deleted $deleted_count/${#branches[@]} branches"

exit 0
