#!/bin/bash

OUTPUT_FILE="project_dump.txt"

> "$OUTPUT_FILE"

TARGETS=("." "src" "cmake" "docs" "scripts")
IGNORED_EXTS=("o" "a" "so" "bin" "iso" "pyc" "png" "jpg" "zip" "gz")
IGNORED_DIRS=("build" ".git" ".vscode" "venv" "all_project_files")

is_ignored_dir() {
    local filepath="$1"
    for ign in "${IGNORED_DIRS[@]}"; do
        if [[ "$filepath" == *"/$ign/"* ]] || [[ "$filepath" == "$ign/"* ]]; then
            return 0
        fi
    done
    return 1
}

is_ignored_ext() {
    local ext="$1"
    for ign in "${IGNORED_EXTS[@]}"; do
        if [[ "$ext" == "$ign" ]]; then
            return 0
        fi
    done
    return 1
}

for target in "${TARGETS[@]}"; do
    if [ ! -d "$target" ] && [ "$target" != "." ]; then
        continue
    fi

    if [ "$target" = "." ]; then
        files=$(find . -maxdepth 1 -type f)
    else
        files=$(find "$target" -type f)
    fi

    for filepath in $files; do
        if [ "$filepath" = "./$OUTPUT_FILE" ] || [ "$filepath" = "$OUTPUT_FILE" ]; then
            continue
        fi

        if is_ignored_dir "$filepath"; then
            continue
        fi

        ext="${filepath##*.}"
        if is_ignored_ext "$ext"; then
            continue
        fi

        echo -e "\n\n==================== FILE: $filepath ====================\n\n" >> "$OUTPUT_FILE"
        
        cat "$filepath" >> "$OUTPUT_FILE" 2>/dev/null
    done
done