import QtQuick 2.6
import QtQuick.Layouts 1.3
import JAGCS 1.0

import "qrc:/JS/helper.js" as Helper
import "qrc:/Controls" as Controls

RowLayout {
    id: logView

    property var log

    Controls.Label {
        id: timestamp
        anchors.verticalCenter: parent.verticalCenter
        text: log ? "[" + Helper.formatTime(log.timestamp) + "]" : ""
        font.pixelSize: sizings.fontSize * 0.6
        font.bold: true
        color: label.color
    }

    Controls.Label {
        id: label
        text: log ? log.message : ""
        font.pixelSize: sizings.fontSize * 0.6
        color: {
            if (!log) return customPalette.backgroundColor;

            switch (log.type) {
            case Notification.Common: return customPalette.textColor;
            case Notification.Positive: return customPalette.positiveColor;
            case Notification.Warning: return customPalette.cautionColor;
            case Notification.Critical: return customPalette.dangerColor;
            }
        }
        Layout.fillWidth: true
    }
}
