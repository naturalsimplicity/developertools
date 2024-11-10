#!/usr/bin/env bash

# создать алиас в текущем терминале 
alias ll="ls -la"

# создать алиас и сделать его постоянным путем добавления в ~/.bashrc (~/.zshrc для Mac OS)
echo "alias ll=\"ls -la\"" >> ~/.zshrc

# при вводе этой команды и нажатии Tab bash дополнит команду до полного названия файла
cd devel # будет дополнено до cd developertools
