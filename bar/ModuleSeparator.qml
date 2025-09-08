import QtQuick
import QtQuick.Layouts
import "." as Bar

Rectangle {
    id: moduleSeparator

    // Layout properties
    Layout.alignment: Qt.AlignHCenter
    Layout.preferredWidth: Bar.Style.separatorWidth
    Layout.preferredHeight: Bar.Style.separatorHeight
    Layout.topMargin: Bar.Style.separatorMargin
    Layout.bottomMargin: Bar.Style.separatorMargin

    // Visual properties
    width: Bar.Style.separatorWidth
    height: Bar.Style.separatorHeight
    color: Bar.Style.separatorColor
    radius: Bar.Style.separatorWidth

    // Subtle opacity for minimal visual impact
    opacity: 0.6
}
