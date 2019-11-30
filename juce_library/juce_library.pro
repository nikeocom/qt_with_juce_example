#-------------------------------------------------
#
# Project created by QtCreator 2019-11-13T18:34:50
#
#-------------------------------------------------

QT       -= gui

TARGET = juce_library
TEMPLATE = lib
CONFIG += staticlib

# Path to JUCE modules
INCLUDEPATH += /Users/user/Downloads/JUCE/modules

# Juce defines
DEFINES += JUCE_APP_VERSION=1.0.0 \
           JUCE_APP_VERSION_HEX=0x10000 \
           JucePlugin_Build_VST=0 \
           JucePlugin_Build_VST3=0 \
           JucePlugin_Build_AU=0 \
           JucePlugin_Build_AUv3=0 \
           JucePlugin_Build_RTAS=0 \
           JucePlugin_Build_AAX=0 \
           JucePlugin_Build_Standalone=0 \
           JucePlugin_Build_Unity=0 \
           JUCE_USE_MP3AUDIOFORMAT=1 \
           DEBUG=1

android {
INCLUDEPATH += $$(ANDROID_NDK_ROOT)/sources/android/cpufeatures

DEFINES += JUCE_ANDROID=1 \
           JUCE_ANDROID_API_VERSION=16
SOURCES += \
        $$(ANDROID_NDK_ROOT)/sources/android/cpufeatures/cpu-features.c

}

SOURCES += \
        juceplayer.cpp \
# Juce generated sources
        JuceLibraryCode/include_juce_audio_basics.cpp \
        JuceLibraryCode/include_juce_audio_devices.cpp \
        JuceLibraryCode/include_juce_audio_formats.cpp \
        JuceLibraryCode/include_juce_audio_processors.cpp \
        JuceLibraryCode/include_juce_audio_utils.cpp \
        JuceLibraryCode/include_juce_core.cpp \
        JuceLibraryCode/include_juce_cryptography.cpp \
        JuceLibraryCode/include_juce_data_structures.cpp \
        JuceLibraryCode/include_juce_events.cpp \
        JuceLibraryCode/include_juce_graphics.cpp \
        JuceLibraryCode/include_juce_gui_basics.cpp \
        JuceLibraryCode/include_juce_gui_extra.cpp \
        JuceLibraryCode/include_juce_opengl.cpp

macx {
# Add framework for JUCE
    LIBS += -framework Foundation
    LIBS += -framework UIKit
    LIBS += -framework AudioToolBox
    LIBS += -framework CoreAudio
    LIBS += -framework CoreAudioKit
    LIBS += -framework CoreMIDI
    LIBS += -framework Accelerate
    LIBS += -framework Carbon
    LIBS += -framework Cocoa
    LIBS += -framework IOKit

# Juce generated obective-c++ soucres
    OBJECTIVE_SOURCES += \
        JuceLibraryCode/include_juce_audio_basics.mm \
        JuceLibraryCode/include_juce_audio_devices.mm \
        JuceLibraryCode/include_juce_audio_formats.mm \
        JuceLibraryCode/include_juce_audio_processors.mm \
        JuceLibraryCode/include_juce_audio_utils.mm \
        JuceLibraryCode/include_juce_core.mm \
        JuceLibraryCode/include_juce_cryptography.mm \
        JuceLibraryCode/include_juce_data_structures.mm \
        JuceLibraryCode/include_juce_events.mm \
        JuceLibraryCode/include_juce_graphics.mm \
        JuceLibraryCode/include_juce_gui_basics.mm \
        JuceLibraryCode/include_juce_gui_extra.mm \
        JuceLibraryCode/include_juce_opengl.mm
}

HEADERS += \
        juceplayer.h \
#Juce generated headers
        JuceLibraryCode/JuceHeader.h \
        JuceLibraryCode/AppConfig.h

unix {
    target.path = /usr/lib
    INSTALLS += target
}
