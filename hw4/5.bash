echo "Запуск трёх процессов sleep в фоне"

sleep 15 &
PID1=$!
echo "Процесс 1 (sleep 10) запущен с PID"

sleep 15 &
PID2=$!
echo "Процесс 2 (sleep 10)"

sleep 15 &
PID3=$!
echo "Процесс 3 (sleep 15)"

echo
echo "Текущие фоновые задачи"
jobs

echo "  fg %1       # вернуть задачу №1 на передний план"
fg %1

echo "  bg        # снова отправить её в фон"
bg 

echo "  kill <PID>  # завершить задачу по PID"
kill $PID1

echo
echo "Текущие фоновые задачи"
jobs
