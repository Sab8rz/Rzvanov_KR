#!/usr/bin/env bash
set -euo pipefail

PROJECT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"

echo "Создаю testfile.sh..."
cat > testfile.sh <<'EOF'
#!/usr/bin/env bash
echo "Скрипт testfile.sh запущен."
EOF
chmod +x testfile.sh

echo
echo "Файлы текущего каталога:"
ls -la

echo
echo "Системная информация:"
uname -a
echo "Версия выпуска ядра:"
uname -r

cd "$PROJECT_DIR/tasks/templates"

echo
echo "Текущий пользователь:"
whoami

echo
echo "Сохраняю главную страницу Финансового университета в Рзванов.txt..."
curl --fail --location --silent --show-error \
  --user-agent "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36" \
  https://www.fa.ru/ \
  --output "$PROJECT_DIR/Рзванов.txt"
echo "Страница сохранена: $PROJECT_DIR/Рзванов.txt"