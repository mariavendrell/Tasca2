#Demanar dades del nou usuari
Write-Output "Crear un usuari"
$NomUsuari = Read-Host "Nom Usuari -> "
$Contasenya = Read-Host "Contasenya -> " -AsSecureString

#Crem el nou usuari
New-ADUser -Name $NomUsuari -Accountpassword $Contasenya -Enabled $true