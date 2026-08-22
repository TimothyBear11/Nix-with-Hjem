#!/usr/bin/env bash

# 1. Top-Level Category Selection
CATEGORY=$(printf "📺 Video\n🎵 Music\n⚙️ Maintenance" | fuzzel -d -p "Media Hub ❯ ")

case "$CATEGORY" in
  "📺 Video")
    ACTION=$(printf "▶️ Watch Local Anime (aniplay)\n📥 Download Anime (anidl)" | fuzzel -d -p "Video Action ❯ ")

    if [[ "$ACTION" == *"Watch Local"* ]]; then
      # Run your custom aniplay Fish function directly
      fish -c "aniplay"

    elif [[ "$ACTION" == *"Download"* ]]; then
      # Prompt for show name and optional range
      SHOW=$(fuzzel -d -p "Show Title ❯ ")
      [[ -z "$SHOW" ]] && exit 0

      RANGE=$(fuzzel -d -p "Episode Range (e.g. 1-12 or blank) ❯ ")

      if [[ -n "$RANGE" ]]; then
        kitty --class floating_media -e fish -c "anidl $SHOW -e $RANGE"
      else
        kitty --class floating_media -e fish -c "anidl $SHOW"
      fi
    fi
    ;;

  "🎵 Music")
    ACTION=$(printf "🎧 Play Local Music (Amberol)\n📥 Download Anime Music (animusic)" | fuzzel -d -p "Music Action ❯ ")

    if [[ "$ACTION" == *"Play Local"* ]]; then
      # Launch Amberol music player
      amberol &

    elif [[ "$ACTION" == *"Download"* ]]; then
      # Prompt for song search query
      QUERY=$(fuzzel -d -p "Search Song/Artist ❯ ")
      [[ -z "$QUERY" ]] && exit 0

      # Run animusic inside Kitty so you can watch yt-dlp download progress
      kitty --class floating_media -e fish -c "animusic $QUERY"
    fi
    ;;

  "⚙️ Maintenance")
    MAINT=$(printf "🔄 Update ani-cli Scrapers\n📺 Trigger Jellyfin Scan" | fuzzel -d -p "Maintenance ❯ ")

    if [[ "$MAINT" == *"Update ani-cli"* ]]; then
      kitty --class floating_media -e ani-cli -U
    elif [[ "$MAINT" == *"Jellyfin"* ]]; then
      curl -s -X POST "http://localhost:8096/Library/Refresh?api_key=611e902f4cd34baa8543e123c5bdfa8e"
      notify-send "Jellyfin" "Library scan triggered successfully!"
    fi
    ;;
esac
