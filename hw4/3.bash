read -p "Введите число: " num

if [ "$num" -gt 0 ]; then
    echo "Число $num — положительное."
elif [ "$num" -lt 0 ]; then
    echo "Число $num — отрицательное."
else
    echo "Число равно нулю."
fi

echo

if [ "$num" -gt 0 ]; then
    echo "Счёт от 1 до $num:"
    i=1
    while [ "$i" -le "$num" ]; do
        echo "$i"
        ((i++))
    done
fi
