import os
from pathlib import Path
from datetime import timedelta

# === Base directory ===
BASE_DIR = Path(__file__).resolve().parent.parent
DELIVERY_MODEL_PATH = BASE_DIR / 'ai_models' / 'delivery_model.pkl'
INVENTORY_MODEL_PATH = BASE_DIR / 'ai_models' / 'inventory_model.pkl'
SALES_MODEL_PATH = BASE_DIR / 'ai_models' / 'sales_model.pkl'

# === Security ===
SECRET_KEY = os.getenv('DJANGO_SECRET_KEY', 'replace-me-with-secure-key')
DEBUG = True



# === Applications ===
INSTALLED_APPS = [
    'django.contrib.admin',
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.messages',
    'django.contrib.staticfiles', 
    'django_extensions',
    'drf_spectacular',
    'drf_spectacular_sidecar',

    'corsheaders',
    'rest_framework',
    'rest_framework_simplejwt',
    'rest_framework_simplejwt.token_blacklist',
    'djoser',
    'channels',
    'django_filters',

    'api.apps.ApiConfig',
    
   
]

# === Middleware ===
MIDDLEWARE = [
    'django.middleware.security.SecurityMiddleware',
    'corsheaders.middleware.CorsMiddleware',
    'django.contrib.sessions.middleware.SessionMiddleware',
    'django.middleware.common.CommonMiddleware',
    'django.middleware.csrf.CsrfViewMiddleware',
    'django.contrib.auth.middleware.AuthenticationMiddleware',
    'django.contrib.messages.middleware.MessageMiddleware',
    'django.middleware.clickjacking.XFrameOptionsMiddleware',
    'api.middleware.CustomExceptionMiddleware',
]

# === URL configuration ===
ROOT_URLCONF = 'gestionM.urls'

# === Templates ===
TEMPLATES = [
    {
        'BACKEND': 'django.template.backends.django.DjangoTemplates',
        'DIRS': [ BASE_DIR / 'templates' ],
        'APP_DIRS': True,
        'OPTIONS': {
            'context_processors': [
                'django.template.context_processors.debug',
                'django.template.context_processors.request',
                'django.contrib.auth.context_processors.auth',
                'django.contrib.messages.context_processors.messages',
            ],
        },
    },
]

# === WSGI & ASGI ===
WSGI_APPLICATION = 'gestionM.wsgi.application'
ASGI_APPLICATION = 'gestionM.asgi.application'

# === Database ===
DATABASES = {
    'default': {
        'ENGINE':   'django.db.backends.mysql',
        'NAME':     'my_stock2',            # ← ton nouveau nom
        'USER':     'django_user',
        'PASSWORD': 'admin123', # ← même mot de passe que dans le script
        'HOST':     'localhost',
        'PORT':     '3306',
    }
}




# === Custom User ===
AUTH_USER_MODEL = 'api.CustomUser'



# === Password validators ===
AUTH_PASSWORD_VALIDATORS = [
    {'NAME': 'django.contrib.auth.password_validation.UserAttributeSimilarityValidator'},
    {'NAME': 'django.contrib.auth.password_validation.MinimumLengthValidator'},
    {'NAME': 'django.contrib.auth.password_validation.CommonPasswordValidator'},
    {'NAME': 'django.contrib.auth.password_validation.NumericPasswordValidator'},
]

# === Internationalization ===
LANGUAGE_CODE = 'fr-fr'
TIME_ZONE = 'Africa/Bamako'
USE_I18N = True
USE_L10N = True
USE_TZ = True

# === Static & Media ===
STATIC_URL = '/static/'
STATICFILES_DIRS = [BASE_DIR / 'static']
STATIC_ROOT = BASE_DIR / 'staticfiles'
MEDIA_URL = '/media/'
MEDIA_ROOT = BASE_DIR / 'media'

