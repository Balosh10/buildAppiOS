#!/bin/bash

# 🚀 Configura estas variables
PROJECT_NAME="TuProyecto"           # sin la extensión .xcodeproj
SCHEME_NAME="TuEsquema"             # nombre del esquema configurado en Xcode
CONFIGURATION="Debug"               # Debug o Release

# Ruta donde se generará el .app
BUILD_DIR="./build"

echo "📦 Compilando $PROJECT_NAME con esquema $SCHEME_NAME..."

xcodebuild \
  -project "$PROJECT_NAME.xcodeproj" \
  -scheme "$SCHEME_NAME" \
  -configuration "$CONFIGURATION" \
  -sdk iphoneos \
  BUILD_DIR="$BUILD_DIR" \
  clean build

# Ruta esperada del archivo .app
APP_PATH="$BUILD_DIR/$CONFIGURATION-iphoneos/$SCHEME_NAME.app"

if [ -d "$APP_PATH" ]; then
  echo "✅ App generada en: $APP_PATH"
else
  echo "❌ Error: No se encontró el .app en $APP_PATH"
fi

#ios-deploy --id <UDID> --bundle build/Build/Products/Debug-iphoneos/TuApp.app --justlaunch --debug
