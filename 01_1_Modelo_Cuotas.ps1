# Creación de modelos de cuotas - Fuera de la uni

# Establecemos dos avisos, al 75% y al 90%
$LIMITE = New-FSRMQuotaThreshold -Percentage 75
$LIMITE2 = New-FSRMQuotaThreshold -Percentage 90

# Creamos las plantillas dos plantillas: una para usuarios y otra para recursos. Aplicamos los avisos.
New-FsrmQuotaTemplate -Name "Recursos" -Size 1GB -Threshold $LIMITE,$LIMITE2 -SoftLimit
New-FsrmQuotaTemplate -Name "Usuarios" -Size 500MB -Threshold $LIMITE,$LIMITE2 -SoftLimit