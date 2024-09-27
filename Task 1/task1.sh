#!/bin/bash

# Масив з URL вебсайтів
websites=("https://google.com" "https://facebook.com" "https://twitter.com")

# Назва файлу логів
log_file="website_status.log"

# Очищення або створення файлу логів
> $log_file

# Перевірка кожного вебсайту
for website in "${websites[@]}"
do
    # Надсилаємо запит через curl з тайм-аутом у 5 секунд
    status_code=$(curl -o /dev/null -s -w "%{http_code}" "$website")

    # Якщо статус-код 200, сайт доступний
    if [ $status_code -eq 200 ]; then
        echo "$website is UP"
        echo "$website is UP" >> $log_file
    else
        echo "$website is DOWN"
        echo "$website is DOWN" >> $log_file
    fi
done

# Виведення повідомлення про завершення та назву файлу логів
echo "Результати перевірки записані у файл: $log_file"