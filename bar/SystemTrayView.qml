import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import Quickshell
import Quickshell.Services.SystemTray
import Quickshell.DBusMenu
import "." as Bar

Item {
    id: systemTrayContainer

    // Properties
    property int iconSize: Bar.Style.trayIconSize
    property int spacing: Bar.Style.traySpacing

    // Width should match the bar width for proper centering
    implicitWidth: Bar.Style.barWidth
    implicitHeight: (trayItemsView.count !== undefined && trayItemsView.count > 0) ?
                    (trayItemsView.count * iconSize + (trayItemsView.count - 1) * spacing) : 0

    // Column layout for vertical stacking with proper centering
    Column {
        id: trayColumn
        anchors.centerIn: parent
        width: parent.width
        spacing: systemTrayContainer.spacing
        visible: trayItemsView.count > 0

        Repeater {
            id: trayItemsView
            model: SystemTray.items || null

            delegate: Item {
                width: systemTrayContainer.iconSize
                height: systemTrayContainer.iconSize
                anchors.horizontalCenter: parent.horizontalCenter

                // The icon from the system tray item
                Image {
                    id: trayIcon
                    anchors.centerIn: parent
                    width: systemTrayContainer.iconSize
                    height: systemTrayContainer.iconSize
                    source: modelData && modelData.icon ? modelData.icon : ""
                    sourceSize.width: systemTrayContainer.iconSize
                    sourceSize.height: systemTrayContainer.iconSize
                    antialiasing: true
                    smooth: true
                    cache: true
                    asynchronous: true
                    fillMode: Image.PreserveAspectFit
                }

                // Tooltip and interaction
                MouseArea {
                    anchors.fill: parent
                    cursorShape: Qt.PointingHandCursor
                    hoverEnabled: true

                    // Show tooltip if available
                    ToolTip {
                        visible: parent.containsMouse && modelData && modelData.tooltipTitle !== ""
                        text: modelData && modelData.tooltipTitle ?
                              modelData.tooltipTitle + (modelData.tooltipDescription ? "\n" + modelData.tooltipDescription : "") : ""
                        delay: 500
                    }

                    // Handle clicks
                    onClicked: {
                        if (modelData && modelData.hasMenu) {
                            // Open menu
                            if (modelData.menu) {
                                modelData.menu.openRelative(parent)
                            }
                        } else if (modelData) {
                            // If no menu, activate the item directly
                            modelData.activate()
                        }
                    }

                    // Right click to open menu directly
                    onPressAndHold: {
                        if (modelData && modelData.hasMenu && modelData.menu) {
                            modelData.menu.openRelative(parent)
                        }
                    }
                }
            }
        }
    }
}
