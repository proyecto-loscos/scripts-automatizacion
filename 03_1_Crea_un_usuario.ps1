# Creación de un grupo - Fuera de la uni

# Parámetros:

    # 1. Nombre de usuario
    # 2. Grupo
    # 3. Nombre
    # 4. Apellido
    # 5. Contraseña

param(
    [string]$USERNAME,
    [string]$GROUP,
    [string]$NAME,
    [string]$SURNAME,
    [string]$PASS
)

# Iniciamos las variables
. ./variables.ps1

# Creamos su carpeta personal

New-Item "$RUTA\u-$GROUP\$USERNAME" -Type Directory

# Creamos el usuario en Active Directory

New-ADUser -Name $USERNAME `
-GivenName "$NAME $SURNAME" `
-AccountPassword (ConvertTo-SecureString $PASS -AsPlainText -Force) `
-Path "OU=FUERADELAUNI,$DOMINIO" `
-Enabled $True `
-HomeDirectory "\\$SERVER\r-$GROUP\$USERNAME" `
-HomeDrive "Z:"

# Añadimos al usuario en su grupo
$GRUPO = Get-ADGroup "CN=$GROUP,OU=FUERADELAUNI,$DOMINIO"
$USUARIO = Get-ADUser "CN=$USERNAME,OU=FUERADELAUNI,$DOMINIO"
Add-ADGroupMember $GRUPO -Members $USUARIO

# Asignamos los permisos en su carpeta personal

icacls "$RUTA\u-$GROUP\$USERNAME" /Grant $USERNAME":RXW"
icacls "$RUTA\u-$GROUP\$USERNAME" /Grant $USERNAME":(IO)(OI)(CI)(F)"
