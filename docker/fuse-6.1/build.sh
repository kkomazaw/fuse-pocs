#!/bin/sh

[ -z $FUSE_INSTALLERS ] && export FUSE_INSTALLERS="${HOME}/opt/fuse_installers"
[ ! -d $FUSE_INSTALLERS ] && mkdir $FUSE_INSTALLERS
export FUSE_INSTALLER="${FUSE_INSTALLERS}/jboss-fuse-full-6.1.0.redhat-379.zip"

if [ ! -e $FUSE_INSTALLER ]
then
    echo "Can't find Fuse 6.1 installer: $FUSE_INSTALLER"
    exit 1
fi

rm -rf target
mkdir target

unzip $FUSE_INSTALLER -d target/

docker build -t fuse/6.1 .


echo '=================================================================================================='
echo 'Successfully created Fuse 6.1 Docker image.'
echo 'You can execute "docker run -d -t fuse/6.1" to start new Fuse server daemon in the background or'
echo '"docker run -it fuse/6.1 fuse" to start new Fuse server in the interactive mode (shell).'
echo '=================================================================================================='