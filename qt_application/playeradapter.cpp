#include "playeradapter.h"

#include <QFile>

PlayerAdapter::PlayerAdapter(QObject *parent)
    : QObject(parent),
      m_player(new JucePlayer)
{
    connect(m_player.data(), &JucePlayer::startPlaying, this, &PlayerAdapter::started);
    connect(m_player.data(), &JucePlayer::stopPlaying, this, &PlayerAdapter::stopped);

    QFile audioFile(":/resources/doom_patrol_theme.mp3");

    if (!audioFile.open(QFile::ReadOnly)) {
        exit(0);
    }

    m_data = audioFile.readAll();

    m_player->setAudioSource(m_data.constData(), static_cast<size_t>(m_data.size()));
}


void PlayerAdapter::play()
{
    m_player->play();
}

void PlayerAdapter::stop()
{
    m_player->stop();
}

