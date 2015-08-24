# Normal Bindings
bindkey '^U'    backward-kill-line                      # Ctrl + U
bindkey '^A'    beginning-of-line                       # Ctrl + A
bindkey '^[OH'  beginning-of-line                       # Home
bindkey '^[[1~' beginning-of-line                       # Home
bindkey '^[[H'  beginning-of-line                       # Home

bindkey '^K'    kill-line                               # Ctrl + K
bindkey '^E'    end-of-line                             # Ctrl + E
bindkey '^[OF'  end-of-line                             # End
bindkey '^[[4~' end-of-line                             # End
bindkey '^[[F'  end-of-line                             # End

bindkey '^R'    history-incremental-search-backward     # Ctrl + R
bindkey '^[[A'  up-line-or-search                       # Up Arrow
bindkey '^[OA'  up-line-or-search                       # Up Arrow
bindkey '^[[5~' up-line-or-history                      #
bindkey '^[[B'  down-line-or-search                     # Down Arrow
bindkey '^[OB'  down-line-or-search                     # Down Arrow
bindkey '^[[6~' down-line-or-history                    #
bindkey ' '     magic-space                             # Space

bindkey '^[[1;2C' forward-word                          # Ctrl + Right Arrow
bindkey '^[[1;2D' backward-word                         # Ctrl + Left Arrow
bindkey '^[[Z'    reverse-menu-complete                 # Shift + Tab

bindkey '^[[3~'  delete-char                            # Delete
bindkey '^[[3~'  delete-char                            # Delete
bindkey '^[3;5~' delete-char                            # Delete
bindkey '^[[3~' delete-char                             # Delete
bindkey '^?'    backward-delete-char                    # Backspace

# vi bindings
#bindkey -v
bindkey -v '' copy-prev-shell-word                    # Ctrl + O

# emacs bindings
bindkey -e
