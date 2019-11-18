#ifndef PLAYERADAPTER_H
#define PLAYERADAPTER_H

#include <QObject>
#include <juceplayer.h>

/*!
 *   \class PlayerAdapter
 *   \brief simple adapter JucePlayer for QML usage
 */

class PlayerAdapter : public QObject
{
    Q_OBJECT
public:
    explicit PlayerAdapter(QObject *parent = nullptr);

    Q_INVOKABLE void play();
    Q_INVOKABLE void stop();

signals:
    void started();
    void stopped();

private:
    QScopedPointer<JucePlayer> m_player;

    //! \note
    QByteArray m_data;
};

#endif // PLAYERADAPTER_H
