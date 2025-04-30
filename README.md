# buildAppiOS
1. Abre la terminal en tu Mac.

2. Crea el archivo del script:
Usa el comando touch para crear el archivo build_and_deploy_workspace.sh:
touch build_and_deploy_workspace.sh

3. Edita el archivo del script:
Puedes usar cualquier editor de texto en la terminal, como nano o vi. Aquí te muestro cómo con nano:
nano build_and_deploy_workspace.sh

✅ Cómo usarlo:
Reemplaza los valores de:

SCHEME="..." → tu esquema

WORKSPACE_PATH="..." → ruta absoluta o relativa a tu .xcworkspace

APP_NAME="..." → nombre exacto del archivo .app que genera Xcode

Hazlo ejecutable:
chmod +x build_and_deploy_workspace.sh

Ejecútalo:
./build_and_deploy_workspace.sh
