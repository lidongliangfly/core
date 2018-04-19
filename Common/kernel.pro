QT       -= core
QT       -= gui

VERSION = 1.0.0.3
TARGET = kernel
TEMPLATE = lib

CONFIG += shared
CONFIG += plugin

CONFIG += core_static_link_libstd

DEFINES += KERNEL_USE_DYNAMIC_LIBRARY_BUILDING

# CONFIG
HEADERS += ./kernel_config.h

CORE_ROOT_DIR = $$PWD/..
PWD_ROOT_DIR = $$PWD
include(../Common/base.pri)

CONFIG += build_all_zlib build_zlib_as_sources
include(../OfficeUtils/OfficeUtils.pri)

CONFIG += core_static_link_xml_full
include(../DesktopEditor/xml/build/qt/libxml2.pri)

# DOWNLOADER
HEADERS += \
    ./FileDownloader/FileDownloader.h \
    ./FileDownloader/FileDownloader_private.h

SOURCES += ./FileDownloader/FileDownloader.cpp

core_windows {
    SOURCES += \
        ./FileDownloader/FileDownloader_win.cpp

    LIBS += -lAdvapi32
    LIBS += -lurlmon
    LIBS += -lRpcrt4
    LIBS += -lShell32
}
core_linux {
    SOURCES += \
        ./FileDownloader/FileDownloader_curl.cpp

    LIBS += -lcurl
}
core_mac {
    OBJECTIVE_SOURCES += \
        ./FileDownloader/FileDownloader_mac.mm

    LIBS += -framework AppKit
}

# CONFIG
HEADERS += ./kernel_config.h

# BLOCKER
HEADERS += \
    ./../DesktopEditor/graphics/TemporaryCS.h

SOURCES += \
    ./../DesktopEditor/graphics/TemporaryCS.cpp

# THREAD
HEADERS += \
    ./../DesktopEditor/graphics/BaseThread.h

SOURCES += \
    ./../DesktopEditor/graphics/BaseThread.cpp

# TIMER
HEADERS += \
    ./../DesktopEditor/graphics/Timer.h

SOURCES += \
    ./../DesktopEditor/graphics/Timer.cpp

# PATH
HEADERS += ./../DesktopEditor/common/Path.h
SOURCES += ./../DesktopEditor/common/Path.cpp

# STRINGS
HEADERS += ./../DesktopEditor/common/StringBuilder.h
SOURCES += ./../DesktopEditor/common/StringBuilder.cpp

HEADERS += ./../DesktopEditor/common/String.h
SOURCES += ./../DesktopEditor/common/String.cpp

# BASE64
HEADERS += ./../DesktopEditor/common/Base64.h
SOURCES += ./../DesktopEditor/common/Base64.cpp

# FILE
HEADERS += ./../DesktopEditor/common/File.h
SOURCES += ./../DesktopEditor/common/File.cpp

# DIRECTORY
HEADERS += ./../DesktopEditor/common/Directory.h
SOURCES += ./../DesktopEditor/common/Directory.cpp
