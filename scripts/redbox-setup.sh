
if [ -z $REDBOX_DEPLOY_SETUP_DONE ]
then
    exit 1
fi

SETTINGS_DIR=~/.tdh-deploy-settings
SETTINGS_NAME=redbox-settings.sh
SETTINGS=$SETTINGS_DIR/$SETTINGS_NAME

if [ ! -e "$SETTINGS" ]
then
    echo "Creating ReDBoX Deployment Settings..."
    mkdir -p $SETTINGS_DIR
    echo cp $SCRIPT_DIR/$SETTINGS_NAME $SETTINGS
    cp $SCRIPT_DIR/$SETTINGS_NAME $SETTINGS
fi

echo "Settings File: $SETTINGS"
source $SETTINGS
echo "Project Directory: $PROJECT_HOME"

if [ -z $PROJECT_HOME ]
then
    echo "PROJECT_HOME variable not set"
    exit 2
fi
REDBOX_DEPLOY_SETUP_DONE=1
