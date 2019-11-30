# How to
First, you need to generate project in Projucer:
![Alt text](tutorial/projucer.png?raw=true "Audio application")

And now you have a generated code like this:
![Alt text](tutorial/generated_folder.png?raw=true "Genereted sources and XCode project")

# Dependecies
For example, i used XCode project. And now you need to get frameworks and defines from project
![Alt text](tutorial/frameworks.png?raw=true "Frameworks")
![Alt text](tutorial/defines.png?raw=true "Defines")

# Qt Creator
For using a JUCE code in Qt project you need to add all sources, defines and set path to JUCE modules in project:
```
# Path to JUCE modules
INCLUDEPATH += /path/to/JUCE/modules

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
```

For Android you can find defines in CMakeLists.txt
```
add_definitions("-DJUCE_ANDROID=1" "-DJUCE_ANDROID_API_VERSION=16" "-DJUCE_PUSH_NOTIFICATIONS=1" "-DJUCE_PUSH_NOTIFICATIONS_ACTIVITY=\"com/roli/juce/JuceActivity\"" "-DJUCER_ANDROIDSTUDIO_7F0E4A25=1" "-DJUCE_APP_VERSION=1.0.0" "-DJUCE_APP_VERSION_HEX=0x10000")
```

For OS X:
```
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
```

(for other system you need to add special for OS libs)

## Now JUCE code is added and we can compile it. But!

### For full functionality you must run JuceApplication:
1. Inherrit from ```JUCEApplication```
2. Call:
```
juce::JUCEApplicationBase* juce_CreateApplication();
juce::JUCEApplicationBase* juce_CreateApplication() { return new YourJuceApplicationClass();
```
3. Initialise JUCE GUI (order is required):
```
    // Need for MessageManager
    initialiseJuce_GUI();
    // for isStandalone() == true
    juce::JUCEApplicationBase::createInstance = &juce_CreateApplication;
```
