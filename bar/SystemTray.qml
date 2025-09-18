import QtQuick
import Quickshell
import Quickshell.Services.SystemTray
import Quickshell.Widgets
import "." as Bar

Column {
    spacing: Bar.Style.traySpacing

    Repeater {
        model: SystemTray.items

        delegate: Item {
            width: 3
            height: 3

            IconImage {
                anchors.centerIn: parent
                width: 3
                height: 3
                source: modelData.icon
                smooth: true
            }

            MouseArea {
                anchors.fill: parent
                acceptedButtons: Qt.LeftButton | Qt.RightButton | Qt.MiddleButton

                onClicked: function(mouse) {
                    if (mouse.button === Qt.LeftButton) {
                        modelData.activate()
                    } else if (mouse.button === Qt.RightButton) {
                        if (modelData.hasMenu) {
                            menuAnchor.open()
                        }
                    } else if (mouse.button === Qt.MiddleButton) {
                        if (modelData.secondaryActivate) {
                            modelData.secondaryActivate()
                        }
                    }
                }

                onWheel: function(wheel) {
                    if (modelData.scroll) {
                        modelData.scroll(wheel.angleDelta.x, wheel.angleDelta.y)
                    }
                }
            }

            QsMenuAnchor {
                id: menuAnchor
                menu: modelData.menu
                anchor.rect.x: 0
                anchor.rect.y: 0
                anchor.rect.width: parent.width
                anchor.rect.height: parent.height
                anchor.edges: Edges.Left
            }
        }
    }
}
