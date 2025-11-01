
echo "Содержимое input.txt:"
cat input.txt
echo

wc -l input.txt > output.txt
cat output.txt
echo

ls nonexistent_file.txt 2> error.log
cat error.log
echo
