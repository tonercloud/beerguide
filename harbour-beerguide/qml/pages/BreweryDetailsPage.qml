import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    id: brewerydetailspage

    // property var breweryDetails
    property var information

    function passbrewery_info(breweryid)
    {
        console.log("about to push to BeerListPage, for brewery - locid: " +
                    breweryid)
                     // breweryid.locid + " + brewery name : " + breweryDetails.locname)
        // this is where the filtering happens to ensure that beersmodel will contain only a few rows
        beersmodel.setFilterFixedString(breweryid)
        pageStack.push(Qt.resolvedUrl("BeerListPage.qml"),
                       { breweryid : breweryid });
        console.log("breweryid contains : " + breweryid)
    }

    SilicaListView {
        id: listView
        model: breweryInfomodel
        anchors.fill: parent
        header: PageHeader {
            title: "Details of " + locname
            }

        delegate: BackgroundItem {
            id: delegate

            // set height to fit info_field text but not less than Theme.itemSizeSmall
            height: Math.max(info_field.height, Theme.itemSizeSmall)

            Label {
                id: info_field
                width: parent.width
                text: model.locfieldvalue
                // text: "Locfieldid : " + locfieldid
                font.pixelSize: Theme.fontSizeSmall
                color: delegate.highlighted ? Theme.highlightColor : Theme.primaryColor
                wrapMode: Text.WordWrap

                anchors {
                    left: parent.left
                    right: parent.right
                    margins: Theme.paddingLarge
                }
            }
            onClicked: {
                passbrewery_info(locid);
                }
        }
    }
}
