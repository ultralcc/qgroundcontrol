import QtQuick          2.3
import QtQuick.Controls 1.2
import QtQuick.Layouts  1.2
import QtGraphicalEffects 1.0

import QGroundControl.ScreenTools   1.0
import QGroundControl.Palette       1.0

FocusScope {
    id:     _root
    height: column.height

    property alias          color:          label.color
    property alias          text:           label.text
    property bool           checked:        true
    property bool           showSpacer:     true
    property ExclusiveGroup exclusiveGroup: null

    property real   _sectionSpacer: ScreenTools.defaultFontPixelWidth / 2  // spacing between section headings

    onExclusiveGroupChanged: {
        if (exclusiveGroup)
            exclusiveGroup.bindCheckable(_root)
    }

    QGCPalette { id: qgcPal; colorGroupEnabled: enabled }

    QGCMouseArea {
        anchors.fill: parent

        onClicked: {
            _root.focus = true
            checked = !checked
        }
        Rectangle{
            radius: 8
            color: qgcPal.primaryColor
            anchors.margins: 20
            ColumnLayout {
                id:             column
                anchors.left:   parent.left
                anchors.right:  parent.right


                QGCLabel {
                    id:                 label
                    Layout.fillWidth:   true
                
                }

                Rectangle {
                    Layout.fillWidth:   true
                    height:             1
                    color:              qgcPal.text
                }
            }
        }
    }
}
