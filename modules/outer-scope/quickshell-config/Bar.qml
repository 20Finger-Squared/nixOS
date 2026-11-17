import Quickshell
import QtQuick

Scope {
  Variants {
    model: Quickshell.screens

    PanelWindow {
      required property var modelData
      screen: modelData

      color: Colours.bg

      Rectangle { // bottom line
        color: Colours.gray
        height: 2
        width: parent.width

        anchors {
          bottom: parent.bottom
          horizontalCenter: parent.horizontalCenter
        }
      }

      AudioWidget {
        anchors.verticalCenter: parent.verticalCenter
        anchors.leftMargin: 40
      }

      anchors {
        top: true
        left: true
        right: true
      }

      implicitHeight: 30

      ClockWidget {
        anchors.verticalCenter: parent.verticalCenter
        anchors.centerIn: parent
      }
    }
  }
}
