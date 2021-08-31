# Get the name and type of every node in the management group.
import-module activedirectory
$computers = Get-ADComputer -Filter *

foreach ($c in $computers) {
    $os = Get-CimInstance -ClassName Win32_OperatingSystem -ComputerName $c

    switch ($os.ProductType) {
        1 { $type = 'Workstation' }
        2 { $type = 'Domain Controller'}
        3 { $type = 'Server'}
        Default { $type = 'unknown' }
    }
    
    "$($c.name) is a ($type)."

}
