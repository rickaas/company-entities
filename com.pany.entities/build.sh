#!/bin/bash


#SCRIPT=$(readlink -f $0)
#SCRIPTPATH=$(dirname $SCRIPT)

echo "$@"

if [ "ANT_BUILD" == "$1" ] ; then
	echo ant build
	shift
	ANT_OPTS="-Xss8m -Xmx1024m -server -XX:+UseParallelGC -XX:MaxPermSize=256m" ant -f build.main.external.xml "$@"
	#exit
fi

#./build.sh PACK_STR -I trans/ -I . -i trans/companyentities.str -o ce.aterm

#utils="/home/rlindeman/Documents/TU/strategoxt/git-stuff/dsldi/dist/dist-libdsldi/debug"
# release
utils="/home/rlindeman/Documents/TU/strategoxt/git-stuff/dsldi/dist/dist-libdsldi/release"



# ./build.sh -i ... -o -I ... 
if [ "PACK_STR" == "$1" ] ; then
	echo pack stratego
	shift
	#CLASSPATH="-cp $SCRIPTPATH/../share/strategoxt/strategoxt.jar"
	#JAVA_OPTS="-Xss8m"
	#java $JAVA_OPTS $CLASSPATH run org.strategoxt.strc.pack-stratego-io $@
	$utils/run.sh "MAIN_CLASS" org.strategoxt.strc.pack-stratego-io $@
fi

