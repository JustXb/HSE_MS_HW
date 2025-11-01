say_hello() {
    local name="$1"
    echo "Hello, $name!"
}

add_numbers() {
    local a="$1"
    local b="$2"
    local sum=$((a + b))
    echo "$sum"
}

echo "Введите имя:"
read user_name
say_hello "$user_name"

echo

echo "Введите два числа для сложения:"
read -p "Первое число: " num1
read -p "Второе число: " num2

result=$(add_numbers "$num1" "$num2")

echo "Сумма чисел $num1 и $num2 = $result"
