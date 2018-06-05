import QtQuick 2.6
import JAGCS 1.0

import "qrc:/Indicators" as Indicators
import "../"

TopbarButton {
    id: radioStatus

    property alias rssi: rssiItem.rssi
    property alias remoteRssi: remoteRssiItem.rssi

    implicitWidth: row.width

    onClicked: info.visible ? info.close() : info.open()

    RadioStatusPresenter {
        id: presenter
        view: radioStatus
        Component.onCompleted: updateParameters()
    }

    Row {
        id: row
        anchors.centerIn: parent
        spacing: sizings.spacing

        Indicators.RssiIndicator {
            id: rssiItem
            height: radioStatus.height
        }

        Indicators.RssiIndicator {
            id: remoteRssiItem
            height: radioStatus.height
        }
    }

    RadioStatusInfo {
        id: info
        x: parent.width - width
        y: parent.height + sizings.margins
    }
}
