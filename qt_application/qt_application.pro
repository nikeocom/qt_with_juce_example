QT += quick

CONFIG += c++14

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
           JUCE_STANDALONE_APPLICATION=1 \
           DEBUG=1

SOURCES += \
        juceapplication.cpp \
        main.cpp \
        playeradapter.cpp

RESOURCES += qml.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Additional import path used to resolve QML modules just for Qt Quick Designer
QML_DESIGNER_IMPORT_PATH =

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

macx: LIBS += -L$$OUT_PWD/../juce_library/ -ljuce_library

INCLUDEPATH += $$PWD/../juce_library
DEPENDPATH += $$PWD/../juce_library

INCLUDEPATH += /Users/user/Downloads/JUCE/modules
macx {
    LIBS += -framework Foundation
    LIBS += -framework AudioToolBox
    LIBS += -framework CoreAudio
    LIBS += -framework CoreAudioKit
    LIBS += -framework CoreMIDI
    LIBS += -framework Accelerate
    LIBS += -framework Carbon
    LIBS += -framework Cocoa
    LIBS += -framework IOKit
    LIBS += -framework QuartzCore
    LIBS += -framework OpenGL

    PRE_TARGETDEPS += $$OUT_PWD/../juce_library/libjuce_library.a
}

HEADERS += \
    juceapplication.h \
    playeradapter.h
