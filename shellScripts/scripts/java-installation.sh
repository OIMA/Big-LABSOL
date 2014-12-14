#!bin/bash

#This will check if any JDK is installed

if hash java 2>/dev/null; then
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

    export RESUORCES=$(pwd)
    cd $RESUORCES
    cd ..
    sudo cp -v resources/jdk-7u71-linux-x64.tar.gz /usr/java
    sudo tar -xzvf /usr/java/jdk-7u71-linux-x64.tar.gz
    sudo mv jdk1.7.0_71 /usr/java
    sudo ln -s /usr/java/jdk1.7.0_71 /usr/java/default
    export JAVA_HOME=/usr/java/default
    echo $JAVA_HOME
    export PATH=$JAVA_HOME/bin:$PATH
    
fi

if [[ "$_java" ]]; then
    version=$("$_java" -version 2>&1 | awk -F '"' '/version/ {print $2}')
    echo version "$version"
    if [[ "$version" > "1.7" ]]; then
	echo Done
    else

	yum remove {java-1.*}

	sudo find / -name java -exec rm -rf {} \;

	sudo mkdir /usr/java

	export RESURCES=$(pwd)
	cd $RESURCES
	cd ..
	sudo cp -v resources/jdk-7u71-linux-x64.tar.gz /usr/java
	sudo tar xzvf /usr/java/jdk-7u71-linux-x64.tar.gz
	sudo ln -s /usr/java/jdk1.7.0_71 /usr/java/default
	export JAVA_HOME=/usr/java/default
        echo $JAVA_HOME
	export PATH=$JAVA_HOME/bin:$PATH
        echo $PATH
	

    fi

fi
