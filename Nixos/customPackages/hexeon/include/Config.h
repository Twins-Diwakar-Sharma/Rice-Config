#ifndef H_C0NFI6_H
#define H_C0NFI6_H

#include <fstream>
#include <iostream>
#include <string>
#include "allgl.h"
#include "Color.h"
#include <sstream>
#include <map>
#include <math.h>
#include "ExecPath.h"

class Config
{
    private:
        std::ifstream configFile;
        bool pathExists = true;
        std::map<std::string,Color> colorMap;
        void hdr(Color&);
        void attainValues();
        int iconState=1;
    public:
        Config();
        ~Config();
        std::map<std::string,Color>& getValues();
        bool failedLoading();
        int getIconState();
};

#endif
