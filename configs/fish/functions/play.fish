function play
    # Reference the file in your tracked nix directory
    set -l index_file ~/nix/configs/guardian/playlists.txt

    if not test -f $index_file
        echo "No playlists imported yet. Use 'music-import'."
        return 1
    end

    set -l entry (grep "^$argv[1]|" $index_file)

    if test -z "$entry"
        echo "Playlist '$argv[1]' not found."
        return 1
    end

    set -l url (string split '|' $entry)[2]

    tmux kill-session -t music 2>/dev/null
    pkill mpv 2>/dev/null

    tmux new-session -d -s music "mpv --no-video --force-window=no --shuffle --input-ipc-server=/tmp/mpvsocket '$url'"

    echo "󰎈 Guardian Music Engine: Shuffling '$argv[1]'..."
end
