#!/bin/bash
SQL_FILE="demo-big-20170815.sql"

echo "📂 Копируем $SQL_FILE в контейнер..."
sudo docker cp "$SQL_FILE" lab1-postgres-1:/tmp/

echo "🚀 Запускаем импорт (это может занять несколько минут)..."
sudo docker exec -it lab1-postgres-1 su - postgres -c "psql -U lab -d postgres -f /tmp/$SQL_FILE"

echo "✅ База 'demo' успешно установлена!"