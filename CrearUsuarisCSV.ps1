$Path = Read-Host "Path ubicació fitxer csv del usuaris -> "

$Usuaris = Import-Csv -Path $Path 

foreach ($Usuari in $Usuaris) {
    $NomUsuari = $Usuari.usuari
    $NomComplet = $Usuari.'nom complet'
    $Contasenya = ConvertTo-SecureString $Usuari.contrasenya -AsPlainText -Force
    New-LocalUser $NomUsuari -Password $Contasenya  -Fullname $NomComplet
}
