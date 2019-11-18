#ifndef JUCEAPPLICATION_H
#define JUCEAPPLICATION_H

#define JUCE_STANDALONE_APPLICATION 1

#include <QGuiApplication>

#include <JuceLibraryCode/JuceHeader.h>

/*!
 *   \brief Class for incapsulating JUCEApplication initialization hacks
 */

class JuceApplication : public QGuiApplication,
                        public JUCEApplication
{
public:
    JuceApplication(int &argc, char **argv);

    //! \note Initialization of JUCEApplication and JUCE gui
    static void initJuce();

    //! \note JUCEApplication implementation
    const String getApplicationName () override;
    const String getApplicationVersion () override;
    void shutdown () override;
    void initialise (const String &commandLineParameters) override;
};

#endif // JUCEAPPLICATION_H
