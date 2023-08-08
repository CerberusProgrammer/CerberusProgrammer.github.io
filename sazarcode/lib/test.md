# Fast API create\n\n
1. Abre una terminal y navega al directorio donde deseas crear tu proyecto de Django.\n
2. Crea un nuevo proyecto de Django ejecutando el comando **`django-admin startproject hello_world_project`**, donde **`hello_world_project`** es el nombre de tu proyecto.\n
3. Navega al directorio del proyecto ejecutando el comando **`cd hello_world_project`**.\n
4. Crea una nueva aplicación dentro de tu proyecto ejecutando el comando **`python manage.py startapp myapp`**, donde **`myapp`** es el nombre de tu aplicación.\n
5. Abre el archivo **`views.py`** que se encuentra dentro del directorio de tu nueva aplicación (**`myapp/views.py`**) y agrega el siguiente código:\n\n
    ```python
    from django.http import JsonResponse
    
    def hello_world(request):
        return JsonResponse({'message': 'Hello World'})
    ```
\n\n
6. Abre el archivo **`urls.py`** que se encuentra en el directorio del proyecto (**`hello_world_project/urls.py`**) y agrega la siguiente línea al principio del archivo para importar la vista que acabas de crear:\n\n

    ```python
    from myapp.views import hello_world
    ```

\n\n7. Agrega una nueva URL a la lista **`urlpatterns`** en el mismo archivo **`urls.py`** para asociar la vista con una URL:\n\n

    ```python
    path('hello-world/', hello_world),
    ```
\n\n 
8. Inicia el servidor de desarrollo de Django ejecutando el comando **`python manage.py runserver`**.\n
9. Abre un navegador web y navega a la URL **`http://localhost:8000/hello-world/`**. Deberías ver un mensaje JSON que dice “Hello World”.