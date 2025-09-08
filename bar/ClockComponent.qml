import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Io
import "." as Bar

Rectangle {
    id: clockComponent

    // Layout properties
    Layout.alignment: Qt.AlignHCenter
    Layout.preferredWidth: Bar.Style.barWidth - 10
    Layout.preferredHeight: 50
    Layout.bottomMargin: -5

    // Styling
    color: "transparent"
    border.width: 0
    border.color: "transparent"
    radius: Bar.Style.elementRadius

    // State properties
    property bool isPressed: false

    // SystemClock for efficient time updates
    SystemClock {
        id: systemClock
        precision: SystemClock.Minutes
        enabled: true
    }

    // Notification handler
    Item {
        id: notificationProcess
        visible: false

        function openNotifications() {
            var process = Qt.createQmlObject('import Quickshell.Io; Process {}', notificationProcess)
            process.command = ["/run/current-system/sw/bin/swaync-client", "--open-panel"]
            process.running = true
        }
    }

    // Time display
    Column {
        anchors.centerIn: parent
        spacing: 6
        width: parent.width

        Text {
            text: Qt.formatDateTime(systemClock.date, "hh")
            color: clockComponent.isPressed ? Bar.Style.workspaceFocusedTextColor : Bar.Style.textColor
            font.pixelSize: Bar.Style.mediumTextSize
            font.bold: true
            horizontalAlignment: Text.AlignHCenter
            width: parent.width
        }

        Text {
            text: Qt.formatDateTime(systemClock.date, "mm")
            color: clockComponent.isPressed ? Bar.Style.workspaceFocusedTextColor : Bar.Style.textColor
            font.pixelSize: Bar.Style.mediumTextSize
            font.bold: true
            horizontalAlignment: Text.AlignHCenter
            width: parent.width
        }
    }

    // Mouse interaction
    MouseArea {
        anchors.fill: parent
        hoverEnabled: true
        cursorShape: Qt.PointingHandCursor

        onPressed: clockComponent.isPressed = true
        onReleased: clockComponent.isPressed = false
        onClicked: notificationProcess.openNotifications()
    }
}
