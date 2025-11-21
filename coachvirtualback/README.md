# 🏋️ CoachVirtual Backend - Sistema de Gestión de Ejercicios

Backend desarrollado en Django para la aplicación CoachVirtual, que permite gestionar rutinas de ejercicios tanto para gimnasio como para fisioterapia.

## 🚀 Estado del Proyecto

✅ **Proyecto completamente funcional y listo para despliegue**

- ✅ Base de datos PostgreSQL configurada
- ✅ Modelos de datos implementados
- ✅ Migraciones aplicadas
- ✅ Comando de carga de datos funcionando (`seed_musculos`)
- ✅ APIs REST implementadas
- ✅ Configuración de seguridad para producción
- ✅ Archivos de despliegue listos (Procfile, runtime.txt)

## 📊 Estructura de Datos

### Apps Principales

1. **musculos** - Gestión de músculos, ejercicios y rutinas
   - Tipos (Gimnasio/Fisioterapia)
   - Músculos (10 grupos musculares)
   - Ejercicios (50 ejercicios con GIFs)
   - Detalles Músculo-Ejercicio (55 relaciones)

2. **usuarios** - Gestión de usuarios y perfiles
3. **poses** - Detección y análisis de poses
4. **suscripciones** - Sistema de suscripciones (Stripe)
5. **dispositivo** - Integración con Google Fit

## 🛠️ Tecnologías

- **Framework**: Django 5.2.8
- **Base de Datos**: PostgreSQL
- **API**: Django REST Framework
- **Autenticación**: JWT (SimpleJWT)
- **Servidor**: Gunicorn
- **Archivos Estáticos**: WhiteNoise
- **Pagos**: Stripe
- **Fitness Data**: Google Fit API

## ⚙️ Instalación Local

### 1. Clonar el repositorio

```bash
git clone <tu-repositorio>
cd coachvirtualbackend/coachvirtualback
```

### 2. Crear y activar entorno virtual

```bash
# Windows
python -m venv env
.\env\Scripts\activate

# Linux/Mac
python -m venv env
source env/bin/activate
```

### 3. Instalar dependencias

```bash
pip install -r requirements.txt
```

### 4. Configurar variables de entorno

Crear archivo `.env` en la raíz del proyecto:

```env
# Base de datos
DATABASE_URL=postgresql://usuario:password@host:puerto/nombre_bd

# Seguridad
SECRET_KEY=tu_clave_secreta_muy_larga_y_aleatoria
DEBUG=True
ALLOWED_HOSTS=localhost,127.0.0.1

# Opcional: Google Fit
GOOGLE_FIT_CLIENT_ID=tu_client_id
GOOGLE_FIT_CLIENT_SECRET=tu_client_secret

# Opcional: Stripe
STRIPE_SECRET_KEY=tu_stripe_key
```

### 5. Aplicar migraciones

```bash
python manage.py migrate
```

### 6. Cargar datos iniciales

```bash
python manage.py seed_musculos
```

**Resultado esperado:**
- 2 Tipos (Gimnasio, Fisioterapia)
- 10 Músculos
- 50 Ejercicios
- 55 Detalles Músculo-Ejercicio

### 7. Crear superusuario (opcional)

```bash
python manage.py createsuperuser
```

### 8. Ejecutar servidor

```bash
python manage.py runserver
```

El servidor estará disponible en: `http://localhost:8000`

## 📝 Comandos Importantes

```bash
# Aplicar migraciones
python manage.py migrate

# Cargar datos iniciales
python manage.py seed_musculos

# Limpiar y recargar datos
python manage.py seed_musculos --clear

# Crear migraciones
python manage.py makemigrations

# Verificar configuración
python manage.py check

# Verificar configuración para producción
python manage.py check --deploy

# Recolectar archivos estáticos
python manage.py collectstatic

# Crear superusuario
python manage.py createsuperuser

# Ejecutar servidor de desarrollo
python manage.py runserver
```

## 🚂 Despliegue en Railway

### Paso 1: Preparar el repositorio

