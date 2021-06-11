# Creación de la estructura de carpetas - Fuera de la uni

# Iniciamos las variables
. ./variables.ps1


Import-Csv .\usuarios.csv | Sort-Object "group" -Unique | ForEach-Object  {

    $GRUPO = $_.group
    
    # Crear carpeta de recursos y usuarios de cada grupo
    New-Item "$RUTA\r-$GRUPO" -Type Directory
    New-Item "$RUTA\u-$GRUPO" -Type Directory

    # Compartir las carpetas
    New-SmbShare -Name "r-$GRUPO" -Path "$RUTA\r-$GRUPO" -FullAccess "$SYSVOL\Usuarios del dominio"
    New-SmbShare -Name "u-$GRUPO" -Path "$RUTA\u-$GRUPO" -FullAccess "$SYSVOL\Usuarios del dominio"

}
