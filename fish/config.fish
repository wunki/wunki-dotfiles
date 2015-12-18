## fish settings
set -x fish_greeting ""

# aliases
function t1; tree --dirsfirst -ChFL 1; end
function t2; tree --dirsfirst -ChFL 2; end
function t3; tree --dirsfirst -ChFL 3; end

# mac shortcuts
function bup; brew update; and brew upgrade --all; and brew cleanup; end
function run-rethinkdb; launchctl load ~/Library/LaunchAgents/homebrew.mxcl.rethinkdb.plist; end
function run-redis; redis-server /usr/local/etc/redis.conf; end

# freebsd shortcuts
function ea; sudo ezjail-admin $argv; end
function ioc; sudo iocage $argv; end
function btop; nice top -j -P -a; end 

# neovim settings
set -x NVIM_TUI_ENABLE_TRUE_COLOR 1 # enable true colors in Neovim. Requires compatible shell.
function n; nvim $argv; end

set nvim (type -fp nvim)
if  test -f $nvim
  function vim; nvim $argv; end
end

# required for neovim on BSD
if contains (hostname -s) "home"
  set -gx VIMRUNTIME "/usr/local/share/vim/vim74"
end

# easy editing
function e
  if test -n "$INSIDE_EMACS";
    emacsclient -a "" -nq $argv;
  else
    emacsclient -a "" -t $argv;
  end
end

# mu
function mu-reindex; mu index --rebuild --maildir=~/mail --my-address=petar@wunki.org --my-address=petar@gibbon.co --my-address=petar@breadandpepper.com --my-address=hello@gibbon.co --my-address=hello@breadandpepper.com; end
function mu-index; mu index --maildir=~/mail --my-address=petar@wunki.org --my-address=petar@gibbon.co --my-address=petar@breadandpepper.com --my-address=hello@gibbon.co --my-address=hello@breadandpepper.com; end

# git
function gs; git status --ignore-submodules=dirty; end
function gp; git push origin master; end
function gf; git pull origin master; end

# python
function rmpyc; find . -name '*.pyc' | xargs rm; end
function ghp; python -m grip; end # preview README files

# environment
set -x LANG 'en_US.UTF-8'
set -x LC_ALL 'en_US.UTF-8'
set -x EDITOR 'vim'
set -x VISUAL 'vim'
set -x TERM 'rxvt-256color'
set -x XDG_DATA_HOME {$HOME}/.local/share

# secret environment vars
set fish_secret "~/.config/fish/secret_env.fish"
if test -f $fish_secret
  . $fish_secret
end

function prepend_to_path -d "Prepend the given dir to PATH if it exists and is not already in it"
  if test -d $argv[1]
    if not contains $argv[1] $PATH
      set -gx PATH "$argv[1]" $PATH
    end
  end
end

# Start with a clean path, because order matters
set -e PATH

# paths
prepend_to_path "/bin"
prepend_to_path "/sbin"
prepend_to_path "/usr/bin"
prepend_to_path "/usr/sbin"
prepend_to_path "/usr/local/sbin"
prepend_to_path "/usr/local/bin"
prepend_to_path "/usr/local/opt/go/libexec/bin"

# home paths
prepend_to_path "$HOME/bin"
prepend_to_path "$HOME/.local/bin"

# mac specific paths
prepend_to_path "/usr/local/Cellar/emacs/HEAD/bin"
prepend_to_path "$HOME/Source/google-cloud-sdk/bin"
prepend_to_path "/Applications/Postgres.app/Contents/Versions/9.4/bin"
prepend_to_path "/Applications/Racket v6.1.1/bin"

# autojump
if test -f "$HOME/.autojump/share/autojump/autojump.fish"
  prepend_to_path "$HOME/.autojump/bin"
  . "$HOME/.autojump/share/autojump/autojump.fish"
end

# haskell
prepend_to_path "$HOME/.stack/programs/x86_64-osx/ghc-7.8.4/bin"
prepend_to_path "$HOME/.cabal/bin"

# rust
prepend_to_path "$HOME/.cargo/bin"
set -x LD_LIBRARY_PATH {LD_LIBRARY_PATH}:/usr/local/lib
set -x RUST_SRC_PATH {$HOME}/rust/rust/src

