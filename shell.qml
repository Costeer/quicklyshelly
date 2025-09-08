//@ pragma UseQApplication
import Quickshell
import Quickshell.Hyprland
import Quickshell.Io
import QtQuick
import "bar" as Bar

ShellRoot {
    Component.onCompleted: {
        Hyprland.refreshWorkspaces()
        Hyprland.refreshMonitors()
    }

    Connections {
        target: Hyprland
        function onRawEvent(event) {
            if (event.event === "workspace" || event.event === "createworkspace" || event.event === "destroyworkspace") {
                Hyprland.refreshWorkspaces()
            } else if (event.event === "monitoradded" || event.event === "monitorremoved") {
                Hyprland.refreshMonitors()
            }
        }
    }

    Bar.SideBar {}

    Bar.PowerMenu {
        id: powerMenu
    }

    Item {
        focus: true
        Keys.onPressed: function(event) {
            if (event.modifiers === Qt.AltModifier && event.key === Qt.Key_N) {
                var process = new Process()
                process.command = ["swaync-client", "--open-panel"]
                process.running = true
                event.accepted = true
            } else if (event.modifiers === Qt.MetaModifier && event.key === Qt.Key_P) {
                powerMenu.toggle()
                event.accepted = true
            }
        }
    }
}
