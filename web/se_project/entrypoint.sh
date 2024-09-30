# Django 執行
echo "Collect static files"
python manage.py collectstatic --no-input

echo "Make migrations"
python manage.py makemigrations

echo "Apply database migrations"
python manage.py migrate

# gunicorn se_project.se_project.wsgi:application --bind 0.0.0.0:8000

exec "$@"