function animusic --description "Search YouTube for anime music, extract MP3, and save to Anime music folder"
    # 1. Grab the search query
    set -l search_query (string join " " $argv)

    if test -z "$search_query"
        echo "Error: Please provide a song name or search query! (e.g., animusic LiSA Gurenge)"
        return 1
    end

    # 2. Define target directory
    set -l target_dir "$HOME/Music/Anime"

    # 3. Create folder if it doesn't exist
    if not test -d "$target_dir"
        echo "📁 Creating folder: $target_dir"
        mkdir -p "$target_dir"
    end

    echo "🎵 Searching and downloading: '$search_query'..."

    # 4. Search YT and download/convert to MP3
    # ytsearch1: takes the first search result
    # -x: extract audio
    # --audio-format mp3: converts output to mp3
    # --audio-quality 0: highest audio quality
    yt-dlp "ytsearch1:$search_query" \
        -x \
        --audio-format mp3 \
        --audio-quality 0 \
        --embed-thumbnail \
        --add-metadata \
        -o "$target_dir/%(title)s.%(ext)s"

    if test $status -eq 0
        echo "✅ Download complete! Saved to $target_dir"
    else
        echo "❌ Download failed."
    end
end
