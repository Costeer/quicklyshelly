import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Quickshell
import Quickshell.Hyprland
import Quickshell.Services.UPower
import Quickshell.Io
import Quickshell.Services.SystemTray
import Quickshell.DBusMenu
import "." as Bar

PanelWindow {
    id: sideBar

    // Position the bar on the right side of the screen
    anchors {
        right: true
        left: false
        top: true
        bottom: true
    }

    // Set margins from Style
    margins {
        top: Bar.Style.panelMarginTop
        bottom: Bar.Style.panelMarginBottom
        right: Bar.Style.panelMarginRight
    }

    // Set the width of the bar
    implicitWidth: Bar.Style.barWidth

    // Panel properties
    aboveWindows: true
    focusable: false
    exclusionMode: ExclusionMode.Normal
    exclusiveZone: implicitWidth

    // Panel background with border
    Rectangle {
        anchors.fill: parent
        color: Bar.Style.backgroundColor
        opacity: Bar.Style.backgroundOpacity
        radius: Bar.Style.panelRadius
        border.width: Bar.Style.panelBorderWidth
        border.color: Bar.Style.panelBorderColor
    }

    // Main vertical layout
    ColumnLayout {
        id: barLayout
        anchors.fill: parent
        anchors.topMargin: Bar.Style.barMargin
        anchors.bottomMargin: Bar.Style.barMargin
        spacing: Bar.Style.itemSpacing

        // Workspace indicators at the top
        Bar.WorkspaceIndicators {}


        // Spacer to push content to top and bottom
        Item {
            Layout.fillHeight: true
        }

        // System indicators at the bottom (battery, tray, clock)
        Bar.SystemIndicators {}
    }
}
