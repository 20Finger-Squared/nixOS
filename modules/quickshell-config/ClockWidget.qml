import QtQuick
import "."

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


    Text {
      id: text

      font {
        family: "Jetbrains Mono NF"
        weight: Font.ExtraBold
        pixelSize: 15
      }

      anchors.centerIn: parent
      text: Time.time
      color: Colours.blue
    }
}
