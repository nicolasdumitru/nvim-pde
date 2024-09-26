# List recipes
default:
    @just --list

source := justfile_directory()
target := env_var_or_default('XDG_CONFIG_HOME', env_var('HOME') + '/.config') + '/nvim'
lockfile := "lazy-lock.json"
rsync_opts := "-Prlucv --delete-delay"

# Install Neovim configuration files
install:
    rsync {{rsync_opts}} {{source}}/ {{target}}/

alias update := update-commit

# Update plugins
update-no-commit:
    nvim --headless "+Lazy! sync" +qa
    rsync {{rsync_opts}} {{target}}/{{lockfile}} {{source}}/{{lockfile}}

# Update plugins and commit lockfile
update-commit: update-no-commit
    -git -C {{source}} commit -m "{{lockfile}}: Update" -o {{lockfile}}

# Show differences between source and destination
diff:
    -diff -rq --exclude='.git' {{source}} {{target}}

# Uninstall Neovim configuration
uninstall:
    rm -rf {{target}}
