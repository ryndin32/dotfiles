set fish_greeting

function fish_prompt
    set -l normal (set_color normal)
    set -l bryellow (set_color bryellow)
    set -l pwd (string replace -r "^$HOME" "~" $PWD)
    set -l git (fish_git_prompt)
    set -q VIRTUAL_ENV; and set -l env " "(basename $VIRTUAL_ENV)
    set -l suffix "% "; fish_is_root_user; and set -l suffix "# "
    echo -nes "\n" $bryellow $pwd $normal $git $env "\n" $suffix
end

bind \cj down-or-search
bind \ck up-or-search
bind \ch kill-line

alias dl "yt-dlp -f 'ba' -x --audio-format mp3 -o '%(id)s.%(ext)s'"

alias e 'emacsclient --no-wait --create-frame'
alias d docker
alias g git
alias k kubectl
alias m ./manage.py
alias p poetry
alias pp 'CURL_CA_BUNDLE="" REQUESTS_CA_BUNDLE="" PYTHONWARNINGS="ignore:Unverified HTTPS request" poetry'
alias dc docker-compose
alias kc kubectx
alias kn kubens
#alias la 'ls -lah --group-directories-first'
alias syu 'sudo pacman -Syu'

set PATH $PATH $HOME/.npm-global/bin
set PATH $PATH $HOME/go/bin
# set PATH $PATH $HOME/.poetry/bin
set PATH $PATH $HOME/.local/bin
# set PATH $PATH $HOME/.local/share/coursier/bin/

if command -q http; and test (uname) = Darwin
#     # set -x REQUESTS_CA_BUNDLE /usr/local/etc/openssl@1.1/cert.pem
    set -x REQUESTS_CA_BUNDLE /usr/local/etc/ca-certificates/cert.pem
end

if command -q gls
    set PATH /usr/local/opt/coreutils/libexec/gnubin/ $PATH
end

if command -q ggrep
    set PATH /usr/local/opt/grep/libexec/gnubin $PATH
end

if command -q pyenv
    status is-login; and pyenv init --path | source
    pyenv init - | source
end

if command -q direnv
    direnv hook fish | source
    set -g direnv_fish_mode eval_on_arrow
end
