import QtQuick 2.6
import QtQuick.Layouts 1.3

import "qrc:/Controls" as Controls
import "qrc:/Indicators" as Indicators

GridLayout {
    id: root

    property bool online: false
    property bool armed: false
    property string mode: qsTr("None")
    property real batteryVoltage: 0
    property real batteryCurrent: 0
    property alias batteryPercentage: battery.percentage

    signal commandArmDisarm(bool arm)

    columns: 4

    Indicators.BatteryIndicator {
        id: battery
        Layout.alignment: Qt.AlignRight
    }

    Controls.Label {
        font.pixelSize: palette.fontPixelSize * 0.75
        font.bold: true
        color: battery.color
        text: batteryVoltage.toFixed(2) + qsTr(" V")
    }

    Controls.ColoredIcon {
        id: current
        source: "qrc:/icons/current.svg"
        implicitWidth: palette.controlBaseSize
        implicitHeight: width
        color: {
            if (batteryCurrent < -0.01)
                return palette.positiveColor;
            if (batteryCurrent > 0.01)
                return palette.neutralColor;

            return palette.textColor;
        }
        Layout.alignment: Qt.AlignRight
    }

    Controls.Label {
        font.pixelSize: palette.fontPixelSize * 0.75
        font.bold: true
        color: current.color
        text: batteryCurrent.toFixed(2) + qsTr(" A")
    }

    Controls.Switch {
        text: armed ? qsTr("DISARM") : qsTr("ARM")
        inputChecked: armed
        onCheckedChanged: commandArmDisarm(checked)
        font.pixelSize: palette.fontPixelSize * 0.75
        font.bold: true
        Layout.fillWidth: true
        Layout.columnSpan: 2
    }

    Controls.Label {
        font.pixelSize: palette.fontPixelSize * 0.75
        font.bold: true
        text: mode
        color: {
            if (!online) return palette.disabledColor;
            if (!armed) return palette.negativeColor;
            return palette.textColor;
        }
        horizontalAlignment: Qt.AlignHCenter
        Layout.fillWidth: true
        Layout.columnSpan: 2
    }
}