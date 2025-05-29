#!/bin/bash

# Detectar la carpeta donde está el script
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Crear carpeta de respaldo
mkdir -p ~/mi-respaldo-personalizacion/{conky,hidamari,gnome-extensions}

# 1. Configuraciones de GNOME (incluye gnome-tweaks y extensiones)
dconf dump / > ~/mi-respaldo-personalizacion/dconf-backup.txt

# 2. Temas e iconos
cp -r ~/.themes ~/.icons ~/mi-respaldo-personalizacion/ 2>/dev/null

# 3. Archivos de configuración comunes
cp ~/.bashrc ~/.zshrc ~/.vimrc ~/.gitconfig ~/mi-respaldo-personalizacion/ 2>/dev/null

# 4. Paquetes instalados (apt)
dpkg --get-selections > ~/mi-respaldo-personalizacion/paquetes.txt

# 5. Aplicaciones Flatpak instaladas
flatpak list --app --columns=application > ~/mi-respaldo-personalizacion/flatpak-apps.txt

# 6. Configuración de Hidamari (Flatpak)
cp -r ~/.var/app/io.github.jeffshee.Hidamari/config/hidamari ~/mi-respaldo-personalizacion/hidamari-config 2>/dev/null

# 7. Configuración de Conky
cp -r ~/.conky ~/.config/conky ~/mi-respaldo-personalizacion/conky/ 2>/dev/null

# 8. Archivos .deb usados para Conky (si los tienes en la misma carpeta que el script)
cp "$SCRIPT_DIR/conky-manager-v2.4-amd64.deb" "$SCRIPT_DIR/realpath_8.25-2ubuntu2_all.deb" ~/mi-respaldo-personalizacion/conky/ 2>/dev/null

# 9. Extensiones GNOME personalizadas (ej. Dash to Panel)
cp -r ~/.local/share/gnome-shell/extensions/dash-to-panel@jderose9.github.com ~/mi-respaldo-personalizacion/gnome-extensions/ 2>/dev/null

# 10. Respaldo manual de Dash to Panel exportado por el usuario
cp "$SCRIPT_DIR/dash-to-panel-respaldo" ~/mi-respaldo-personalizacion/dash-to-panel-respaldo 2>/dev/null

echo "✅ Respaldo completado en ~/mi-respaldo-personalizacion"
