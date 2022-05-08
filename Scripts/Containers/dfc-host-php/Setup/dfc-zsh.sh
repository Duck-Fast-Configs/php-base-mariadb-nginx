#!/bin/bash

# Extra vars
## There should be no '/' at the end
dfc_project_main_folder="../../../.."

# Header of script
. $dfc_project_main_folder/Scripts/Dependencies/dfc-script-header.sh

# General process
message_info "$(date '+%H:%M:%S (%m/%d/%y)')" 2
message_space 2

docker-compose -p $dfc_global__project_name exec -u dfc-user dfc-host-php ash -c "rm ~/.zshrc" >&1
docker-compose -p $dfc_global__project_name exec -u root dfc-host-php ash -c "apk add zsh zsh-syntax-highlighting zsh-autosuggestions" >&1
docker-compose -p $dfc_global__project_name exec -u dfc-user dfc-host-php ash -c "echo 'source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh' >> \${ZDOTDIR:-\$HOME}/.zshrc" >&1
docker-compose -p $dfc_global__project_name exec -u dfc-user dfc-host-php ash -c "echo 'source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh' >> \${ZDOTDIR:-\$HOME}/.zshrc" >&1
docker-compose -p $dfc_global__project_name exec -u dfc-user dfc-host-php ash -c "echo 'plugins=(zsh-syntax-highlighting zsh-autosuggestions)' >> \${ZDOTDIR:-\$HOME}/.zshrc" >&1
docker-compose -p $dfc_global__project_name exec -u dfc-user dfc-host-php ash -c "echo 'PROMPT=\"| %n@%m %1 => \"' >> \${ZDOTDIR:-\$HOME}/.zshrc" >&1

docker-compose -p $dfc_global__project_name exec -u dfc-user dfc-host-php ash -c "echo 'alias neofetch=\"echo '' && neofetch --stdout\"' >> \${ZDOTDIR:-\$HOME}/.zshrc" >&1
docker-compose -p $dfc_global__project_name exec -u dfc-user dfc-host-php ash -c "echo 'alias ls=\"ls --color=none -p --group-directories-first -X\"' >> \${ZDOTDIR:-\$HOME}/.zshrc" >&1
docker-compose -p $dfc_global__project_name exec -u dfc-user dfc-host-php ash -c "echo 'alias grep=\"grep --color=none\"' >> \${ZDOTDIR:-\$HOME}/.zshrc" >&1
docker-compose -p $dfc_global__project_name exec -u dfc-user dfc-host-php ash -c "echo 'alias fgrep=\"fgrep --color=none\"' >> \${ZDOTDIR:-\$HOME}/.zshrc" >&1
docker-compose -p $dfc_global__project_name exec -u dfc-user dfc-host-php ash -c "echo 'alias egrep=\"egrep --color=none\"' >> \${ZDOTDIR:-\$HOME}/.zshrc" >&1


docker-compose -p $dfc_global__project_name exec -u dfc-user dfc-host-php ash -c "echo 'export HISTFILE=~/.zsh_history' >> \${ZDOTDIR:-\$HOME}/.zshrc" >&1
docker-compose -p $dfc_global__project_name exec -u dfc-user dfc-host-php ash -c "echo 'export HISTSIZE=1000' >> \${ZDOTDIR:-\$HOME}/.zshrc" >&1
docker-compose -p $dfc_global__project_name exec -u dfc-user dfc-host-php ash -c "echo 'export SAVEHIST=1000' >> \${ZDOTDIR:-\$HOME}/.zshrc" >&1

message_info "В контейнере 'dfc-host-php' установлен пакет 'zsh' и готов к работе" 1

# End of script
. $dfc_project_main_folder/Scripts/Dependencies/dfc-script-footer.sh