# go
prepend_to_path "/usr/local/go/bin"
function gb; go build; end
function gt; go test -v ./...; end
function gc; gocov test | gocov report; end

if test -d "$HOME/Go"
    set -x GOPATH "$HOME/Go"
else
    set -x GOPATH "$HOME/go"
end
prepend_to_path "$GOPATH/bin"

# Test coverage for Go
# Use in the current project: `cover` or `cover github.com/pkg/sftp`
function cover ()
  set -l t (mktemp /tmp/gocover.XXXXX)
  go test $COVERFLAGS -coverprofile=$t $argv;and go tool cover -func=$t;and unlink $t
end

function cover-web ()
  set -l t (mktemp /tmp/gocover.XXXXX)
  go test $COVERFLAGS -coverprofile=$t $argv;and go tool cover -html=$t;and unlink $t
end

set hub (type -fp hub)
if test -f $hub
  function git; hub $argv; end
end

# clojure
set -x BOOT_COLOR 1
set -x BOOT_JVM_OPTIONS "-Xmx2g -client -XX:+TieredCompilation -XX:TieredStopAtLevel=1 -XX:+UseConcMarkSweepGC -XX:+CMSClassUnloadingEnabled -Xverify:none"

# nodejs
set -x NPM_PACKAGES "$HOME/.npm-packages"
set -x NODE_PATH "$NPM_PACKAGES/lib/node_modules:$NODE_PATH"
prepend_to_path "$NPM_PACKAGES/bin"

# docker for the mac
if contains (hostname -s) "macbook"
  set -x DOCKER_HOST "tcp://192.168.99.100:2376"
  set -x DOCKER_MACHINE_NAME "default"
  set -x DOCKER_TLS_VERIFY 1
  set -x DOCKER_CERT_PATH "/Users/wunki/.docker/machine/machines/default"
end

# racket (mac)
prepend_to_path "/Applications/Racket v6.1.1/bin"

# rubygems
prepend_to_path "$HOME/.gem/ruby/2.0.0/bin"
prepend_to_path "$HOME/.gem/ruby/2.1/bin"
prepend_to_path "$HOME/.gem/ruby/2.2.0/bin"

# android
prepend_to_path "/opt/android-sdk/tools"
prepend_to_path "/opt/android-sdk/platform-tools"

# perl
prepend_to_path "/usr/bin/core_perl"

# python
prepend_to_path "$HOME/.pyenv/bin"
if test -d ~/.pyenv
  status --is-interactive; and . (pyenv init -|psub)
  status --is-interactive; and . (pyenv virtualenv-init -|psub)
end

if contains (hostname -s) "macbook"
  prepend_to_path "$HOME/Library/Python/2.7/bin"
  set -gx PYTHONPATH "$HOME/Library/Python/2.7/lib/python/site-packages:/Library/Python/2.7/site-packages"
end

if contains (hostname -s) "home"
  set -gx PYTHONPATH "$HOME/.local/lib/python2.7/site-packages:/usr/local/lib/python2.7/site-packages"
end

# aws
prepend_to_path "$HOME/.aws/bin"
set -x AWS_IAM_HOME "$HOME/.aws/iam"
set -x AWS_CREDENTIALS_FILE "$HOME/.aws/credentials"

# elm
set -x ELM_HOME "/usr/local/lib/node_modules/elm/share"
prepend_to_path "~/haskell/Elm-Platform/0.15.1/.cabal-sandbox/bin"

# fix fish in Emacs ansi-term
function fish_title
  true
end

# set variables on directories with ondir
if test -f /usr/local/bin/ondir
  function ondir_prompt_hook --on-event fish_prompt
  if test ! -e "$OLDONDIRWD"; set -g OLDONDIRWD /; end;
  if [ "$OLDONDIRWD" != "$PWD" ]; eval (ondir $OLDONDIRWD $PWD); end;
    set -g OLDONDIRWD "$PWD";
  end
end

# notify me when a command is not found
function __fish_default_command_not_found_handler --on-event fish_command_not_found
  functions --erase __fish_command_not_found_setup
  echo "'$argv' not found"
end
