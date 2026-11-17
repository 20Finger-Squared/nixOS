// Time.qml
pragma Singleton

import Quickshell
import QtQuick

Singleton {
  id: root
  // an expression can be broken across multiple lines using {}
  readonly property string time: {
    Qt.formatDateTime(clock.date, "hh : mm : ss")
  }
  readonly property string date: {
    Qt.formatDateTime(clock.date, "d / M / yyyy")
  }
  readonly property string day: {
    Qt.formatDateTime(clock.date, "dddd")
  }

  SystemClock {
    id: clock
    precision: SystemClock.date
  }
}
