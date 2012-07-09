QT       += core gui

TARGET = qling
TEMPLATE = app
LLVM_INSTALL=$$(LLVM_INSTALL)
isEmpty(LLVM_INSTALL):error(The environment variable LLVM_INSTALL has to be defined!)
!exists($${LLVM_INSTALL}/bin/llvm-config):error($${LLVM_INSTALL}/bin/llvm-config not found!)


#DEFINES+=NO_CONSOLE_REDIRECT

DEFINES+=LLVM_INSTALL=\\\"$${LLVM_INSTALL}\\\"

QMAKE_CXXFLAGS+=$$system($${LLVM_INSTALL}/bin/llvm-config --cxxflags)\
-Wno-unused-parameter -Wno-strict-aliasing


LIBS+=$$system($${LLVM_INSTALL}/bin/llvm-config --ldflags)

# rdynamic causes symbols to be exported even though this is not a lib
LIBS += -lm -ldl -fPIC -rdynamic\
qt-hack/qatomic_sun.o\
-lcling\
-lclang

SOURCES +=\
main.cpp\
widget.cpp \
consoleoutput.cpp \
codeinput.cpp \
codewidget.cpp

HEADERS  +=\
widget.h \
consoleoutput.h \
codeinput.h \
codewidget.h



