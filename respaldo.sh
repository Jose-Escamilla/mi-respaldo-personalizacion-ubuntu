#!/bin/bash

# Detectar la carpeta donde está el script
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Crear carpeta de respaldo
mkdir -p ~/mi-respaldo-personalizacion/{conky,hidamari,gnome-extensions,themes}

# 1. Configuraciones de GNOME (incluye gnome-tweaks y extensiones)
dconf dump / > ~/mi-respaldo-personalizacion/dconf-backup.txt

# 2. Temas e iconos
cp -r ~/.themes ~/.icons ~/mi-respaldo-personalizacion/ 2>/dev/null

# 2.1 Tema Dracula (si existe)
if [ -d "$HOME/.themes/Dracula" ]; then
  echo "🎨 Respaldando tema Dracula..."
  cp -r ~/.themes/Dracula ~/mi-respaldo-personalizacion/themes/
fi

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

# 9. Configuración de Dash to Dock (si existe)
if dconf list /org/gnome/shell/extensions/dash-to-dock/ &>/dev/null; then
  echo "🧩 Respaldando configuración de Dash to Dock..."
  dconf dump /org/gnome/shell/extensions/dash-to-dock/ > ~/mi-respaldo-personalizacion/dash-to-dock.conf
fi

# 10. Configuración de Dynamic Panel Transparency (si existe)
if dconf list /org/gnome/shell/extensions/dynamic-panel-transparency/ &>/dev/null; then
  echo "🧩 Respaldando configuración de Dynamic Panel Transparency..."
  dconf dump /org/gnome/shell/extensions/dynamic-panel-transparency/ > ~/mi-respaldo-personalizacion/dynamic-panel-transparency.conf
fi

echo "✅ Respaldo completado en ~/mi-respaldo-personalizacion"
