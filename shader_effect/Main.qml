import QtQuick
import QtQuick.Window

Window {
    width: 400
    height: 480
    maximumHeight: 480
    minimumHeight: 480
    maximumWidth: 400
    minimumWidth: 400
    visible: true
    title: qsTr("Shader Effict")


    Rectangle {

        anchors.fill: parent

        Image {
            id: img

            anchors.fill: parent
            source: "qrc:/images/image/my_image.jpg"
            // creating black and white ShaderEffect
            ShaderEffect {
                anchors.fill: parent

                // variable for vertexShader file to reference img id
                property variant src: img

                // path to .vert file and .frag file
                vertexShader: "qrc:/shaders/black_white.vert.qsb"
                fragmentShader: "qrc:/shaders/black_white.frag.qsb"
            }
        }
    }


}
