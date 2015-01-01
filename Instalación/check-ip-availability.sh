for IP in 10.39.224.{200..254}; 
    do 
        if ping $IP -c 1 > /dev/null; 
            then echo $IP alive; 
        else echo $IP dead; fi; 
    done
