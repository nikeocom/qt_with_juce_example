import QtQuick 2.13
import QtQuick.Window 2.13

import QtGraphicalEffects 1.13

import Core 0.1

Window {
    visible: true
    width: 572
    height: 316
    title: qsTr("Qt and JUCE")

    Connections {
        target: player
        onStarted: {
            playBtn.opacity = 0.0
            beaming.opacity = 0.8
            smooth.opacity = 0.0
        }

        onStopped: {
            playBtn.opacity = 1.0
            beaming.opacity = 0.0
            smooth.opacity = 0.6
        }
    }

    Image {
        anchors.fill: parent
        source: "resources/doom_patrol_img.jpeg"

        Rectangle {
            id: smooth
            anchors.fill: parent
            color: "black"
            opacity: 0.6
            Behavior on opacity {
                OpacityAnimator {
                    duration: 300
                }
            }
        }

        Rectangle {
            anchors.bottom: parent.bottom
            width: parent.width
            height: 50
            color: "black"
            opacity: 0.6 - smooth.opacity

            Text {
                anchors.centerIn: parent
                color: "white"
                text: "JUCE playing..."
            }
        }

        AnimatedImage {
            id: beaming
            anchors.left: parent.left
            anchors.bottom: parent.bottom
            anchors.bottomMargin: -2
            anchors.leftMargin: 10
            width: 50
            height: 50
            source: "resources/beaming.gif"
            layer.enabled: true
            opacity: 0.0
            layer.effect: ColorOverlay {
                color: "white"
            }
            Behavior on opacity {
                OpacityAnimator { duration: 300 }
            }
        }

        Image {
            id: playBtn
            anchors.centerIn: parent
            property double delta: sensor.containsMouse ? 1.5 : 1.0
            width: 150 * delta
            height: 100 * delta
            source: "resources/play_button.png"
            layer.enabled: true
            layer.effect: ColorOverlay {
                color: "white"
            }

            Behavior on delta {
                NumberAnimation { duration: 300 }
            }

            MouseArea {
                id: sensor
                cursorShape: Qt.PointingHandCursor
                hoverEnabled: true
                anchors.fill: parent
                onClicked:  {
                    player.play()
                }
            }
        } // Image
    } // Image
} // Window
