// ---------------------------------------------------------------------
// AUTOMATIC CREATED GNU-C++ FILE - TESTET WITH: g++ -std=c++17
//
// diss.cc - (c) 2022 by Jens Kallup - paule32
//           all rights reserved.
// ---------------------------------------------------------------------

// ---------------------------------------------------------------------
// standard c header
// ---------------------------------------------------------------------
# include <stdio.h>
# include <stdlib.h>
# include <string.h>
# include <stdint.h>

// ---------------------------------------------------------------------
// c++ header
// ---------------------------------------------------------------------
# include <iostream>
# include <vector>
# include <map>
# include <sstream>
# include <exception>

// ---------------------------------------------------------------------
// AsmJit
// ---------------------------------------------------------------------
# include "../x86.h"

// ---------------------------------------------------------------------
// namespace placeholder.
// ---------------------------------------------------------------------
using namespace asmjit;
using namespace x86;
using namespace std;

class TemplateDebug {
private:
    StringLogger _sl;    // code holder log
    JitRuntime   _rt;    // base
    CodeHolder   _ch;    // Assembler/Compiler code
    Assembler    _as;    // Assembler
    Compiler     _cc;    // Compiler
    Builder      _cb;    // Builder
    std::string  _fn;    // output file name
    int          _io;    // output handle
public:
    TemplateDebug(std::string fileName);
    TemplateDebug(int ioHandle);
    TemplateDebug(void);
   ~TemplateDebug();
};

