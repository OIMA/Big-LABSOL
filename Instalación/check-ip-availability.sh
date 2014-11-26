#Este script nos sirve para visualizar un rango de ips disponibles para nuestro cluster

for IP in 192.168.1.{1..10}; 
    do 
        if ping $IP -c 1 > /dev/null; 
            then echo $IP alive; 
        else echo $IP dead; fi; 
    done


#scrolling="no"
#frame-border="0"
#border="0"