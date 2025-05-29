# Respaldo de Personalización de Ubuntu GNOME

Este repositorio contiene scripts y archivos para respaldar y restaurar la personalización de mi entorno Ubuntu con GNOME. La idea es mantener una copia organizada de configuraciones, temas, extensiones y otros ajustes importantes para facilitar su recuperación o replicación en nuevas instalaciones.

## Archivos principales

- **respaldo.sh**  
  Script que crea una copia de seguridad de configuraciones clave, paquetes instalados, temas, extensiones (incluyendo Dash to Panel), y otros archivos de personalización relevantes.

- **dash-to-panel-respaldo**  
  Archivo JSON exportado manualmente desde la extensión Dash to Panel, que contiene la configuración específica del panel (posición, tamaño, comportamiento, etc.).

## Uso

1. Clonar o descargar este repositorio en la máquina donde deseas hacer o restaurar el respaldo.  
2. Guardar ambos archivos (`respaldo.sh` y `dash-to-panel-respaldo`) juntos en la misma carpeta.  
3. Abrir una terminal y navegar a esa carpeta. Por ejemplo, si están en `~/respaldo-personal`:  
   ```bash
   cd ~/respaldo-personal


4. Dar permisos de ejecución al script (solo la primera vez):
   ```bash
    chmod +x respaldo.sh

5. Ejecutar el script para crear el respaldo:
    ```bash
    ./respaldo.sh
6. El respaldo se guardará en la carpeta `~/mi-respaldo-personalizacion`.

## Referencias
Este proyecto está inspirado en algunas configuraciones y técnicas mostradas en el siguiente video de YouTube:

[![GNOME Customization Ubuntu 22.04 LTS](https://img.youtube.com/vi/hzC_xY7HG5U/0.jpg)](https://www.youtube.com/watch?v=hzC_xY7HG5U&t=584s)

**GNOME Customization Ubuntu 22.04 LTS**

