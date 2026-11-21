import QtQuick
import Quickshell
import Quickshell.Services.Pipewire

Segment {
  left_border_width: 0
  segment_text_colour: Colours.green

  PwObjectTracker {
      objects: [Pipewire.defaultAudioSink]
  }

  segment_text: {
      const sink = Pipewire.defaultAudioSink
      const nickname = sink?.nickname

      if (!sink?.ready || !sink?.audio) return "N/A"

      return `${nickname} | ${sink.audio.muted ? "  " : "" }${Math.round(sink.audio.volume * 100)}% `
  }
}
