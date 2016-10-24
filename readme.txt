This program flashes the led on the Arduino 5 times which is connected to pin 13 and it reads the value from pin 9.

To build the program:
Type in the terminal:
 	chmod +x build.sh
	./build.sh

“Build End” should then be displayed in the terminal

Type in the terminal:
	cd bin/
	./lsuu

Take note of the 8 digits (including hyphen) that are found after Arduino
These digits are the permanent unique device ID of the Arduino

Type in the terminal:
	cd ../project_src

Open the DigitalReadWrite.c file
Edit the attachUUGearDevice function call to include the unique device ID found earlier
Save file

Type in terminal:
	cd ..
	./build.sh
	cd bin/
	./DigitalReadWrite

The program will now run and display the status on pin 9 and the led on the Arduino (pin 13) will flash 5 times

If building an independent project:
	The build.sh file needs to be provided with the C source file name under the “Building Current Project in C…” section.
