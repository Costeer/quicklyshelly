import QtQuick
import QtQuick.Layouts
import "." as Bar

ColumnLayout {
    id: systemIndicators

    // Layout properties
    Layout.alignment: Qt.AlignHCenter
    spacing: Bar.Style.itemSpacing

    // Battery indicator (vertical)
    Bar.BatteryIndicator {
        Layout.alignment: Qt.AlignHCenter
    }

    // Separator between battery and system tray
    Bar.ModuleSeparator {}

    // System tray (moved between battery and clock) - dynamic height
    Bar.SystemTrayView {
        Layout.alignment: Qt.AlignHCenter
        Layout.preferredWidth: Bar.Style.barWidth
        Layout.topMargin: 3
        Layout.bottomMargin: 3
    }

    // Separator between system tray and clock
    Bar.ModuleSeparator {}

    // Clock component
    Bar.ClockComponent {
        // Inherits its own layout properties
    }
}
