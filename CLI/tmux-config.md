# CLI - tmux config
## Basics
`<PRE>` = Prefix = `[Ctrl]` + `[b]` (by default)

## config hacks
edit/create `~/.tmux.conf` and add/change following lines for:
* changing `<PRE>` from default `[CTRL]` + `[b]` (tmux) to `[CTRL]` + `[a]` (screen)
* "`|`" and "`-`" keys for tiling 
* etc.

```conf
# remap prefix from 'C-b' to 'C-a'
unbind C-b
set-option -g prefix C-a
bind-key C-a send-prefix

# Start window numbering at 1
#set -g base-index 1

# split panes using "|" and "-"
bind | split-window -h
bind - split-window -v
unbind '"'
unbind %

# force a reload of the config file
unbind r
bind r source-file ~/.tmux.conf

# Set the default terminal mode to 256color mode
set -g default-terminal "screen-256color"

# enable activity alerts
#setw -g monitor-activity on
#set -g visual-activity on

# Center the window list
set -g status-justify centre

# Mouse scrolling
set -g mouse on
set -g history-limit 30000
bind -T root WheelUpPane   if-shell -F -t = "#{alternate_on}" "send-keys -M" "select-pane -t =; copy-mode -e; send-keys -M"                                                                                       
bind -T root WheelDownPane if-shell -F -t = "#{alternate_on}" "send-keys -M" "select-pane -t =; send-keys -M" 
```
