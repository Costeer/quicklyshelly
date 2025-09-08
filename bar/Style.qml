pragma Singleton
import QtQuick

QtObject {
    // ------ Colors ------ //
    readonly property color backgroundColor: "#181926"
    readonly property real backgroundOpacity: 1
    readonly property color textColor: "#cdd6f4"
    readonly property color borderColor: "#cba6f7"
    readonly property color panelBorderColor: "#A98CD5"  // Panel border color

    // Catppuccin Mocha surface colors
    readonly property color surface0: "#313244"
    readonly property color surface1: "#45475a"
    readonly property color surface2: "#585b70"

    // Workspace colors
    readonly property color workspaceTextColor: "#eceff4"
    readonly property color workspaceFocusedTextColor: "#EA76CB"
    readonly property color workspaceActiveTextColor: "#81a1c1"
    readonly property color workspaceInactiveTextColor: "#7b88a1"

    // Battery colors
    readonly property color batteryLowColor: "#bf616a"      // Red when low (<20%)
    readonly property color batteryMediumColor: "#ebcb8b"   // Yellow when medium (<50%)
    readonly property color batteryHighColor: "#a3be8c"     // Green when high or charging
    readonly property color batteryTrackColor: "#000000"    // Dark background track
    readonly property color batteryBackgroundColor: "#000000" // Background behind the track



    // ------ Sizes ------ //
    readonly property int barWidth: 45
    readonly property int indicatorSize: 22
    readonly property int workspaceSize: 35      // Size of workspace indicators
    readonly property int workspaceTopMargin: -5 // Top margin for workspace section

    // Battery indicator
    readonly property int batteryBarWidth: 12     // Width of the vertical battery bar
    readonly property int batteryBarHeight: 120   // Height of the vertical battery bar

    // System tray properties
    readonly property int trayIconSize: 21       // Size of system tray icons
    readonly property int traySpacing: 4         // Spacing between tray icons

    // Panel properties
    readonly property int panelBorderWidth: 3    // Width of the panel border
    readonly property int panelRadius: 0         // Corner radius of the panel (0 for square corners)
    readonly property int panelMarginTop: 5      // Top margin of the panel
    readonly property int panelMarginBottom: 5   // Bottom margin of the panel
    readonly property int panelMarginRight: 5    // Right margin of the panel (side of screen)

    // Element properties
    readonly property int elementRadius: 0       // Default radius for elements like buttons
    readonly property int workspaceRadius: 0    // Radius for workspace indicators (set to half of size for circles)
    readonly property int batteryRadius: 0       // Radius for battery bar
    readonly property int batteryBorderWidth: 0  // Width of the battery border

    // Text
    readonly property int tinyTextSize: 10
    readonly property int smallTextSize: 14
    readonly property int regularTextSize: 16
    readonly property int mediumTextSize: 18
    readonly property int largeTextSize: 20
    readonly property int hugeTextSize: 24
    readonly property int workspaceTextSize: 18  // Text size for workspace indicators

    // Spacing
    readonly property int barMargin: 10
    readonly property int itemSpacing: 10
    readonly property int sectionSpacing: 12     // Spacing between major sections

    // Separator properties
    readonly property int separatorWidth: 39      // Width of module separators
    readonly property int separatorHeight: 1    // Height of module separators
    readonly property color separatorColor: surface1  // Color of module separators
    readonly property int separatorMargin: -1    // Margin around separators

    // Power menu properties
    readonly property int powerMenuWidth: 300    // Width of power menu
    readonly property int powerMenuHeight: 80    // Height of power menu
    readonly property color powerMenuBackground: backgroundColor  // Background color
    readonly property color powerMenuBorder: panelBorderColor   // Border color
    readonly property int powerMenuBorderWidth: panelBorderWidth // Border width
    readonly property int powerMenuRadius: panelRadius          // Corner radius
    readonly property int powerMenuButtonSize: 50               // Size of power buttons
    readonly property int powerMenuButtonSpacing: 20            // Spacing between buttons
    readonly property color powerMenuButtonBackground: surface1 // Button background
    readonly property color powerMenuButtonHover: surface2      // Button hover color
    readonly property color powerMenuButtonText: textColor      // Button text color
    readonly property int powerMenuButtonRadius: 6              // Button corner radius
}
