SOURCE_DIR="$1"
BACKUP_DIR="$2"
LOG_FILE="backup.log"
DATE=$(date +"%Y-%m-%d_%H-%M-%S")

if [ -z "$SOURCE_DIR" ] || [ -z "$BACKUP_DIR" ]; then
    echo "Использование: $0 <исходная_папка> <папка_для_резервных_копий>"
    exit 1
fi

if [ ! -d "$SOURCE_DIR" ]; then
    echo "Директория $SOURCE_DIR не найдена!"
    exit 1
fi

mkdir -p "$BACKUP_DIR"

echo "Резервное копирование начато: $DATE " >> "$LOG_FILE"

count=0
for file in "$SOURCE_DIR"/*; do
    if [ -f "$file" ]; then
        filename=$(basename "$file")
        cp "$file" "$BACKUP_DIR/${filename}_$DATE"
        echo "Скопирован файл: $filename" >> "$LOG_FILE"
        ((count++))
    fi
done

echo "Резервное копирование завершено. Всего файлов: $count"
echo "Подробности в логе: $LOG_FILE"
echo "Завершено $DATE" >> "$LOG_FILE"
