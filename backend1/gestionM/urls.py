from django.contrib import admin
from django.urls import path, include
from django.views.generic import TemplateView
from django.conf import settings
from django.conf.urls.static import static
from drf_spectacular.views import SpectacularAPIView, SpectacularSwaggerView, SpectacularRedocView


urlpatterns = [
    # Accueil (UI)
    path('', TemplateView.as_view(template_name='accueil.html'), name='home'),
    path('dashboard-ui/', TemplateView.as_view(template_name='dashboard.html'), name='dashboard-ui'),

    # Administration
    path('admin/', admin.site.urls),

    # API REST principale
    path('api/', include('api.urls')),

    # Authentification (Djoser + JWT)
    path('auth/', include([
        path('', include('djoser.urls')),
        path('', include('djoser.urls.jwt')),
    ])),

    # Endpoint de prédiction IA
  

    # Documentation OpenAPI
    path('api/schema/', SpectacularAPIView.as_view(), name='schema'),
    path('api/docs/swagger/', SpectacularSwaggerView.as_view(url_name='schema'), name='swagger-ui'),
    path('api/docs/redoc/', SpectacularRedocView.as_view(url_name='schema'), name='redoc'),
]

# Gestion des fichiers statiques et médias en debug
if settings.DEBUG:
    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
    urlpatterns += static(settings.STATIC_URL, document_root=settings.STATIC_ROOT)
