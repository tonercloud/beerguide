import QtQuick 2.0
import Sailfish.Silica 1.0

// Adaptive Filtering
// import "../AdaptiveSearch"

Page {
    id: brewerylistpage

    property string information: ""

    function passbreweryDetails(information)
    {
        console.log("about to push to BreweryDetailsPage, for brewery - locid: " + information)
                     // locid + ", locname: " + locname)
        // this is where the filtering happens - breweryInfomodel will contain only a few rows
        breweryInfomodel.setFilterFixedString(locid);

        // pageStack.push(Qt.resolvedUrl("BreweryDetailsPage.qml"), { breweryDetails : information });
    }

    SilicaListView {
        id: blistView
        model: breweriesmodel
        anchors.fill: parent
        header: PageHeader {
            title: "CAMRA Breweries List"
        }
        PushUpMenu {
            MenuItem {
                text: "Go to top"
                onClicked: blistView.scrollToTop()
            }
        }
        PullDownMenu {
            MenuItem {
                text: qsTr("About");
                onClicked: {
                    pageStack.push(Qt.resolvedUrl("About.qml"))
                }
            }
        }

        delegate: BackgroundItem {
            id: delegate

            // width: parent.width

            Label {
                id: breweryname_field
                // anchors.verticalCenter: parent.verticalCenter
                // width: parent.width - Theme.paddingLarge
                x: Theme.paddingLarge
                // wrapMode: Text.Wrap
                // font.pixelSize: Theme.fontSizeMedium
                text: model.locname
                // text: locname
                color: delegate.highlighted ? Theme.highlightColor : Theme.primaryColor
            }
            // onClicked: console.log("breweryDetails : " + locid + "," + locname)
            // onClicked: pageStack.push(Qt.resolvedUrl("BreweryDetailsPage.qml"), { information : locid + "," + locname });
            // onClicked: passbreweryDetails(information);
        }
        VerticalScrollDecorator {}
    }
}
