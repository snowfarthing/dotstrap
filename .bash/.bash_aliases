### List and Tree aliases
alias ls="exa --color=always"
alias ll="exa -l --color=always --color-scale"
alias la="exa -la --color=always --color-scale"
alias tree="tree -Ca"
alias etree="exa -lTa --color=always --color-scale"
alias ftree="tree -fCha --du"

### Colorized Search and Less
alias grep="grep --color=always"
alias ag="ag --color"
#alias less="less -RSXM +Gg"  # +Gg ensures that progress % is calculated, but pushes output to top
alias less="less -RSXM"
alias bat="bat --color always"
alias watch="watch -c"

### Givelify Convenience Aliases
alias dockps="grc --colour=on docker ps | less -RSX"
alias dockup="docker-compose up -d && dockps"
alias dockdown="docker-compose down && dockps"
alias makeup="make up && dockps"
alias makedown="make stop && dockps"



### Job Aliases
#alias js="jobs; echo; dirs -v;"
alias js="jobs"
alias jf="fg"
alias jb="bg"

# "soft terminate" a Job ID
function jk() {
    if [[ $# > 0 ]]; then
        for jid in "$@"
        do
            kill -s SIGTERM %$jid;
        done
    else
        # If Job IDs aren't specified, show jobs
        jobs
    fi
}

# I originally tried defining these as "jN", but found
# that I have too much of a Vim mindset for that to
# work well.  I'm too used to typing, say, ":4b", to
# get to the 4th buffer.
alias  j="fg"
alias 1j="fg 1"
alias 2j="fg 2"
alias 3j="fg 3"
alias 4j="fg 4"
alias 5j="fg 5"
alias 6j="fg 6"
alias 7j="fg 7"
alias 8j="fg 8"
alias 9j="fg 9"
alias 10j="fg 10"
alias 11j="fg 11"
alias 12j="fg 12"
alias 13j="fg 13"
alias 14j="fg 14"
alias 15j="fg 15"
alias 16j="fg 16"
alias 17j="fg 17"
alias 18j="fg 18"
alias 19j="fg 19"
alias 20j="fg 20"

alias 1jk="jk 1"
alias 2jk="jk 2"
alias 3jk="jk 3"
alias 4jk="jk 4"
alias 5jk="jk 5"
alias 6jk="jk 6"
alias 7jk="jk 7"
alias 8jk="jk 8"
alias 9jk="jk 9"
alias 10jk="jk 10"
alias 11jk="jk 11"
alias 12jk="jk 12"
alias 13jk="jk 13"
alias 14jk="jk 14"
alias 15jk="jk 15"
alias 16jk="jk 16"
alias 17jk="jk 17"
alias 18jk="jk 18"
alias 19jk="jk 19"
alias 20jk="jk 20"


# An experiment:  make this even more Vim-like, and
# add a colon in front.  It *may* even be worthwhile
# to change "j" to "b".
alias :js="jobs"
alias  :j="fg"
alias :1j="fg 1"
alias :2j="fg 2"
alias :3j="fg 3"
alias :4j="fg 4"
alias :5j="fg 5"
alias :6j="fg 6"
alias :7j="fg 7"
alias :8j="fg 8"
alias :9j="fg 9"
alias :10j="fg 10"
alias :11j="fg 11"
alias :12j="fg 12"
alias :13j="fg 13"
alias :14j="fg 14"
alias :15j="fg 15"
alias :16j="fg 16"
alias :17j="fg 17"
alias :18j="fg 18"
alias :19j="fg 19"
alias :20j="fg 20"

alias :js="jobs"
alias :jf="fg"
alias :jb="bg"
alias :jk="jk"



#### Directory Forth
# "dp()" should probably be renamed to "d()"
function dp() {
    pushd $@ > /dev/null && dirs -v;
}


#alias ds="jobs; echo; dirs -v;"
alias ds="dirs -v"

function dk() {
    if [[ $# > 0 ]]; then
        popd +$1 > /dev/null && dirs -v;
    else
        popd > /dev/null && dirs -v;
    fi
}
function dp() {
    pushd $@ > /dev/null && dirs -v;
}

# I'm not entirely sure if I want to do these
# aliases; I think it makes sense to get used to
# thinking of "Dorectory Forth" as "d[COMMAND]".
##alias pd="dp"
##alias kd="dk"
##
### Like "Nj", found that typing "Nd" to be
### more natural.
##alias  d="pd"
##alias 1d="pd +1"
##alias 2d="pd +2"
##alias 3d="pd +3"
##alias 4d="pd +4"
##alias 5d="pd +5"
##alias 6d="pd +6"
##alias 7d="pd +7"
##alias 8d="pd +8"
##alias 9d="pd +9"
##alias 10d="pd +10"
##alias 11d="pd +11"
##alias 12d="pd +12"
##alias 13d="pd +13"
##alias 14d="pd +14"
##alias 15d="pd +15"
##alias 16d="pd +16"
##alias 17d="pd +17"
##alias 18d="pd +18"
##alias 19d="pd +19"
##alias 20d="pd +20"

alias  d="dp"
alias 1d="dp +1"
alias 2d="dp +2"
alias 3d="dp +3"
alias 4d="dp +4"
alias 5d="dp +5"
alias 6d="dp +6"
alias 7d="dp +7"
alias 8d="dp +8"
alias 9d="dp +9"
alias 10d="dp +10"
alias 11d="dp +11"
alias 12d="dp +12"
alias 13d="dp +13"
alias 14d="dp +14"
alias 15d="dp +15"
alias 16d="dp +16"
alias 17d="dp +17"
alias 18d="dp +18"
alias 19d="dp +19"
alias 20d="dp +20"

alias dj="jobs; echo; dirs -v;"

#function ls-jobs-dirs() {
function lj {
    # Note that pipes can't be used:  they create a new
    # shell environment, and thus don't have access to the
    # jobs I wish to show!
    less < <(exa -la --color=always --color-scale $@ \
    && echo && jobs && echo && dirs -v)
}

#function lj() {
#    ls-jobs-dirs $@ | less -RSXM
#}
#function lj {
#    LSOUT=`exa -la --color=always --color-scale $@`;
#    JOBSOUT=`jobs`;
#    DIRSOUT=`dirs -v`;
#
#    echo "$LSOUT";
#    echo;
#    echo "$JOBSOUT";
#    echo;
#    echo "$DIRSOUT";
#}

### Directory Fun
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias mkdir="mkdir -pv"

### Experimental Nix Aliases
#alias nix-ls="ls -1 /nix/store | sort -R -t - -k 2 | less -RSXM"
function cnix() {
    cd $1 && nix-env;
}


#### WARNING:  IT MAY MAKE SENSE TO PUT THESE IN A SEPARATE FILE....
# Simple Git Aliases
function git_branch_name() {
	BRANCH=`git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'`
	echo "${BRANCH}"
}

# Help
read -r -d '' GIT_ALIAS_HELP <<"EOF"
Simple Git Aliases

    gh     Print this help

    ### Branching
    gnew   git init
    gg     git clone
    gb     git branch
    gn     git checkout -b (ie, create a new branch and check it out)
    go     git checkout
    gm     git merge

    gp     git push
    (gpo    git push --set-upstream origin [CURRENT BRANCH])
    (gpo    git push origin HEAD)
    gy     git pull (ie, \"git yank from origin\")
    gpk    git cherry-pick

    gw     git stash (ie, save WIP)
    gwp    git stash pop
    gwl    git stash list
    gwa    git stash apply
    gwk    git stash drop (ie, git stash \"kill\")

    grv    git revert
    gz     git bisect
    gap    git apply
    gtg    git tag
    gcl    git clean

    ### Display Aliases
    gv     git show
    gl     git log
    gt     git ln  --or--  git tree

    ### Hide and view files
    gi     vim .gitignore
    gif    git ignore        (ie, git update-index --assume-unchanged)
    gil    git list-ignored  (ie, git ls-files -v | grep ^[a-z])
    gnf    git notice        (ie, git update-index --no-assume-unchanged)
    gna    git notice-all    (ie, git list-ignored | awk '{print $2}' | xargs git notice)

    ### Committing
    gs     git status
    gso    git status -uno

    ga     git add -p
    gf     git add (ie, git add [FILE])
    gr     git reset -p
    gra    git reset (ie, git \"reset all\")
    gk     git rm
    gmv    git mv

    gd     git diff
    gx     git diff --cached
    gc     git commit
EOF

alias gh="less \"${GIT_ALIAS_HELP}\""

# Branch management
alias gnew="git init"
alias gg="git clone"
alias gb="git branch"
alias gn="git checkout -b"
alias go="git checkout"
alias gp="git push"
#alias gpo="git push --set-upstream origin \`git_branch_name\`"
#alias gpo="git push origin HEAD"
alias gy="git pull"
alias gm="git merge"
alias gpk="git cherry-pick"
alias gmv="git mv"
alias grv="git revert"
alias gz="git bisect"
alias gap="git apply"
alias gtg="git tag"
alias gcl="git clean"

# Committing
alias ga="git add -p"
alias gf="git add"
alias gs="git status"
alias gso="git status -uno"
alias gd="git diff"
alias gx="git diff --cached"
alias gr="git reset -p"
alias gra="git reset"
alias gk="git rm"
alias gw="git stash"
alias gwp="git stash pop"
alias gwl="git stash list"
alias gwa="git stash apply"
alias gwk="git stash drop"
alias gc="git commit"

# Display Aliases
alias gv="git show"
alias gl="git log"
alias gt="git log --graph --full-history --all --color --pretty=format:\"%x1b[31m%h%x09%x1b[32m%d%x1b[0m%x20%s\""

# Hide and view files
alias gi="vim .gitignore"
alias gif="git update-index --assume-unchanged"                    # "git ignore"
alias gil="git ls-files -v | grep ^[a-z]"                          # "git list-ignored"
alias gnf="git update-index --no-assume-unchanged"                 # "git notice"
alias gna="git list-ignored | awk '{print $2}' | xargs git notice" # "git notice-all""


