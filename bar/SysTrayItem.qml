import QtQuick
import Quickshell
import Quickshell.Services.SystemTray
import Quickshell.Widgets
import "." as Bar

Item {
    id: root

    required property SystemTrayItem item

    width: Bar.Style.trayIconSize
    height: Bar.Style.trayIconSize

    IconImage {
        anchors.centerIn: parent
        width: Bar.Style.trayIconSize 6
        height: Bar.Style.trayIconSize 2
        source: root.item.icon
        smooth: true
    }

    MouseArea {
        anchors.fill: parent
        acceptedButtons: Qt.LeftButton | Qt.RightButton | Qt.MiddleButton

        onClicked: function(mouse) {
            if (mouse.button === Qt.LeftButton) {
                root.item.activate()
            } else if (mouse.button === Qt.RightButton) {
                if (root.item.hasMenu) {
                    menuAnchor.open()
                }
            } else if (mouse.button === Qt.MiddleButton) {
                if (root.item.secondaryActivate) {
                    root.item.secondaryActivate()
                }
            }
        }

        onWheel: function(wheel) {
            if (root.item.scroll) {
                root.item.scroll(wheel.angleDelta.x, wheel.angleDelta.y)
            }
        }
    }

    QsMenuAnchor {
        id: menuAnchor
        menu: root.item.menu
        anchor.rect.x: 0
        anchor.rect.y: 0
        anchor.rect.width: root.width
        anchor.rect.height: root.height
        anchor.edges: Edges.Left
    }
}
