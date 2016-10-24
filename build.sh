CURRENT_DIR=`readlink -f .`

echo "CURRENT_DIR = " $CURRENT_DIR

TARGET_DIR=$CURRENT_DIR/bin

rm -rf $TARGET_DIR

mkdir $TARGET_DIR

echo "TARGET_DIR = " $TARGET_DIR

cd src

echo "Building src..."

cc -o $TARGET_DIR/UUGearDaemon UUGearDaemon.c serial.c -lrt -lpthread
cc -o $TARGET_DIR/UUGear.o -c -Wall -Werror -fPIC UUGear.c
cc -shared -o $TARGET_DIR/libUUGear.so $TARGET_DIR/UUGear.o -lrt
cc -o $TARGET_DIR/SocketBroker SocketBroker.c UUGear.c -lrt

cc -o $TARGET_DIR/lsuu lsuu.c serial.c

echo "Copying shared object file to /usr/lib/..."

sudo cp $TARGET_DIR/libUUGear.so /usr/lib/

echo "Building Current Project in C..."

PROJECT_DIR=$CURRENT_DIR/project_src

cd $PROJECT_DIR

cc -L$TARGET_DIR -Wall DigitalReadWrite.c -o $TARGET_DIR/DigitalReadWrite -lUUGear -lrt

cd $CURRENT_DIR

echo "Build End"
