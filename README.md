# Quickshell Vertical Bar for Hyprland

This is a simple vertical bar for Hyprland using Quickshell's PanelWindow component. It's positioned on the right side of the screen and includes:

- Compact, centered workspace indicators at the top with colored numbers
- Centered system tray with icon support (requires StatusNotifierItem protocol)
- Vertical battery progress bar with sliding animation and framed background
- Date and stacked clock at the bottom with visual feedback when clicked
- Configurable border, margins and rounded corners

## Features

- Workspace switcher: Click on any workspace number to switch to that workspace
- Real-time workspace updates: The bar updates automatically when workspaces change
- Clean Nord-inspired theme with centralized styling
- Proper exclusion zone to prevent windows from overlapping the bar
- System tray support for applications using the StatusNotifierItem protocol
- Vertical battery indicator with smooth sliding animation and framed background
- Interactive elements with visual feedback (clock changes color when pressed)
- Fully customizable corner rounding for all elements
- Optional border around the panel with configurable color and margins

## Usage

1. Make sure Quickshell is installed on your system
2. Place these configuration files in `~/.config/quickshell/`
3. Start Quickshell with: `quickshell`

Note: This configuration requires the `Quickshell.Hyprland` and `Quickshell.Services.UPower` modules, which should be included with a standard Quickshell installation.

## Customization

You can customize various aspects of the bar:

- Colors and sizing: Edit the values in `bar/Style.qml` (centralized styling)
- Layout: Modify the components and their order in `bar/SideBar.qml`
- Add more components: Expand the ColumnLayout in `bar/SideBar.qml`
- Create new indicators: Follow the pattern of the BatteryIndicator component
- Corner rounding: Adjust radius values in `Style.qml` for each element type
- Panel border: Configure color, width and margins in `Style.qml`
- Workspace size: Change appearance through workspaceSize and workspaceTextSize
- Workspace margin: Adjust top spacing with workspaceTopMargin in `Style.qml`
- Workspace spacing: Control gap between workspace indicators
- System tray: Configure icon size, spacing and refresh interval in `Style.qml`

## System Indicators

This configuration includes:

1. **System Tray**: Integrates with `Quickshell.Services.SystemTray` to display application icons
   - Shows status icons from applications that support StatusNotifierItem protocol
   - Centered layout with configurable spacing between icons
   - Debug information when no icons are detected
   - Auto-refresh mechanism to detect when icons become available
   
   Note: Some applications may not appear in the tray if they don't use the
   StatusNotifierItem protocol or if they register too late. In such cases,
   try restarting the application or reloading quickshell.

2. **Battery Indicator**: Uses `Quickshell.Services.UPower` to display battery level
   - Animated vertical progress bar with framed background
   - Smooth sliding animation when battery level changes
   - Color coded: red (<20%), yellow (<50%), green (>50%)
   - Changes to green when charging (no extra text indicators)
   - Animation speed, border, and dimensions configurable in Style.qml

3. **Clock**: Shows hours and minutes stacked on top of each other at the bottom of the bar
   - Provides visual feedback when clicked (text color changes)
   - Has click handler infrastructure in place for adding custom actions

To add more indicators, create new QML components and add them to the layout in `SideBar.qml`.

## Requirements

- Hyprland
- Quickshell with Hyprland support

## Components Used

- `PanelWindow`: Creates a panel that properly reserves space on the screen
- `Hyprland`: Singleton object to interact with Hyprland
- `HyprlandWorkspace`: Workspace objects with properties like id, active, and focused
- `SystemTray`: Integrates with StatusNotifierItem protocol for system tray icons
- `UPower`: Battery and power management integration via the displayDevice property
- Custom styling with the `Style.qml` singleton for centralized theming
- Configurable text sizes, battery dimensions, and corner radii defined in Style.qml
- Ultra-minimalist design with color-based status indicators and no unnecessary text
- Interactive elements with visual feedback for better usability
- Extensible design that can be customized with additional functionality
- Panel border with configurable color, width and margins
- Centrally aligned workspace indicators with compact spacing
- Animated battery indicator with smooth transitions between levels
- System tray with centered icons and automatic refresh capabilities

## Troubleshooting

If system tray icons don't appear:
1. Ensure applications use the StatusNotifierItem protocol
2. Try restarting applications after quickshell is running
3. Check console logs for detected tray items

## License

Feel free to modify and distribute this configuration as needed.