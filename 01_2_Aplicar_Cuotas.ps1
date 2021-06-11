# Aplicación de cuotas para la estructura de carpetas - Fuera de la uni

# Iniciamos las variables
. ./variables.ps1


Import-Csv .\usuarios.csv | Sort-Object "group" -Unique | ForEach-Object  {

    $GRUPO = $_.group

    # Aplicamos la plantilla recursos para las carpetas de recursos
    New-Fsrmquota -Path "$RUTA\r-$GRUPO" -Template "Recursos"
    # Aplicamos la plantilla usuarios para las carpetas de usuarios
    New-FSRMAutoQuota -Path "$RUTA\u-$GRUPO" -Template "Usuarios"

}
