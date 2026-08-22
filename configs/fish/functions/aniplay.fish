function aniplay --description "Navigate anime folders via Fuzzel and play with MPV"
    set -l base_dir "$HOME/Videos/Anime"
    set -l state_dir "$HOME/.cache/anime_picker"
    mkdir -p $state_dir

    # 1. Select Anime
    set -l animes (string replace "$base_dir/" "" (path filter -d $base_dir/*))
    if test -z "$animes"
        echo "No anime folders found in $base_dir"
        return 1
    end

    set -l selected_anime (printf "%s\n" $animes | fuzzel -d -p "Anime ❯ ")
    if test -z "$selected_anime"
        return 0
    end

    set -l anime_path "$base_dir/$selected_anime"
    set -l state_file "$state_dir/"(echo -n "$selected_anime" | md5sum | cut -d' ' -f1)

    # 2. Check for Seasons / Direct Video Files
    set -l seasons (string replace "$anime_path/" "" (path filter -d $anime_path/*))

    set -l target_path ""
    if test -n "$seasons"
        # Has subfolders (Seasons)
        set -l selected_season (printf "%s\n" $seasons | fuzzel -d -p "Season ❯ ")
        if test -z "$selected_season"
            return 0
        end
        set target_path "$anime_path/$selected_season"
    else
        # Direct episodes inside anime folder
        set target_path "$anime_path"
    end

    # 3. Build Episode List
    set -l episodes (path filter -f $target_path/*.mkv $target_path/*.mp4 $target_path/*.avi)
    if test -z "$episodes"
        echo "No media files found in $target_path"
        return 1
    end

    # Clean up file paths for display
    set -l display_episodes
    for ep in $episodes
        set -a display_episodes (basename "$ep")
    end

    # 4. Check / Display Last Watched
    set -l prompt "Episode ❯ "
    if test -f "$state_file"
        set -l last_watched (cat "$state_file")
        set prompt "Last: $last_watched | Episode ❯ "
    end

    # 5. Select Episode
    set -l selected_display (printf "%s\n" $display_episodes | fuzzel -d -p "$prompt")
    if test -z "$selected_display"
        return 0
    end

    set -l selected_ep "$target_path/$selected_display"

    # Save choice to last-watched state cache
    echo "$selected_display" > "$state_file"

    # 6. Find exact array index for playlist start
    set -l start_index 0
    for i in (seq (count $episodes))
        if test "$episodes[$i]" = "$selected_ep"
            # MPV playlist-start is 0-indexed, so index 1 in fish = 0 for mpv
            set start_index (math $i - 1)
            break
        end
    end

    # 7. Play in MPV with Playlist and Save State enabled
    mpv --save-position-on-quit \
        --playlist-start=$start_index \
        $episodes
end
