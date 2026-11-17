import QtQuick

Item {
  Segment {
    id: middle

    anchors.centerIn: parent.centerIn
    anchors.verticalCenter: parent.verticalCenter

    segment_text: Time.time
    segment_text_colour: Colours.blue

    left_border_colour: Colours.darkGray
    right_border_colour: Colours.darkGray
    left_border_width: 3
    right_border_width: 3
  }

  Segment {
    id: left

    anchors.right: middle.left
    anchors.verticalCenter: parent.verticalCenter

    segment_text: Time.day
    segment_text_colour: Colours.yellow

    right_border_width: 0
  }

  Segment {
    id: right

    anchors.left: middle.right
    anchors.verticalCenter: parent.verticalCenter

    segment_text: Time.date
    segment_text_colour: Colours.magenta

    left_border_width: 0
  }
}
