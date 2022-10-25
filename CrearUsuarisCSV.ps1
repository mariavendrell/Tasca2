$Path = Read-Host "Path ubicació fitxer csv del usuaris -> "
$Usuaris=Import-Csv -Path $Path
New-LocalUser $NomUsuari -Password $Contasenya  -Fullname $NomComplet