from django.apps import AppConfig


class MusculosConfig(AppConfig):
    default_auto_field = "django.db.models.BigAutoField"
    name = "musculos"
    verbose_name = "Musculos"

    # NOTA: Los datos iniciales (Tipos, Músculos, Ejercicios) se cargan
    # usando el comando de management: python manage.py seed_musculos
