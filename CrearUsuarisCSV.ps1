#Recolllir fitxer
$Path = Read-Host "Path ubicació fitxer csv del usuaris -> "

#Importar informació del csv
$Usuaris = Import-Csv -Path $Path 

#Insertar cada usuari del csv
foreach ($Usuari in $Usuaris) {
    $NomUsuari = $Usuari.usuari
    $Contasenya = ConvertTo-SecureString $Usuari.contrasenya -AsPlainText -Force
    New-ADUser -Name $NomUsuari -Accountpassword $Contasenya -Enabled $true
}
