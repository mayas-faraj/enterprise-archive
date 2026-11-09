#-------------------------------------------------
#
# Project created by QtCreator 2016-07-25T15:06:08
#
#-------------------------------------------------

QT       += core gui

greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

TARGET = dfexample
TEMPLATE = app

INCLUDEPATH += $$PWD/../../inc
DESTDIR = $$PWD/../../bin

build_pass:CONFIG(debug, debug|release) {
    unix: TARGET = $$join(TARGET,,,_debug)
    else: TARGET = $$join(TARGET,,,_d)
}

LIBS     += -L$$PWD/../../bin/ -L$$PWD/../../lib/


SOURCES += main.cpp \
        qmaindialog.cpp \
    ../../inc/common/WaterEffect.cpp \
    ../../inc/core/df/qdfsdkwrapper.cpp

HEADERS  += qmaindialog.h \
    ../../inc/common/WaterEffect.h \
    ../../inc/sdk/df/dfsdk.h \
    ../../inc/sdk/df/dfsdk_global.h \
    ../../inc/core/df/qdfsdkwrapper.h

FORMS    += qmaindialog.ui

RESOURCES +=  res.qrc