# === CORS ===
CORS_ALLOWED_ORIGINS = [
    "http://localhost:52548", 
    "http://127.0.0.1:3000",
    "http://localhost:50832",      # ← si Flutter Web sur port 8000
    "http://127.0.0.1:50832",
    "http://10.0.2.2:8000",
    "http://192.168.137.243:8000",
    "http://localhost:50832",       # ← pour Android Emulator
]
ALLOWED_HOSTS = ['*']
CORS_ALLOW_ALL_ORIGINS = True
CORS_ALLOW_CREDENTIALS = True
# === DRF ===
REST_FRAMEWORK = {
    'DEFAULT_AUTHENTICATION_CLASSES': [
        'rest_framework_simplejwt.authentication.JWTAuthentication',
    ],
    'DEFAULT_PERMISSION_CLASSES': [
        'rest_framework.permissions.IsAuthenticated',
    ],
    'DEFAULT_PAGINATION_CLASS': 'rest_framework.pagination.PageNumberPagination',
    'PAGE_SIZE': int(os.getenv('PAGE_SIZE', 20)),
    'EXCEPTION_HANDLER': 'rest_framework.views.exception_handler',
    'DEFAULT_FILTER_BACKENDS': ['django_filters.rest_framework.DjangoFilterBackend'],
    'DEFAULT_SCHEMA_CLASS': 'drf_spectacular.openapi.AutoSchema',
}

# === Simple JWT ===
SIMPLE_JWT = {
    'ACCESS_TOKEN_LIFETIME': timedelta(minutes=int(os.getenv('ACCESS_TOKEN_LIFETIME_MIN', 60))),
    'REFRESH_TOKEN_LIFETIME': timedelta(days=int(os.getenv('REFRESH_TOKEN_LIFETIME_DAYS', 1))),
    'ROTATE_REFRESH_TOKENS': True,
    'BLACKLIST_AFTER_ROTATION': True,
}

# === Djoser ===
DJOSER = {
    'LOGIN_FIELD': 'email',
    'USER_CREATE_PASSWORD_RETYPE': True,
    'SERIALIZERS': {
        'user_create': 'api.serializers.RegistrationSerializer',
        'user': 'api.serializers.RegistrationSerializer',
    },
}

# === Channels (WebSocket Layer) ===
CHANNEL_LAYERS = {
    'default': {
        'BACKEND': 'channels_redis.core.RedisChannelLayer' if not DEBUG else 'channels.layers.InMemoryChannelLayer',
        'CONFIG': {
            "hosts": [("127.0.0.1", 6379)],
        } if not DEBUG else {},
    },
}

# === Logging ===
LOGGING = {
    'version': 1,
    'disable_existing_loggers': False,
    'handlers': {
        'file': {
            'level': 'DEBUG',
            'class': 'logging.FileHandler',
            'filename': BASE_DIR / 'debug.log',
        },
    },
    'loggers': {
        'django': {
            'handlers': ['file'],
            'level': 'DEBUG',
            'propagate': True,
        },
    },
}

# === Email ===
EMAIL_BACKEND = 'django.core.mail.backends.smtp.EmailBackend'
EMAIL_HOST = os.getenv('EMAIL_HOST', 'smtp.example.com')
EMAIL_PORT = int(os.getenv('EMAIL_PORT', 587))
EMAIL_USE_TLS = True
EMAIL_HOST_USER = os.getenv('EMAIL_HOST_USER')
EMAIL_HOST_PASSWORD = os.getenv('EMAIL_HOST_PASSWORD')

# === AI model ===
AI_MODEL_PATH = BASE_DIR / 'ai_models' / os.getenv('AI_MODEL_FILE', 'model.h5')

# === Security options for production ===
if not DEBUG:
    SECURE_BROWSER_XSS_FILTER = True
    SECURE_CONTENT_TYPE_NOSNIFF = True
    X_FRAME_OPTIONS = 'DENY'
    CSRF_COOKIE_SECURE = True
    SESSION_COOKIE_SECURE = True

TWILIO_ACCOUNT_SID = os.getenv('TWILIO_ACCOUNT_SID')
TWILIO_AUTH_TOKEN = os.getenv('TWILIO_AUTH_TOKEN')
TWILIO_FROM_NUMBER = os.getenv('TWILIO_FROM_NUMBER')

SPECTACULAR_SETTINGS = {
    'TITLE': 'API Mon Projet',
    'DESCRIPTION': 'Documentation de l\'API pour le backend Django',
    'VERSION': '1.0.0',
    'SERVE_INCLUDE_SCHEMA': False,
    'SWAGGER_UI_DIST': 'SIDECAR',
    'REDOC_DIST': 'SIDECAR',
      'ENUM_NAME_OVERRIDES': {
        'status': 'RefundStatusEnum',
        'status_1': 'OrderStatusEnum',
    },
}

