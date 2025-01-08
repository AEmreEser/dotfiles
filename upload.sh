#!/bin/bash

# Set the maximum file size (100 MB)
max_size=104857600

# Iterate through all files at depth 1
for dir in */; do
    if [ -d "$dir" ]; then
        for file in "$dir"*; do
            if [ -f "$file" ]; then
                file_size=$(wc -c <"$file")
                if [ "$file_size" -le "$max_size" ]; then
                    git add "$file"
		    echo -n "$file"
                fi
            fi
        done
    fi
done

# Commit the changes
git commit -m "Add files smaller than 100 MB"

# Push the changes to the remote repository
git push --force -u origin main
