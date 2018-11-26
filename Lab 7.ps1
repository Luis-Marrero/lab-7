$x = 0
Set-location C:\
while ($x -eq 0){
    $y = read-host 'Do you want to exit? (y or n)'

        if($y -eq 'y'){
            $x = 1
        }

        else{ 
        $servers = Import-Csv serverlist.csv

            foreach($server in $servers.name){
               Start-job -scriptblock {test-connection -Computername $server -quiet} -
            }
            Get-job
 
        }
      
}

#ping servers as a job using the serverl list file instead of making processes