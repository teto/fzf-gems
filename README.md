# fzf-gems
a few fzf bindings for shell convenience

Mostly excerpts from https://junegunn.kr/2016/07/fzf-git/ and its subsequent gist https://gist.github.com/junegunn/8b572b8d4b5eddd8b85e5f4d40f17236

To use: 
source these files in your zshrc
```
. "$XDG_CONFIG_HOME/fzf-gems/fzf_git_functions.sh"
. "$XDG_CONFIG_HOME/fzf-gems/fzf_git_keybindings.zsh"
```
then you can either run the functions:
`$ fzf-g{b,r,f}-widget`
or use the mappings
CTRL-g CTRL-{f b t r h}


## Integration into ZSH through plugin

1. clone

```zsh
git clone https://github.com/teto/fzf-gems.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/fzf-gems
```

2. edit `~/.zshrc`

```zsh
plugins=(
 ...
 fzf-gems
)
```

## other

binding needed in VS Code integrated terminal when "terminal.integrated.macOptionIsMeta" is false

```zsh
bindkey '' accept-and-hold # option-a
bindkey 'ƒ' forward-word # option-b
bindkey 'ç' fzf-cd-widget #option-c
bindkey '∂' delete-word #option-d
bindkey '›' backward-word # option-f
bindkey '¸' get-line # option-g
bindkey '˛' run-help #option-h
bindkey 'ﬁ' down-case-word #option-l
bindkey '‘' history-search-forward #option-n
bindkey 'π' history-search-backward #option-p
bindkey '•' push-line #option-q
bindkey 'ß' spell-word #option-s
bindkey '†' transpose-words #option-t
bindkey 'ü' up-case-word #option-u
bindkey 'Ω' copy-region-as-kill #option-w
bindkey '≈' execute-named-cmd #option-x
bindkey 'µ' yank-pop #option-y
```

CTRL-G CTRL-F的文件
CTRL-G CTRL-B对分支机构
CTRL-G CTRL-T标签
CTRL-G CTRL-R的遥控器
CTRL-G CTRL-H提交的散列