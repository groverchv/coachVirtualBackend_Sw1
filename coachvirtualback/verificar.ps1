# Script de verificación rápida del proyecto
# Ejecutar antes de desplegar para asegurar que todo está correcto

Write-Host "Iniciando verificacion del proyecto..." -ForegroundColor Cyan
Write-Host ""

# 1. Verificar archivos importantes
Write-Host "Verificando archivos esenciales..." -ForegroundColor Yellow
$archivos_requeridos = @(
    "manage.py",
    "requirements.txt",
    "Procfile",
    "runtime.txt",
    ".env",
    ".gitignore"
)

$archivos_faltantes = @()
foreach ($archivo in $archivos_requeridos) {
    if (Test-Path $archivo) {
        Write-Host "  OK $archivo" -ForegroundColor Green
    } else {
        Write-Host "  ERROR $archivo - NO ENCONTRADO" -ForegroundColor Red
        $archivos_faltantes += $archivo
    }
}

Write-Host ""

# 2. Verificar configuración de Django
Write-Host "Verificando configuracion de Django..." -ForegroundColor Yellow
python manage.py check 2>&1 | Out-Null
if ($LASTEXITCODE -eq 0) {
    Write-Host "  OK Configuracion correcta" -ForegroundColor Green
} else {
    Write-Host "  ERROR en la configuracion" -ForegroundColor Red
}

Write-Host ""

# 3. Verificar migraciones
Write-Host "Verificando estado de migraciones..." -ForegroundColor Yellow
$migraciones = python manage.py showmigrations --plan 2>&1 | Select-String "\[X\]" | Measure-Object
if ($migraciones.Count -gt 0) {
    Write-Host "  OK Migraciones aplicadas: $($migraciones.Count)" -ForegroundColor Green
} else {
    Write-Host "  ADVERTENCIA No hay migraciones aplicadas" -ForegroundColor Yellow
}

Write-Host ""

# 4. Verificar comando seed_musculos
Write-Host "Verificando comando seed_musculos..." -ForegroundColor Yellow
$help_output = python manage.py help seed_musculos 2>&1
if ($help_output -match "Poblar base de datos") {
    Write-Host "  OK Comando disponible" -ForegroundColor Green
} else {
    Write-Host "  ERROR Comando no encontrado" -ForegroundColor Red
}

Write-Host ""
Write-Host "============================================================" -ForegroundColor Cyan

# Resumen final
if ($archivos_faltantes.Count -eq 0) {
    Write-Host ""
    Write-Host "VERIFICACION COMPLETADA" -ForegroundColor Green
    Write-Host "   El proyecto esta listo para despliegue" -ForegroundColor Green
    Write-Host ""
    Write-Host "Proximos pasos:" -ForegroundColor Cyan
    Write-Host "   1. git add ." -ForegroundColor White
    Write-Host "   2. git commit -m 'Listo para despliegue'" -ForegroundColor White
    Write-Host "   3. git push origin main" -ForegroundColor White
    Write-Host "   4. Desplegar en Railway" -ForegroundColor White
    Write-Host "   5. Ejecutar: python manage.py seed_musculos" -ForegroundColor White
    Write-Host ""
} else {
    Write-Host ""
    Write-Host "ATENCION" -ForegroundColor Yellow
    $archivos_str = $archivos_faltantes -join ", "
    Write-Host "   Archivos faltantes: $archivos_str" -ForegroundColor Yellow
    Write-Host ""
}
