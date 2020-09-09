import QtQuick 2.12
import QtQuick.Controls 2.12

import "./" // QTBUG-34418, singletons require explicit import to load qmldir file

/**
  mask: задаем маска ввода
  placeholder: задаем подсказку
  value: заданное значение поля
  reg: RegExp допустимые символы. Пр: /[0-9A-Z\-\ ]+/ - пробел, разделитель и "+" обезательно указываем
  */

TextField {
    id: root
    property var sep: Settings.sep
    property var reg: /[0-9A-Z\-\ ]+/
    property int len: mask.length
    property string mask: ""
    property string placeholder: ""
    property string value: ""
    property int minuses: countMinus(mask)

    property int s: 0
    property int e: 0

    signal filledOut;

    function serial() {
        return root.text
    }
    function isFilledOut() {
        return (root.text.length === len)
    }

    function setSerial(newSerial) {
        root.text = newSerial
    }

    function clear() {
        root.text = ""
    }

    function testSymbol(focus, str) {
        if (focus) return  root.mask
        if (str.length > minuses) return root.mask
        return ""
    }
    function countMinus(str) {
        var count = 0;
        for (var i = 0; i < str.length; i++) {
            if (str[i] === sep) count++;
        }

        return count;
    }



    placeholderText: placeholder
    color: focus ? "#30d5c8" : "black"
    text: value


    inputMask: testSymbol(focus, text)
    validator: RegExpValidator { regExp: reg }


    onTextChanged: if (text.length == len) {
                       nextItemInFocusChain().forceActiveFocus(Qt.TabFocusReason);
                       filledOut()
                   }
    TextMetrics {
        id: fm
        font: root.font
    }

    Pop {
        id: pop
        visible: false
        x:80
        y:80
    }
// LK

    function mouseClick(mouseX, mouseY) {
        fm.text = "";
        var s = 0;
        var e = 0;
        var sel = false;
        for (var i = 0; i < text.length; i++) {
            fm.text += text[i];
            if (text[i] === sep)
                if (mouseX <= fm.width) break;

            if (text[i] === sep) s = i+1;
            e = i;
        }

        root.select(s,e+1)
        root.focus = true;

        root.s = s
        root.e = e + 1

        pop.show(root, mouseX, mouseY)
    }

    MouseArea {
        anchors.fill: parent
        propagateComposedEvents: true
        onClicked: mouseClick(mouseX, mouseY)
    }
}
