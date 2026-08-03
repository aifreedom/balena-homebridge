

# balena-homebridge
 
 **⚠️ He cambiado a usar la [Imagen Oficial de Homebridge para Raspberry Pi](https://github.com/homebridge/homebridge-raspbian-image) ⚠️** A partir del 03-07-2020, es probable que ya no actualice este proyecto. Por favor, abre un issue si deseas asumir el mantenimiento de este proyecto.
 
 balenaCloud application for HomeBridge
 
 [![Build Status](https://travis-ci.com/aifreedom/balena-homebridge.svg?branch=master)](https://travis-ci.com/aifreedom/balena-homebridge)
 [![Known Vulnerabilities](https://snyk.io/test/github/aifreedom/balena-homebridge/badge.svg)](https://snyk.io/test/github/aifreedom/balena-homebridge)
 
 ## Configuración
 
 Puedes configurar un equipo balena-homebridge de forma remota o local. Recomendamos el método remoto, ya que permite gestionar varios dispositivos IoT desde un único panel de control.
 
 ### Configuración remota
 
 1. Crea una cuenta en [balenaCloud](https://dashboard.balena-cloud.com/).
 2. Crea una aplicación en balenaCloud adecuada para tu hardware.
 3. Agrega un dispositivo a tu aplicación siguiendo las instrucciones proporcionadas por balena.
 4. Clona o descarga este repositorio (o un fork del mismo) desde GitHub.
 5. Agrega el repositorio de tu aplicación a tu copia de trabajo de este repositorio.
 6. Una vez que tu dispositivo aparezca en el panel de balena, configúralo:
     1. Opcionalmente, crea una variable de entorno `HOMEKIT_PIN` con el valor de tu elección en el formato `###-##-###` donde _#_ son los dígitos `0-9`, o acepta el valor predeterminado `000-00-000`
     2. Opcionalmente, crea una variable de entorno `HOMEKIT_USER` con el valor de tu elección en el formato `##:##:##:##:##:##` donde _#_ son los dígitos hexadecimales `0-9` o `A-F`, o acepta el valor predeterminado `00:11:22:33:44:55`
     3. Opcionalmente, crea una variable de entorno `KEEP_CONFIG` con el valor `yes` o `no`; si se establece en `yes` (el valor predeterminado si no se especifica), el archivo config.json se conservará entre reinicios de la aplicación; si se establece en `no`, el archivo config.json se sobrescribirá en tu dispositivo cada vez que se reinicie la aplicación.
     4. Opcionalmente, crea una variable de entorno `CONFIG_URL` con una URL desde la cual se pueda descargar el archivo config.json deseado, o acepta el valor predeterminado de una cadena vacía, lo cual evita que se intente la descarga.
 7. Sube (push) el contenido de tu repositorio a balenaCloud para completar la instalación y configuración inicial de tu dispositivo Homebridge.
 
 ### Configuración local
 
 TBD
