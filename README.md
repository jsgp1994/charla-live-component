# Proyecto de Demostración con Symfony y Live Components

Este es un proyecto de demostración desarrollado con Symfony que utiliza componentes Live para crear una experiencia de usuario interactiva y dinámica. La aplicación está completamente containerizada con Docker para facilitar su configuración y despliegue.

## Requisitos Previos

Asegúrate de tener instaladas las siguientes herramientas en tu sistema:

-   Docker
-   Docker Compose

## Pasos para la Instalación

Sigue estos pasos para configurar el entorno de desarrollo local:

1.  **Clonar el Repositorio**
    ```bash
    git clone <URL_DEL_REPOSITORIO>
    cd <NOMBRE_DEL_DIRECTORIO>
    ```

2.  **Crear el Archivo de Entorno**
    Copia el archivo de entorno de desarrollo para crear tu configuración local.
    ```bash
    cp .env.dev .env
    ```

3.  **Construir las Imágenes de Docker**
    Este comando construirá las imágenes necesarias para los servicios de la aplicación.
    ```bash
    make build
    ```

4.  **Instalar Dependencias de Composer**
    Instala todas las dependencias de PHP necesarias para el proyecto.
    ```bash
    make composer-install
    ```

5.  **Instalar Dependencias de Frontend**
    Instala las dependencias de JavaScript usando Yarn.
    ```bash
    docker compose run --rm php yarn install
    ```

6.  **Levantar los Contenedores**
    Inicia todos los servicios de la aplicación en segundo plano.
    ```bash
    make up
    ```

7.  **Ejecutar las Migraciones de la Base de Datos**
    Crea la base de datos (si no existe) y aplica todas las migraciones pendientes.
    ```bash
    make migrate
    ```

¡Y eso es todo! La aplicación debería estar funcionando.

## Uso

-   **Iniciar la aplicación**: `make up`
-   **Acceder a la aplicación**: Abre tu navegador y visita [http://localhost:8080](http://localhost:8080)
-   **Detener la aplicación**: `make down`

## Comandos Útiles del Makefile

-   `make build`: Construye o reconstruye las imágenes de Docker.
-   `make up`: Inicia los contenedores de la aplicación.
-   `make down`: Detiene los contenedores de la aplicación.
-   `make logs`: Muestra los logs en tiempo real de los servicios.
-   `make bash-php`: Inicia una sesión de shell (`bash`) dentro del contenedor de PHP, útil para ejecutar comandos de Symfony (`bin/console`), Composer, etc.
-   `make composer-install`: Ejecuta `composer install` en el contenedor de PHP.
-   `make migrate`: Aplica las migraciones de Doctrine a la base de datos.


### Documentación

-   [alert_controller_documentation.md](Docs/alert_controller_documentation.md)
