echo "Список файлов и каталогов в текущей директории"
for item in *; do
    if [ -d "$item" ]; then
        echo "[DIR]  $item"
    elif [ -f "$item" ]; then
        echo "[FILE] $item"
    elif [ -L "$item" ]; then
        echo "[LINK] $item"
    else
        echo "[OTHER] $item"
    fi
done

echo 

if [ -e "$1" ]; then
    echo "Файл '$1' существует."
else
    echo "Файл '$1' не найден."
fi

echo 

for file in *; do
    perms=$(ls -ld "$file" | awk '{print $1}')
    echo "$file — права: $perms"
done