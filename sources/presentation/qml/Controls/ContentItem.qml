import QtQuick 2.6

Item {
    id: content

    property color textColor: palette.textColor
    property color iconColor: textColor
    property real iconScaling: 0.6

    property alias iconSource: icon.source
    property alias font: label.font
    property alias text: label.text
    property alias horizontalAlignment: label.horizontalAlignment

    clip: true
    implicitWidth: (icon.visible ? icon.width + row.spacing : 0) + label.implicitWidth
    implicitHeight: row.implicitHeight

    Row {
        id: row
        anchors.centerIn: parent
        spacing: sizings.spacing

        ColoredIcon {
            id: icon
            color: enabled ? iconColor : palette.sunkenColor
            anchors.verticalCenter: parent.verticalCenter
            height: content.height * iconScaling
            width: height
            visible: source != ""
        }

        Label {
            id: label
            font.pixelSize: sizings.fontPixelSize
            color: enabled ? textColor : palette.sunkenColor
            anchors.verticalCenter: parent.verticalCenter
            verticalAlignment: Text.AlignVCenter
            visible: !icon.visible || label.implicitWidth < content.width - row.spacing - icon.width
        }
    }
}
