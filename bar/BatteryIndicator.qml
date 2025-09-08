import QtQuick
import QtQuick.Layouts
import Quickshell.Services.UPower
import "." as Bar

Item {
    id: batteryIndicator

    // The battery display device
    property var displayDevice: UPower.displayDevice && UPower.displayDevice.ready ? UPower.displayDevice : null

    // Simplified battery percentage calculation
    property real batteryPercentage: displayDevice && displayDevice.percentage !== undefined && displayDevice.percentage >= 0 ?
                                    Math.max(0, Math.min(100, displayDevice.percentage * 100)) : 70

    property bool isCharging: displayDevice && displayDevice.state !== undefined &&
        (displayDevice.state === UPowerDeviceState.Charging || displayDevice.state === UPowerDeviceState.FullyCharged)

    property color fillColor: {
        if (isCharging)
            return Bar.Style.batteryHighColor // Green when charging
        if (batteryPercentage < 20)
            return Bar.Style.batteryLowColor // Red when low
        else if (batteryPercentage < 50)
            return Bar.Style.batteryMediumColor // Yellow when medium
        else
            return Bar.Style.batteryHighColor // Green when high
    }

    width: Bar.Style.batteryBarWidth
    height: Bar.Style.batteryBarHeight

    // Battery container with frame and background
    Rectangle {
        anchors.fill: parent
        radius: Bar.Style.batteryRadius
        color: Bar.Style.batteryBackgroundColor
        border.width: Bar.Style.batteryBorderWidth
        border.color: Bar.Style.borderColor
        clip: true

        // Background track
        Rectangle {
            anchors.fill: parent
            anchors.margins: Bar.Style.batteryBorderWidth
            radius: Math.max(0, Bar.Style.batteryRadius - 1)
            color: Bar.Style.batteryTrackColor
        }

        // Progress indicator (vertical - slides in from bottom)
        Rectangle {
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            anchors.margins: Bar.Style.batteryBorderWidth + 1
            height: Math.max(4, (parent.height - (Bar.Style.batteryBorderWidth * 2 + 2)) * (batteryPercentage / 100))
            radius: Math.max(0, Bar.Style.batteryRadius - 1)
            color: fillColor

            Behavior on height {
                NumberAnimation {
                    duration: 500
                    easing.type: Easing.OutQuad
                }
            }
        }
    }
}
