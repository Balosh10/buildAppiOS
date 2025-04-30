#!/bin/bash

# CONFIGURA ESTOS VALORES
SCHEME="NombreDelEsquema"
WORKSPACE_PATH="/ruta/a/TuProyecto.xcworkspace"
APP_NAME="TuApp"
BUILD_PATH="./build"
BUNDLE_IDENTIFIER="com.ejemplo.TuApp"  # Opcional

# OBTENER UDID DEL DISPOSITIVO FÍSICO CONECTADO
UDID=$(xcrun xctrace list devices | grep -m 1 'iPhone' | sed -E 's/.*\[(.*)\].*/\1/')

if [ -z "$UDID" ]; then
    echo "❌ No se encontró un dispositivo físico conectado."
    exit 1
fi

echo "📱 Usando dispositivo con UDID: $UDID"

# COMPILAR APP
echo "⚙️ Compilando app desde el workspace..."
xcodebuild \
  -scheme "$SCHEME" \
  -workspace "$WORKSPACE_PATH" \
  -destination "id=$UDID" \
  -configuration Debug \
  -derivedDataPath "$BUILD_PATH" \
  clean build || {
    echo "❌ Falló la compilación"
    exit 1
}

# ENCONTRAR APP COMPILADA
APP_PATH=$(find "$BUILD_PATH" -name "$APP_NAME.app" | head -n 1)

if [ ! -d "$APP_PATH" ]; then
    echo "❌ No se encontró el archivo .app compilado"
    exit 1
fi

echo "📦 App compilada en: $APP_PATH"

# INSTALAR EN DISPOSITIVO FÍSICO
echo "📲 Instalando app en el dispositivo..."
ios-deploy --justlaunch --debug --bundle "$APP_PATH" || {
    echo "❌ Falló la instalación con ios-deploy"
    exit 1
}

echo "✅ App instalada y ejecutándose en el iPhone"
