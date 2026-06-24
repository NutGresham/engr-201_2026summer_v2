#pragma once

#include "SdFat.h"

inline SdFs sd;
inline FsFile myFile;

inline bool create_and_open_file(FsFile *dataFile2, const String& filename_preamble) {
	sd.chdir(); // change to root ("/")

	char filename[40] ;
	int fileNumber = 1;

	do {
		// We use .c_str() here because snprintf expects a const char*
		snprintf(filename, sizeof(filename),
				 "%s%03d.csv",
				 filename_preamble.c_str(),
				 fileNumber);
		fileNumber++;
	} while (sd.exists(filename) && fileNumber <= 999);

	if (fileNumber > 999) {
		Serial.println("[ERROR] Maximum file number exceeded (999).");
		return false;
	}

	Serial.print("[INFO] Creating file: ");
	Serial.println(filename);

	*dataFile2 = sd.open(filename, FILE_WRITE);

	if (!*dataFile2) {
		Serial.println("[ERROR] could not create file.");
		return false;
	}

	return true;
} // end create_and_open_file()