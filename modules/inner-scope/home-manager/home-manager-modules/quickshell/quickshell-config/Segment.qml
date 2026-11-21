import QtQuick
import Quickshell

Rectangle {
  color: Colours.darkestGray

  implicitWidth:  segment_text_object.implicitWidth + left_border.implicitWidth + right_border.implicitWidth + 30
  implicitHeight: segment_text_object.implicitHeight + bottom_border.implicitHeight + 10
  width: implicitWidth
  height: implicitHeight

  property string segment_text: Time.time
  property color segment_text_colour: Colours.fg
  property string segment_font_family: "JetBrains Mono NF"
  property int segment_font_weight: Font.ExtraBold
  property int segment_font_size: 15

  Text {
      id: segment_text_object

      anchors.centerIn: parent
      text: segment_text
      color: segment_text_colour

      font.family: segment_font_family
      font.weight: segment_font_weight
      font.pixelSize: segment_font_size
  }

  // Border: left
  property color left_border_colour: segment_text_colour
  property int left_border_width: 2
  Rectangle {
    id: left_border

    color: left_border_colour
    width: left_border_width
    height: parent.height

    anchors {
      left: parent.left
      verticalCenter: parent.verticalCenter
    }
  }

  // Border: right
  property color right_border_colour: segment_text_colour
  property int right_border_width: 2
  Rectangle {
    id: right_border

    color: right_border_colour
    width: right_border_width
    height: parent.height

    anchors {
      right: parent.right
      verticalCenter: parent.verticalCenter
    }
  }

  // Border: bottom
  property color bottom_border_colour: segment_text_colour
  property int bottom_border_width: 2
  Rectangle {
    id: bottom_border

    color: bottom_border_colour
    height: bottom_border_width
    width: parent.width

    anchors.bottom: parent.bottom
    anchors {
      horizontalCenter: parent.horizontalCenter
    }
  }
}
