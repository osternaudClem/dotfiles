starship init fish | source

alias l="ls -l"
alias dev="cd ~/dev"

status --is-interactive; and pyenv init - | source
status --is-interactive; and pyenv virtualenv-init - | source

cd ~/dev

if status is-interactive
  # Commands to run in in interactive mode
end

# # Start ssh-agent automatically
if not pgrep -u (whoami) ssh-agent > /dev/null
    eval (ssh-agent -c)
end

# # Load all keys
ssh-add -l >/dev/null 2>&1
or begin
    ssh-add ~/.ssh/id_ed25519_github_perso
end
