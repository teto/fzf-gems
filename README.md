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
