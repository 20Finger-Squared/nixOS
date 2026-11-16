import QtQuick
import Quickshell
import Quickshell.Services.Pipewire

Rectangle {
    color: Colours.darkestGray
    implicitWidth: text.implicitWidth + 30
    implicitHeight: text.implicitHeight + 10

    Rectangle {
      anchors {
        bottom: parent.bottom
        horizontalCenter: parent.horizontalCenter
      }

      implicitWidth: parent.implicitWidth
      height: 2
      color: text.color
    }

    PwObjectTracker {
        objects: [Pipewire.defaultAudioSink]
    }

    Text {
        id: text
        anchors.centerIn: parent


        text: {
            const sink = Pipewire.defaultAudioSink
            if (!sink?.ready || !sink?.audio) return "N/A"

            return `${Math.round(sink.audio.volume*100)}%`
        }

        color: Colours.green
        font.family: "JetBrains Mono NF"
        font.weight: Font.ExtraBold
        font.pixelSize: 15
    }
}
