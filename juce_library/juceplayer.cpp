#include "juceplayer.h"

#include <QDebug>

JucePlayer::JucePlayer()
    : QObject()
{
    // Register MP3 format as default
    m_formatManager.registerFormat(&m_format, true);

    // Init default device
    m_deviceManager.initialiseWithDefaultDevices(0, 2);
    // Set AudioSourcePlayer as audio callback for output device
    m_deviceManager.addAudioCallback(&m_player);


    // Lock MessageManager for safety intall listner
    MessageManagerLock lock(Thread::getCurrentThread());
    m_transport.addChangeListener(this);
}

void JucePlayer::changeListenerCallback(ChangeBroadcaster *source)
{
    if (source == &m_transport) {
        if (m_transport.isPlaying()) {
            emit startPlaying();
        } else {
            m_transport.setPosition(0.0);
            emit stopPlaying();
        }
    }
}

void JucePlayer::setAudioSource(const char *data, size_t size)
{
    m_inputStream.reset(new MemoryInputStream(data, size, false));

    AudioFormatReader *reader = m_formatManager.createReaderFor(m_inputStream.data());

    m_currentReaderSource.reset(new AudioFormatReaderSource (reader, true));

    m_transport.setSource(m_currentReaderSource.data(), 0, nullptr, reader->sampleRate);
    m_player.setSource(&m_transport);
}

void JucePlayer::stop()
{
    if (m_transport.isPlaying()) {
        m_transport.stop();
        m_transport.setPosition(0.0);
    }
}

void JucePlayer::play()
{
    m_transport.start();
}

double JucePlayer::getCurrentPosition() const
{
    return m_transport.getCurrentPosition();
}

double JucePlayer::getTotalTime() const
{
    return m_transport.getLengthInSeconds();
}
