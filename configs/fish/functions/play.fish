function play
    # Kill any existing music session or mpv instances to start fresh
    tmux kill-session -t music 2>/dev/null
    pkill mpv 2>/dev/null

    # Define the playlist based on your keyword
    switch $argv[1]
        case piano
            set url "https://music.youtube.com/playlist?list=PLRJET8NxPz_6tn_E3GizZ17zZpD-ewW9v"
        case good
            set url "https://music.youtube.com/playlist?list=PLRJET8NxPz_5eP252yi-obNCEKj7RZbH5"
        case relax
            set url "https://music.youtube.com/playlist?list=PLRJET8NxPz_62OVTS63GPvpTjgdMVO1FI"
        case chill
            set url "https://music.youtube.com/playlist?list=PLRJET8NxPz_7-DlGXc5gd3546usqvOFHb"
        case hurt
            set url "https://music.youtube.com/playlist?list=PLRJET8NxPz_6PJpQT2qIzYh2ruX9P7l1v"
        case '*'
            echo "Usage: play [piano|good|relax|chill|hurt]"
            return 1
    end

    # Launch in a detached tmux session named 'music'
    # --shuffle: Randomizes the playlist
    # --input-ipc-server: Keeps your music-peek function working
    tmux new-session -d -s music "mpv --ao=pulse --no-video --force-window=no --script=/nix/store/fj37hysi4bh2zglfd7khv289mss1y4af-mpv-mpris-1.2/share/mpv/scripts/mpris.so --shuffle --input-ipc-server=/tmp/mpvsocket '$url'"
    echo "󰎈 Guardian Music Engine: Shuffling '$argv[1]' in the background..."

end
