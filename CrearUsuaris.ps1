Write-Output "Crear un usuari"
$NomUsuari = Read-Host "Nom Usuari -> "
$NomComplet = Read-Host "Nom Complet -> "
$Contasenya = Read-Host "Contasenya -> " -AsSecureString

New-LocalUser $NomUsuari -Password $Contasenya  -Fullname $NomComplet