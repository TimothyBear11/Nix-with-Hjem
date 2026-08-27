function gitnrs --description 'Update flake, stage, commit, push, and rebuild NixOS'
    set -l target_dir /home/tbear/nix

    if not test -d "$target_dir"
        echo "❌ Error: Nix directory $target_dir does not exist."
        return 1
    end

    # Jump to the nix directory safely and save where we were
    pushd "$target_dir" > /dev/null

    set -l msg (if test (count $argv) -gt 0; echo $argv[1]; else; echo "simple update"; end)

    echo "❄️ Updating flake lockfile..."
    nix flake update

    echo "⚡ Staging files..."
    git add .

    echo "📝 Committing changes..."
    git commit -m "$msg"

    echo "🚀 Pushing to remote repository..."
    git push

    if type -q nrs
        echo "❄️ Triggering NixOS Rebuild..."
        nrs
        hjem-impure
    else
        echo "⚠️ Warning: 'nrs' function not found in environment. Skipping rebuild."
    end

    # Pop back to whatever directory you were originally working in
    popd > /dev/null
end
