# Script de inicialización para despliegue (Windows)
# Ejecutar después del primer despliegue en Railway

Write-Host "🚀 Iniciando configuración inicial del backend..." -ForegroundColor Green

Write-Host "📦 Aplicando migraciones..." -ForegroundColor Yellow
python manage.py migrate --noinput

Write-Host "🌱 Cargando datos iniciales..." -ForegroundColor Yellow
python manage.py seed_musculos

Write-Host "📊 Recolectando archivos estáticos..." -ForegroundColor Yellow
python manage.py collectstatic --noinput

Write-Host ""
Write-Host "✅ Configuración completada!" -ForegroundColor Green
Write-Host ""
Write-Host "📝 Próximos pasos (opcional):" -ForegroundColor Cyan
Write-Host "   1. Crear superusuario: python manage.py createsuperuser"
Write-Host "   2. Acceder al admin: https://tu-app.railway.app/admin"
Write-Host ""
