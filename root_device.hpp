#ifndef ROOT_DEVICE_H
#define ROOT_DEVICE_H

#include <stdio.h>
#include <iostream>
#include <vector>
#include <sys/stat.h>
#include <string.h>
#include <libgen.h>

using namespace std;
#define SCRIPT_COMMAND_SIZE 512
#define ORS_TMP "/tmp/ors_tmp"
class root_device {
	public:
		root_device() { };
		~root_device() { };

              //install supersu from /recovery
              int install_supersu();


              //disable restore recovery from stock ROM
             int un_of_recovery();

             //remove supersu functions 
           int remove_supersu();

              //signature_check function
              //int signature_check(char* cmd);
             //int check_sig(); // return 0, or 1 

            //run ors in sdcard | external_sd 
            int check_for_script_file(const char* ors_boot_script);
            int run_ors_script(const char* ors_script);

            //return true if the path exists
	    static bool Path_Exists(string path);
            
	    //execute a command and return teh result as a string by reference
	    static int Exec_Cmd(string cmd, string &result);

        private:
            //write fstab info to /etc/fstab
             static void write_fstab_root(char *path, FILE *file);
             //create_fstab
             static void create_fstab();
             //check bml partition
             static int bml_check_volume(const char *path);

	     //settings.ini 
	     string ini_files;
	     void set_ini_files(string ini);
        public:
             static void process_volumes();

	     //load settings.ini 
	      int load_def_settings();

	    

	   
};
#endif
