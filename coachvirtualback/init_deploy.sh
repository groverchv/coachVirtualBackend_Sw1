#!/usr/bin/env bash
# Script de inicialización para despliegue
# Ejecutar después del primer despliegue en Railway

echo "🚀 Iniciando configuración inicial del backend..."

echo "📦 Aplicando migraciones..."
python manage.py migrate --noinput

echo "🌱 Cargando datos iniciales..."
python manage.py seed_musculos

echo "📊 Recolectando archivos estáticos..."
python manage.py collectstatic --noinput

echo "✅ Configuración completada!"
echo ""
echo "📝 Próximos pasos (opcional):"
echo "   1. Crear superusuario: python manage.py createsuperuser"
echo "   2. Acceder al admin: https://tu-app.railway.app/admin"
echo ""
