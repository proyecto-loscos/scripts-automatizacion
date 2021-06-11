# Creación automática de grupos - Fuera de la uni

Import-Csv .\usuarios.csv | Sort-Object "group" -Unique | ForEach-Object  {

    $GRUPO = $_.group

    .\02_1_Crea_un_grupo.ps1 $GRUPO

}