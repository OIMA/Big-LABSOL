#!bin/bash
export DIRECTORY="/usr/java"
export JAVA_LINK="http://download.oracle.com/otn-pub/java/jdk/7u71-b14/jdk-7u71-linux-x64.tar.gz"

#This will check if any JDK is installed

if type -p java; then
    echo found java executable in PATH
    _java=java

elif [[ -n "$JAVA_HOME" ]] && [[ -x "$JAVA_HOME/bin/java" ]];  then
    echo found java executable in JAVA_HOME
    _java="$JAVA_HOME/bin/java"
    
else
    echo No Java version founded
    if [! -d "$DIRECTORY"]; then
	mkdir /usr/java
    fi
    wget -P /usr/java --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" "$JAVA_LINK"
    tar xvzf /usr/java jdk-7u71-linux-x64.tar.gz
    ln -s /usr/java/jdk1.7.0_71 /usr/java/default
    export JAVA_HOME=/usr/java/default
    export PATH=$JAVA_HOME/bin:$PATH
    
fi

if [[ "$_java" ]]; then
    version=$("$_java" -version 2>&1 | awk -F '"' '/version/ {print $2}')
    echo version "$version"
    if [[ "$version" > "1.7" ]]; then
	echo Done
    else

	rpm -qa | grep java
	yum remove {java-1*}

	if [! which java]; then
	    if [! -d "$DIRECTORY"]; then
		mkdir /usr/java
	    fi
	    wget -P /usr/java --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" "$JAVA_LINK"
	    tar xvzf /usr/java jdk-7u71-linux-x64.tar.gz
	    ln -s /usr/java/jdk1.7.0_71 /usr/java/default
	    export JAVA_HOME=/usr/java/default
	    export PATH=$JAVA_HOME/bin:$PATH
	    
	else
	    echo Script not Working
    fi
fi
