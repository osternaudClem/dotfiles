starship init fish | source

alias l="ls -l"
alias dev="cd ~/dev"

if status is-interactive
  # Commands to run in in interactive mode
end

# Start ssh-agent automatically
if not pgrep -u (whoami) ssh-agent > /dev/null
    eval (ssh-agent -c)
end

# Load all keys
for key in ~/.ssh/id_*
    ssh-add $key >/dev/null ^&1
end