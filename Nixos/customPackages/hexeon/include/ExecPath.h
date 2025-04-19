
#ifndef H_EXEC_PATH_H
#define H_EXEC_PATH_H

#include <unistd.h>
#include <string>

class ExecPath
{
  private:
    static std::string execPath;
  public:
    static void init();
    static std::string get();
};

#endif
