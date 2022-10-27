#Opcions
Write-Output "Que vols fer?"
Write-Output "  1.Saber quants usuaris hi ha al sistema"
Write-Output "  2.Usuaris creats recenment"
Write-Output "  3.Usuaris que no van canviar la contrasenya"
Write-Output "  4.Usuaris inactius (recomendació accions)"


$opcio = Read-Host " -> "

switch ($opcio) {
    1 {
        $total = (Get-ADUser -Filter * | Select-Object Name).count
        Write-Output "Hi ha $total usuaris a aquest domini"
    }
    2 {
        $Days = 10
        $Time = (Get-Date).Adddays(-($Days))
        Get-ADUser -Filter * -Property whenCreated | Where {$_.whenCreated -gt $Time} | ft Name, whenCreated
    }
    3 {
        $Days = 90
        $Time = [DateTime]::Today.AddDays(-$Days)
        Get-ADUser -Filter '(PasswordLastSet -lt $Time)' -Properties PasswordLastSet | ft Name,PasswordLastSet
    }
    4 {
        $Days = 30
        $Time = [DateTime]::Today.AddDays(-$Days)
        Get-ADUser -Filter '(LastLogonTimeStamp -lt $Time)' -Properties LastLogonTimeStamp | ft Name, LastLogonDate

        $Days = 90
        $Time = [DateTime]::Today.AddDays(-$Days)
        if ( (Get-ADUser -Filter '(LastLogonTimeStamp -lt $Time)') ) {
            Write-Output "Seria recomanable esborrar aquests usuaris:"
            Get-ADUser -Filter '(LastLogonTimeStamp -lt $Time)' -Properties LastLogonTimeStamp | ft Name
        }
    }
}





