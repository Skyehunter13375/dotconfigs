# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH


comment() {
    local text="$*"
    local width=80
    local inner_width=$((width - 2))  # -2 for spacing
    local text_len=$((${#text} + 4))

    # truncate if too long
    if (( text_len > inner_width )); then
        text="${text:0:inner_width}"
        text_len=$inner_width
    fi

    # calculate padding
    local pad_total=$((inner_width - text_len))
    local pad_left=$((pad_total / 2))
    local pad_right=$((pad_total - pad_left))

    # construct the lines
    local middle="┣$(printf '━%.0s' $(seq 1 ${pad_left}))┫ ${text} ┣$(printf '━%.0s' $(seq 1 ${pad_right}))┫"

    # output the box
    echo "$middle"
}

comment_block() {
    local text="$*"
    local width=132
    local inner_width=$((width - 4))  # account for borders and spacing
    local text_len=${#text}

    # truncate if too long
    if (( text_len > inner_width )); then
        text="${text:0:inner_width}"
        text_len=$inner_width
    fi

    # calculate padding
    local pad_total=$((inner_width - text_len))
    local pad_left=$((pad_total / 2))
    local pad_right=$((pad_total - pad_left))

    # construct the lines
    local top="┌$(printf '─%.0s' $(seq 1 $((width - 2))))┐"
    local middle="│ $(printf '%*s' $pad_left '')${text}$(printf '%*s' $pad_right '') │"
    local bottom="└$(printf '─%.0s' $(seq 1 $((width - 2))))┘"

    # output the box
    echo "$top"
    echo "$middle"
    echo "$bottom"
}

alias p='psql -d spacetraders'
alias vi='nvim'
alias vim='nvim'
alias dragoon='ssh skyehunter@10.10.1.25'
alias paladin='ssh skyehunter@10.10.1.26'
alias summoner='ssh skyehunter@10.10.1.27'
alias tree='tree -aI .git --dirsfirst'

eval "$(starship init bash)"
