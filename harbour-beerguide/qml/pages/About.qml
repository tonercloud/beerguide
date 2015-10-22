import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    id: aboutpage

    SilicaFlickable {
        id: aboutFlickable
        anchors.fill: parent
        contentWidth: aboutpage.width
        contentHeight: contentColumn.height

        Column {
            id: contentColumn
            anchors.top: parent.top
            anchors.left: parent.left
            anchors.leftMargin: Theme.paddingLarge
            anchors.right: parent.right
            anchors.rightMargin: Theme.paddingLarge
            spacing: Theme.paddingLarge

            PageHeader {
                title: qsTr("About Beerguide")
            }

            Image {
                anchors.horizontalCenter: parent.horizontalCenter
                source: "qrc:///assets/icons/harbour-beerguide.png"
            }

            Label {
                anchors.horizontalCenter: parent.horizontalCenter
                font.pixelSize: Theme.fontSizeLarge
                text: "Beerguide " + APP_VERSION
            }

            Label {
                anchors.horizontalCenter: parent.horizontalCenter
                text: "CAMRA Beers Database"
            }

            Label {
                anchors.left: parent.left
                anchors.right: parent.right
                horizontalAlignment: Text.AlignHCenter
                wrapMode: Text.WordWrap
                color: Theme.secondaryColor
                font.pixelSize: Theme.fontSizeMedium
                textFormat: Text.RichText
                text:  "<style>a:{color: " + Theme.hightlightColor +
                       "}</style><p>BeerGuide is an application written for a Jolla phone that allows a user to track consumption of beers which are listed in the CAMRA database.</p><p>The UI is implemented to allow fast searching and data entry as the most important thing is drinking, not computing.</p>"
            }

            Label {
                anchors.horizontalCenter: parent.horizontalCenter
                text: "Note"
            }

            Label {
                anchors.left: parent.left
                anchors.right: parent.right
                horizontalAlignment: Text.AlignHCenter
                wrapMode: Text.WordWrap
                color: Theme.secondaryColor
                font.pixelSize: Theme.fontSizeMedium
                textFormat: Text.RichText
                text: "<style>a{color:" + Theme.highlightColor + "}</style>When the application is run for the first time, the database is empty. The user will need to obtain a copy of the CAMRA database which will need to be copied to the phone. The data is part of an Android app which costs £4.99."
            }

            Label {
                anchors.horizontalCenter: parent.horizontalCenter
                text: "Instructions"
            }

            Label {
                anchors.left: parent.left
                anchors.right: parent.right
                horizontalAlignment: Text.AlignHCenter
                wrapMode: Text.WordWrap
                color: Theme.secondaryColor
                font.pixelSize: Theme.fontSizeMedium
                textFormat: Text.RichText
                text: "<style>a{color:" + Theme.highlightColor + "}</style>The app functions in a different way to the CAMRA guide. Here, the database is driven by a brewery name. You cannot track beers on their own. They are tied to a brewery and so the user is first presented with a list of breweries taken from the CAMRA database. If you enter a location (a pub name), the beer will be automatically marked as 'Drunk'. That is signified by the indication of an empty glass on the beer list for each brewery. Note that the pub name does not have to be a CAMRA pub. If you want to track visits to CAMRA pubs, then use the accompanying app PubGuide."
            }
        }
        VerticalScrollDecorator { flickable: contentFlickable }
    }
}
