#!/usr/bin/env bash
echo $PATH

# Изменяем значение переменной PATH
PATH=$PATH:$1

# Так как простое присваивание переменной PATH изменит
# ее только в текущем окне терминала, нужно добавить
# заданный путь в конфигурационный файл ~/.bashrc (~./zshrc для Mac OS)
echo "export PATH=\"\$PATH:$1\"" >> ~/.zshrc

# Применить изменные настройки
source ~/.zshrc
