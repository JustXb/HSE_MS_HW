LOG_FILE="system_monitor.log"
DATE=$(date +"%Y-%m-%d %H:%M:%S")

echo "Мониторинг системы: $DATE" >> "$LOG_FILE"

CPU_LOAD=$(top -l 1 | awk '/CPU usage/ {print $3}')
MEM_USED=$(vm_stat | awk '/Pages active/ {active=$3} /Pages wired down/ {wired=$4} /Pages free/ {free=$3} END {total=active+wired+free; print (100*(active+wired)/total)}' | sed 's/\..*//')
DISK_USAGE=$(df -h / | awk 'NR==2 {print $5}')

echo "CPU нагрузка: $CPU_LOAD" >> "$LOG_FILE"
echo "Использование памяти: $MEM_USED%" >> "$LOG_FILE"
echo "Использование диска: $DISK_USAGE" >> "$LOG_FILE"

if [ "$MEM_USED" -gt 80 ]; then
    echo "Внимание! Использование памяти превышает 80% ($MEM_USED%)." | tee -a "$LOG_FILE"
    echo "Топ 5 процессов по использованию памяти:" >> "$LOG_FILE"
    ps -Ao pid,comm,%mem --sort=-%mem | head -n 6 | tee -a "$LOG_FILE"
fi

echo "Конец отчёта" >> "$LOG_FILE"