```bash
git add .
git commit -m "Preparado para despliegue"
git push origin main
```

### Paso 2: Configurar en Railway

1. Crear nuevo proyecto en Railway
2. Conectar repositorio de GitHub
3. Agregar servicio PostgreSQL
4. Configurar variables de entorno:

```env
DATABASE_URL=<automático_de_railway>
SECRET_KEY=<generar_nueva_clave_segura>
DEBUG=False
ALLOWED_HOSTS=*.railway.app
```

### Paso 3: Después del despliegue

Ejecutar en Railway CLI o consola web:

```bash
# Aplicar migraciones
python manage.py migrate

# Cargar datos iniciales
python manage.py seed_musculos

# (Opcional) Crear superusuario
python manage.py createsuperuser
```

O usar el script de inicialización:

```bash
# Linux/Mac
bash init_deploy.sh

# Windows (PowerShell)
.\init_deploy.ps1
```

## 📁 Estructura del Proyecto

```
coachvirtualback/
├── coachvirtualback/        # Configuración del proyecto
│   ├── settings.py         # Configuración principal
│   ├── urls.py             # URLs principales
│   └── wsgi.py             # WSGI para despliegue
├── musculos/               # App de músculos y ejercicios
│   ├── models.py           # Modelos de datos
│   ├── views.py            # Vistas/APIs
│   ├── controllers/        # Lógica de negocio
│   └── management/         # Comandos personalizados
│       └── commands/
│           └── seed_musculos.py
├── usuarios/               # App de usuarios
├── poses/                  # App de poses
├── suscripciones/         # App de suscripciones
├── dispositivo/           # App de dispositivos
├── .env                   # Variables de entorno (NO subir a git)
├── .gitignore            # Archivos ignorados por git
├── requirements.txt      # Dependencias Python
├── Procfile             # Configuración para despliegue
├── runtime.txt          # Versión de Python
├── DEPLOYMENT.md        # Guía detallada de despliegue
└── manage.py            # Script de gestión Django
```

## 🔗 APIs Disponibles

Una vez desplegado, el backend expone:

- **Admin**: `/admin/` - Panel de administración
- **Usuarios**: `/api/usuarios/` - Gestión de usuarios y autenticación
- **Músculos**: `/api/musculos/` - Músculos, ejercicios y detalles
- **Poses**: `/api/poses/` - Detección de poses
- **Suscripciones**: `/api/suscripciones/` - Gestión de planes

## 🔐 Seguridad

### Producción (DEBUG=False)

Cuando `DEBUG=False`, se activan automáticamente:

- ✅ HTTPS redirect
- ✅ Secure cookies
- ✅ HSTS habilitado
- ✅ CSRF protection mejorado

### Variables Sensibles

⚠️ **NUNCA** subir a git:
- `.env` - Variables de entorno
- `db.sqlite3` - Base de datos local
- Claves API o tokens

## 📖 Documentación Adicional

- [DEPLOYMENT.md](DEPLOYMENT.md) - Guía completa de despliegue
- [BD_MUSCULOS.md](../BD_MUSCULOS.md) - Estructura de datos de músculos
- [README_SEED_MUSCULOS.md](../README_SEED_MUSCULOS.md) - Documentación del comando seed

## 🐛 Solución de Problemas

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

### Base de datos vacía después de migrar
```bash
python manage.py seed_musculos
```

## 📦 Dependencias Principales

```
Django==5.2.8
djangorestframework==3.16.1
djangorestframework-simplejwt==5.5.1
django-cors-headers==4.9.0
psycopg-binary==3.2.12
gunicorn==23.0.0
whitenoise==6.11.0
stripe==13.2.0
python-decouple==3.8
```

## 👥 Equipo de Desarrollo

Proyecto desarrollado para Software 1 - Gestión 2-2025

## 📄 Licencia

Este proyecto es privado y está protegido por derechos de autor.

---

**✨ Todo listo para desarrollar y desplegar! 🚀**

Para más detalles sobre el despliegue, consulta [DEPLOYMENT.md](DEPLOYMENT.md)
