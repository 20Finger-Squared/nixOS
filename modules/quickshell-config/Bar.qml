import Quickshell
import Quickshell


Scope {
  // no more time object

  Variants {
    model: Quickshell.screens

    PanelWindow {
      required property var modelData
      screen: modelData

      color: Colours.bg

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
