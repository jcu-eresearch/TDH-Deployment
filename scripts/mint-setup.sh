if [ -z  $INSTITUTIONAL_BUILD_DIR  ]
then
     echo "INSTITUTIONAL_BUILD_DIR environment variable not set..."
     exit 1
else

   if [ -e  $INSTITUTIONAL_BUILD_DIR/.project-home ]
   then
        PROJECT_DIR=`cat $INSTITUTIONAL_BUILD_DIR/.project-home`
   else
        pushd $INSTITUTIONAL_BUILD_DIR
        mvn clean
        popd
       if [ -e  $INSTITUTIONAL_BUILD_DIR/.project-home ]
       then
            PROJECT_DIR=`cat $INSTITUTIONAL_BUILD_DIR/.project-home`
       else
            echo "Could not determine the project.home directory"
            exit 1
       fi
   fi
fi
