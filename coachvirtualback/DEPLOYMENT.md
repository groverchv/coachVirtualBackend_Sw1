# 🚀 Guía de Despliegue - CoachVirtual Backend

## ✅ Estado del Proyecto

El proyecto está completamente configurado y listo para despliegue en Railway u otra plataforma similar.

## 📋 Checklist Pre-Despliegue

### 1. Base de Datos
- ✅ Modelos creados y migraciones aplicadas
- ✅ Comando `seed_musculos` funcionando correctamente
- ✅ PostgreSQL configurado
- ✅ Datos cargados: 2 Tipos, 10 Músculos, 50 Ejercicios, 55 Detalles

### 2. Configuración
- ✅ Variables de entorno configuradas en `.env`
- ✅ `requirements.txt` actualizado con todas las dependencias
- ✅ `Procfile` configurado para Railway/Heroku
- ✅ `runtime.txt` especifica Python 3.12.3
- ✅ WhiteNoise configurado para archivos estáticos
- ✅ CORS configurado correctamente

### 3. Archivos Importantes
- ✅ `.gitignore` configurado (no sube `.env`, `__pycache__`, etc.)
- ✅ Configuración de PostgreSQL usando `DATABASE_URL`

## 🛠️ Comandos Importantes

### Desarrollo Local

```bash
# Activar entorno virtual
.\env\Scripts\activate

# Aplicar migraciones
python manage.py migrate

# Cargar datos iniciales (IMPORTANTE después de migrar)
python manage.py seed_musculos

# Limpiar y recargar datos
python manage.py seed_musculos --clear

# Ejecutar servidor de desarrollo
python manage.py runserver

# Crear superusuario
python manage.py createsuperuser
```

### Verificación Pre-Despliegue

```bash
# Verificar configuración para producción
python manage.py check --deploy

# Recolectar archivos estáticos
python manage.py collectstatic --noinput
```

## 🚂 Despliegue en Railway

### Variables de Entorno Requeridas

Configurar en Railway Dashboard > Variables:

```env
# Base de datos (Railway genera automáticamente DATABASE_URL)
DATABASE_URL=postgresql://user:password@host:port/database

# Seguridad
SECRET_KEY=tu_clave_secreta_larga_y_aleatoria_aqui
DEBUG=False
ALLOWED_HOSTS=tu-app.railway.app,*.railway.app

# Google Fit (opcional)
GOOGLE_FIT_CLIENT_ID=tu_client_id
GOOGLE_FIT_CLIENT_SECRET=tu_client_secret
GOOGLE_FIT_ACCESS_TOKEN=tu_access_token
GOOGLE_FIT_REFRESH_TOKEN=tu_refresh_token

# Stripe (opcional)
STRIPE_SECRET_KEY=tu_stripe_key
```

### Pasos de Despliegue

1. **Conectar Repositorio**
   - Sube tu código a GitHub
   - Conecta el repositorio en Railway
   - Railway detectará automáticamente que es Django

2. **Configurar Base de Datos**
   - Railway creará automáticamente PostgreSQL
   - La variable `DATABASE_URL` se configura automáticamente

3. **Después del Primer Despliegue**
   
   Ejecutar en Railway CLI o desde la consola web:
   
   ```bash
   # Aplicar migraciones
   python manage.py migrate
   
   # Cargar datos iniciales
   python manage.py seed_musculos
   
   # Crear superusuario (opcional)
   python manage.py createsuperuser
   ```

4. **Verificar Despliegue**
   - Accede a `https://tu-app.railway.app/admin`
   - Verifica que las APIs funcionen correctamente

## 📝 Notas Importantes

### Seguridad en Producción

⚠️ **IMPORTANTE**: Antes de desplegar a producción:

1. Genera una `SECRET_KEY` nueva y segura:
   ```python
   from django.core.management.utils import get_random_secret_key
   print(get_random_secret_key())
   ```

2. Asegúrate de que `DEBUG=False` en producción

3. Configura correctamente `ALLOWED_HOSTS` con tu dominio

### Estructura de Datos

El comando `seed_musculos` carga:

- **2 Tipos**: Gimnasio, Fisioterapia
- **10 Músculos**: 5 para Gimnasio, 5 para Fisioterapia
- **50 Ejercicios**: 18 para Gimnasio, 32 para Fisioterapia
- **55 Detalles Músculo-Ejercicio**: Relaciones con porcentajes

### Mantenimiento

```bash
# Ver logs en Railway
railway logs

# Ejecutar comandos en Railway
railway run python manage.py [comando]

# Abrir shell de Django en Railway
railway run python manage.py shell
```

## 🔧 Solución de Problemas

### Error: "No module named X"
```bash
pip install -r requirements.txt
```

### Error: "relation does not exist"
```bash
python manage.py migrate
```

### Error: "No data in database"
```bash
python manage.py seed_musculos
```

### Warning: "Accessing database during app initialization"
✅ **RESUELTO**: Se eliminó el código que accedía a la BD en `apps.py`

## 📊 Estado de Migraciones

Todas las migraciones están aplicadas:
- ✅ admin
- ✅ auth
- ✅ contenttypes
- ✅ musculos
- ✅ poses
- ✅ sessions
- ✅ suscripciones
- ✅ usuarios

## 🎯 APIs Disponibles

Una vez desplegado, el backend expone las siguientes APIs:

- `/admin/` - Panel de administración
- `/api/usuarios/` - Gestión de usuarios
- `/api/musculos/` - Gestión de músculos y ejercicios
- `/api/poses/` - Gestión de poses
- `/api/suscripciones/` - Gestión de suscripciones

## ✨ Todo Listo

El proyecto está completamente configurado y listo para:
- ✅ Ejecutar localmente
- ✅ Desplegar en Railway
- ✅ Cargar datos iniciales
- ✅ Conectar con frontend

**¡Éxito con el despliegue! 🚀**
