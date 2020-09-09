import QtQuick 2.12

import My 1.0


Image {
    id: image
    source: '/Popover.svg'
    visible: root ? false : (root.selectedText.length > 0)
    property var root: false

    function show(root, x,y) {
        image.root = root
        image.x = x - 20;
        image.y = y - 46;
        image.visible = (root.selectedText.length > 0)
        console.log("root.selectedText:", root.selectedText)
        console.log("root.selectedText.length:", root.selectedText.length)
    }

    Text {
        id: element
        text: qsTr("Paste")
        color: hovered ? "green" : "red"
        anchors.verticalCenterOffset: -11
        anchors.horizontalCenterOffset: 1
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        font.pixelSize: 12

        function b2r() { // buffer to root
            var buf = My.readBuffer();
            console.log("My.readBuffer():", buf)
            if (buf.length == root.e - root.s)
                root.paste()

            console.log (buf.length, root.e, root.s)
//            console.log(image.root.)
//            Buffer buffer; 000
        }

        MouseArea {
            anchors.fill: parent
            hoverEnabled: true

            onClicked: if (root) {
                           element.b2r()
                           console.log("root")
                           console.log(root)
                       }
        }
    }
}

/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
##^##*/
