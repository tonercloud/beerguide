import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    id: brewerydetailspage

    property var breweryDetails

    function passbrewery_info(breweryid)
    {
        console.log("about to push to BeerListPage, for brewery - locid: " +
                    breweryid)
                     // breweryid.locid + " + brewery name : " + breweryDetails.locname)
        // this is where the filtering happens to ensure that beersmodel will contain only a few rows
        beersmodel.setFilterFixedString(breweryid)
        pageStack.push(Qt.resolvedUrl("BeerListPage.qml"),
                       { breweryname : breweryDetails });
        console.log("breweryid contains : " + breweryid + " and breweryname contains : " + breweryDetails)
    }

    SilicaListView {
        id: listView
        model: breweryInfomodel
        anchors.fill: parent
        header: PageHeader {
            title: "Details of " + breweryDetails
            }

        delegate: BackgroundItem {
            id: delegate

            // set height to fit info_field text but not less than Theme.itemSizeSmall
            height: Math.max(info_field.height, Theme.itemSizeSmall)

            Label {
                id: info_field
                width: parent.width
                // text: locfieldid + " : " + locfieldvalue
                text: locfieldvalue
                font.pixelSize: Theme.fontSizeSmall
                color: Theme.primaryColor
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
