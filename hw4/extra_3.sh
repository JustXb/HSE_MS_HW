TARGET_DIR="$1"
LOG_FILE="file_sort.log"
DATE=$(date +"%Y-%m-%d %H:%M:%S")

if [ -z "$TARGET_DIR" ]; then
    echo "Использование: $0 <директория>"
    exit 1
fi

if [ ! -d "$TARGET_DIR" ]; then
    echo "Директория не найдена: $TARGET_DIR"
    exit 1
fi

cd "$TARGET_DIR" || exit

mkdir -p Images Documents Others

echo "=== Сортировка начата: $DATE ===" >> "$LOG_FILE"

for file in *; do
    if [ -f "$file" ]; then
        case "$file" in
            *.jpg|*.png|*.gif)
                mv "$file" Images/
                echo "Перемещён: $file → Images/" >> "$LOG_FILE"
                ;;
            *.txt|*.pdf|*.docx)
                mv "$file" Documents/
                echo "Перемещён: $file → Documents/" >> "$LOG_FILE"
                ;;
            *)
                mv "$file" Others/
                echo "Перемещён: $file → Others/" >> "$LOG_FILE"
                ;;
        esac
    fi
done

echo "Сортировка завершена $DATE" >> "$LOG_FILE"
