# Creación automática de usuarios - Fuera de la uni

Import-Csv .\usuarios.csv | ForEach-Object  {

    $USERNAME = $_.USERNAME
    $GROUP = $_. GROUP
    $NAME = $_.NAME
    $SURNAME = $_.SURNAME
    $PASS = $_.PASS

    .\03_1_Crea_un_usuario.ps1 $USERNAME $GROUP $NAME $SURNAME $PASS

}