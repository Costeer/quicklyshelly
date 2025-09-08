import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Io
import "." as Bar

FloatingWindow {
    id: powerMenu

    // Window properties
    implicitWidth: Bar.Style.powerMenuWidth
    implicitHeight: Bar.Style.powerMenuHeight
    visible: false

    // Background - transparent window
    color: Qt.rgba(0, 0, 0, 0)

    // Main container
    Rectangle {
        anchors.centerIn: parent
        width: Bar.Style.powerMenuWidth
        height: Bar.Style.powerMenuHeight
        color: Bar.Style.powerMenuBackground
        border.width: Bar.Style.powerMenuBorderWidth
        border.color: Bar.Style.powerMenuBorder
        radius: Bar.Style.powerMenuRadius
        opacity: Bar.Style.backgroundOpacity

        // Button layout
        RowLayout {
            anchors.centerIn: parent
            spacing: Bar.Style.powerMenuButtonSpacing

            // Lock button
            Rectangle {
                width: Bar.Style.powerMenuButtonSize
                height: Bar.Style.powerMenuButtonSize
                color: lockMouseArea.containsMouse ? Bar.Style.powerMenuButtonHover : Bar.Style.powerMenuButtonBackground
                radius: Bar.Style.powerMenuButtonRadius
                border.width: 1
                border.color: Bar.Style.separatorColor

                Text {
                    anchors.centerIn: parent
                    text: "🔒"
                    font.pixelSize: 20
                    color: Bar.Style.powerMenuButtonText
                }

                MouseArea {
                    id: lockMouseArea
                    anchors.fill: parent
                    hoverEnabled: true
                    cursorShape: Qt.PointingHandCursor
                    onClicked: {
                        powerMenu.executeCommand("lock")
                        powerMenu.hide()
                    }
                }
            }

            // Logout button
            Rectangle {
                width: Bar.Style.powerMenuButtonSize
                height: Bar.Style.powerMenuButtonSize
                color: logoutMouseArea.containsMouse ? Bar.Style.powerMenuButtonHover : Bar.Style.powerMenuButtonBackground
                radius: Bar.Style.powerMenuButtonRadius
                border.width: 1
                border.color: Bar.Style.separatorColor

                Text {
                    anchors.centerIn: parent
                    text: "👤"
                    font.pixelSize: 20
                    color: Bar.Style.powerMenuButtonText
                }

                MouseArea {
                    id: logoutMouseArea
                    anchors.fill: parent
                    hoverEnabled: true
                    cursorShape: Qt.PointingHandCursor
                    onClicked: {
                        powerMenu.executeCommand("logout")
                        powerMenu.hide()
                    }
                }
            }

            // Restart button
            Rectangle {
                width: Bar.Style.powerMenuButtonSize
                height: Bar.Style.powerMenuButtonSize
                color: restartMouseArea.containsMouse ? Bar.Style.powerMenuButtonHover : Bar.Style.powerMenuButtonBackground
                radius: Bar.Style.powerMenuButtonRadius
                border.width: 1
                border.color: Bar.Style.separatorColor

                Text {
                    anchors.centerIn: parent
                    text: "🔄"
                    font.pixelSize: 20
                    color: Bar.Style.powerMenuButtonText
                }

                MouseArea {
                    id: restartMouseArea
                    anchors.fill: parent
                    hoverEnabled: true
                    cursorShape: Qt.PointingHandCursor
                    onClicked: {
                        powerMenu.executeCommand("restart")
                        powerMenu.hide()
                    }
                }
            }

            // Power off button
            Rectangle {
                width: Bar.Style.powerMenuButtonSize
                height: Bar.Style.powerMenuButtonSize
                color: poweroffMouseArea.containsMouse ? Bar.Style.powerMenuButtonHover : Bar.Style.powerMenuButtonBackground
                radius: Bar.Style.powerMenuButtonRadius
                border.width: 1
                border.color: Bar.Style.separatorColor

                Text {
                    anchors.centerIn: parent
                    text: "⚡"
                    font.pixelSize: 20
                    color: Bar.Style.powerMenuButtonText
                }

                MouseArea {
                    id: poweroffMouseArea
                    anchors.fill: parent
                    hoverEnabled: true
                    cursorShape: Qt.PointingHandCursor
                    onClicked: {
                        powerMenu.executeCommand("poweroff")
                        powerMenu.hide()
                    }
                }
            }
        }
    }

    // Functions
    function show() {
        visible = true
    }

    function hide() {
        visible = false
    }

    function toggle() {
        visible = !visible
    }

    function executeCommand(action) {
        var process = Qt.createQmlObject('import Quickshell.Io; Process {}', powerMenu)

        switch(action) {
            case "lock":
                process.command = ["hyprctl", "dispatch", "exec", "swaylock"]
                break
            case "logout":
                process.command = ["hyprctl", "dispatch", "exit"]
                break
            case "restart":
                process.command = ["systemctl", "reboot"]
                break
            case "poweroff":
                process.command = ["systemctl", "poweroff"]
                break
        }

        process.running = true
    }
}
