function anidl
    # 0. Automatically check for ani-cli scraper updates upstream before running
    echo "🔄 Checking for ani-cli scraper updates..."
    ani-cli -U > /dev/null 2>&1

    # 1. Parse arguments: keep options/flags with their values, join the rest for the title
    set -l opts
    set -l show_parts
    set -l skip_next 0
    set -l explicit_range 0

    for i in (seq (count $argv))
        if test $skip_next -eq 1
            set skip_next 0
            continue
        end

        set -l arg $argv[$i]

        if string match -q -- '-*' $arg
            set -a opts $arg
            if contains -- $arg -e -r --episodes --range
                set -l next_idx (math $i + 1)
                if test $next_idx -le (count $argv)
                    set -a opts $argv[$next_idx]
                    set skip_next 1
                    set explicit_range 1
                end
            end
        else
            set -a show_parts $arg
        end
    end

    # 2. Join remaining positional arguments into the full show name
    set -l show_name (string join " " $show_parts)

    if test -z "$show_name"
        echo "Error: Please provide a show name! (e.g., anidl Solo Leveling)"
        return 1
    end

    # 3. Define the target directory path
    set -l target_dir "$HOME/Games/Videos/Anime/$show_name"

    # 4. Create the folder if it doesn't exist yet
    if not test -d "$target_dir"
        echo "📁 Creating folder: $target_dir"
        mkdir -p "$target_dir"
    end

    # 5. Point the download directory exactly to the new show folder
    set -gx ANI_CLI_DOWNLOAD_DIR "$target_dir"

    # 6. Default to 1-1000 for standard full runs unless -e was explicitly provided
    if test $explicit_range -eq 0
        set -a opts -e 1-1000
    end

    # 7. Run ani-cli with dynamic options and the isolated show name
    ani-cli -d --dub $opts "$show_name"

    # 8. Safety Check & Auto-Scan
    if test (count (ls -A "$target_dir")) -eq 0
        echo "⚠️ No files downloaded. Cleaning up empty folder..."
        rmdir "$target_dir"
    else
        echo "✅ Done! Triggering Jellyfin library scan..."
        set -l api_key "611e902f4cd34baa8543e123c5bdfa8e"
        curl -s -X POST "http://localhost:8096/Library/Refresh?api_key=$api_key" > /dev/null
    end
end
