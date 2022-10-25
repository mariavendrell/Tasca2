#Opcions
Write-Output "Que vols fer?"
Write-Output "  1.Saber quants usuaris hi ha al sistema"
Write-Output "  2.Usuaris creats recenment"
Write-Output "  3.Usuaris que no van canviar la contrasenya"
Write-Output "  4.Usuaris inactius (recomendació accions)"


$opcio = Read-Host " -> "

switch ($opcio) {
    1 {
        (Get-LocalUser | Select-Object Name).count
    }
    2 {
        $Days = 10
        $Time = (Get-Date).Adddays(-($Days))
        Get-ADUser -Filter * -Property whenCreated | Where {$_.whenCreated -gt $Time} | ft Name, whenCreated
    }
    3 {
        $Days = 10
        $Time = (Get-Date).Adddays(-($Days))
        Get-ADUser -Filter * -Property whenCreated | Where {$_.whenCreated -gt $Time} | ft Name, WhenCreated
    }
    4 {
        $Days = 10
        $Time = (Get-Date).Adddays(-($Days))
        Get-ADUser -Filter {LastLogonTimeStamp -lt $Time} -Properties * | Select Name, LastLogonDate

        if ( (Get-ADUser| Select LastLogonTimeStamp) -lt 300 ) {
            Write-Output "Seria recomanable esborrar aquests usuaris:"
            $Days = 300
            $Time = (Get-Date).Adddays(-($Days))
            Get-ADUser -Filter {LastLogonTimeStamp -lt $Time} -Properties * | Select Name, LastLogonDate
        }
    }
}





