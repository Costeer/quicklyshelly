import QtQuick
import QtQuick.Layouts
import Quickshell.Hyprland
import "." as Bar

Item {
    id: workspaceIndicators

    // Layout properties
    Layout.fillWidth: true
    Layout.preferredHeight: Bar.Style.workspaceSize * 4
    Layout.topMargin: Bar.Style.workspaceTopMargin

    Column {
        anchors.horizontalCenter: parent.horizontalCenter
        width: Bar.Style.workspaceSize
        spacing: 1

        Repeater {
            model: Hyprland.workspaces

            delegate: Item {
                width: Bar.Style.workspaceSize
                height: Bar.Style.workspaceSize
                anchors.horizontalCenter: parent.horizontalCenter

                Text {
                    anchors.centerIn: parent
                    text: modelData.id
                    color: modelData.focused ? Bar.Style.workspaceFocusedTextColor :
                           modelData.active ? Bar.Style.workspaceActiveTextColor : Bar.Style.workspaceInactiveTextColor
                    font.pixelSize: Bar.Style.workspaceTextSize
                    font.bold: modelData.focused
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }

                MouseArea {
                    anchors.fill: parent
                    onClicked: modelData.activate()
                }
            }
        }
    }
}
