#include "juceapplication.h"

namespace  {
static char *argv[] = { "JUCE" };
static int argc = 1;

//! \note Magin JUCE_CREATE_APPLICATION_DEFINE from magic START_JUCE_APPLICATION
//!       adapted with QGuiApplication for assertion in JuceApplicationBase
juce::JUCEApplicationBase* juce_CreateApplication();
juce::JUCEApplicationBase* juce_CreateApplication() { return new JuceApplication(argc, argv); }

}

JuceApplication::JuceApplication(int &argc, char **argv)
: QGuiApplication(argc, argv)
{
}

void JuceApplication::initJuce()
{
    // Need for MessageManager
    initialiseJuce_GUI();
    // for isStandalone() == true
    juce::JUCEApplicationBase::createInstance = &juce_CreateApplication;
}

const String JuceApplication::getApplicationName()
{
    return applicationName().toUtf8().constData();
}

const String JuceApplication::getApplicationVersion()
{
    return applicationVersion().toUtf8().constData();
}

void JuceApplication::shutdown()
{

}

void JuceApplication::initialise(const String &commandLineParameters)
{
    Q_UNUSED(commandLineParameters)
}
