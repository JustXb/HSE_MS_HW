echo "Текущее значение PATH"
echo "$PATH"
echo

NEW_DIR="$1"

if [ ! -d "$NEW_DIR" ]; then
    echo "директория '$NEW_DIR' не существует"
    exit 1
fi

export PATH="$PATH:$NEW_DIR"

echo "Новое значение PATH:"
echo "$PATH"



