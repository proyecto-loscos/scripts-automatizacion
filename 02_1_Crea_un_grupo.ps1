# Creación de un grupo - Fuera de la uni

# Parámetros:

# 1. Nombre del grupo
param([string]$GRUPO)

# Iniciamos las variables
. ./variables.ps1

# Creamos el grupo en Active Directory
New-ADGroup -Name $GRUPO global -Path "OU=FUERADELAUNI,$DOMINIO"

# Asignamos permisos en la carpeta de cada grupo

icacls "$RUTA\r-$GRUPO" /grant "$GRUPO"":(OI)(CI)(RX)" 
icacls "$RUTA\r-$GRUPO" /grant "$GRUPO"":(OI)(CI)(RX)"