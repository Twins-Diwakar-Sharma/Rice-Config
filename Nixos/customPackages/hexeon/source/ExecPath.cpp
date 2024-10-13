#include "ExecPath.h"

std::string ExecPath::execPath = "";

void ExecPath::init()
{
  char buffer[512];
  size_t sz = readlink("/proc/self/exe", buffer, 512);
  std::string fullPath = std::string(buffer);
  int i = fullPath.size()-1;
  for(; i>=0 ; i--)
  {
    if(fullPath[i] == '/')
      break;
  }
  for(int j=0; j<i; j++)
  {
    ExecPath::execPath += fullPath[j];
  }
}

std::string ExecPath::get()
{
  return ExecPath::execPath;
}
