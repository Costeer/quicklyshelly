
import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Quickshell.Services.Greetd

Window {
    id: root
    width: 1920
    height: 1080
    visible: true
    title: "Greetd"

    QtObject {
        id: style
        property color rosewater: "#f5e0dc"
        property color flamingo: "#f2cdcd"
        property color pink: "#f5c2e7"
        property color mauve: "#cba6f7"
        property color red: "#f38ba8"
        property color maroon: "#eba0ac"
        property color peach: "#fab387"
        property color yellow: "#f9e2af"
        property color green: "#a6e3a1"
        property color teal: "#94e2d5"
        property color sky: "#89dceb"
        property color sapphire: "#74c7ec"
        property color blue: "#89b4fa"
        property color lavender: "#b4befe"

        property color text: "#cdd6f4"
        property color subtext1: "#bac2de"
        property color subtext0: "#a6adc8"

        property color overlay2: "#9399b2"
        property color overlay1: "#7f849c"
        property color overlay0: "#6c7086"

        property color surface2: "#585b70"
        property color surface1: "#45475a"
        property color surface0: "#313244"

        property color base: "#1e1e2e"
        property color mantle: "#181825"
        property color crust: "#11111b"
    }

    Greetd {
        id: greetd
        onAuthMessage: {
            if (message.type === Greetd.AuthMessageType.Secret) {
                passwordInput.prompt = message.text;
                passwordInput.visible = true;
                passwordInput.forceActiveFocus();
            } else {
                messageText.text = message.text;
            }
        }
        onAuthFailure: {
            messageText.text = "Authentication failed";
            passwordInput.text = "";
        }
        onReadyToLaunch: {
            greetd.launch("startplasma-wayland");
        }
    }

    Rectangle {
        anchors.fill: parent
        color: style.base

        ColumnLayout {
            anchors.centerIn: parent
            spacing: 20

            Text {
                id: messageText
                Layout.alignment: Qt.AlignHCenter
                color: style.text
                font.pixelSize: 20
            }

            TextField {
                id: usernameInput
                Layout.alignment: Qt.AlignHCenter
                placeholderText: "Username"
                color: style.text
                background: Rectangle {
                    color: style.surface0
                    border.color: style.surface1
                    border.width: 2
                    radius: 5
                }
                onAccepted: {
                    greetd.createSession(usernameInput.text);
                }
            }

            TextField {
                id: passwordInput
                visible: false
                Layout.alignment: Qt.AlignHCenter
                placeholderText: "Password"
                echoMode: TextInput.Password
                color: style.text
                background: Rectangle {
                    color: style.surface0
                    border.color: style.surface1
                    border.width: 2
                    radius: 5
                }
                onAccepted: {
                    greetd.respond(passwordInput.text);
                }
            }

            Button {
                Layout.alignment: Qt.AlignHCenter
                text: "Login"
                background: Rectangle {
                    color: style.surface0
                    border.color: style.surface1
                    border.width: 2
                    radius: 5
                }
                onClicked: {
                    if (passwordInput.visible) {
                        greetd.respond(passwordInput.text);
                    } else {
                        greetd.createSession(usernameInput.text);
                    }
                }
            }
        }
    }
}
