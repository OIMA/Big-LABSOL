#!bin/bash
export JAVA_LINK="http://download.oracle.com/otn-pub/java/jdk/7u71-b14/jdk-7u71-linux-x64.tar.gz"

#This will check if any JDK is installed

if java; then
    echo found java executable in PATH
    _java=java

elif [[ -n "$JAVA_HOME" ]] && [[ -x "$JAVA_HOME/bin/java" ]];  then
    echo found java executable in JAVA_HOME
    _java="$JAVA_HOME/bin/java"
    
else
    echo No Java version founded
    if [ -d /usr/java ]; then
	
	echo Found directory

    else
	sudo mkdir /usr/java
    fi
#Here goes the location of java
    sudo tar -xzvf /usr/java/jdk-7u71-linux-x64.tar.gz
    sudo ln -s /usr/java/jdk1.7.0_71 /usr/java/default
    export JAVA_HOME=/usr/java/default
    export PATH=$JAVA_HOME/bin:$PATH
    
fi

if [[ "$_java" ]]; then
    version=$("$_java" -version 2>&1 | awk -F '"' '/version/ {print $2}')
    echo version "$version"
    if [[ "$version" > "1.7" ]]; then
	echo Done
    else

	echo Version menor a 1.7

    fi

fi
	
	   
exit 0
