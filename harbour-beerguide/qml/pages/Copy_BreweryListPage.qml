import QtQuick 2.0
import Sailfish.Silica 1.0

// Adaptive Filtering
import "../AdaptiveSearch"

Page {
    id: brewerylistpage

    function passbreweryDetails(breweryDetails)
    {
        console.log("about to push to BreweryDetailsPage, for brewery - locid: " +
                    breweryDetails.locid + ", locname: " + breweryDetails.locname)

        // this is where filtering happens. breweryInfomodel will contain only a few rows
        breweryInfomodel.setFilterFixedString(breweryDetails.locid);
        // breweryInfomodel.filter("locid", breweryDetails.locid);

                pageStack.push(Qt.resolvedUrl("BreweryDetailsPage.qml"),
                               { breweryDetails : breweryDetails });
    }

    SilicaListView {
        id: blistView
        model: breweriesmodel
        anchors.fill: parent
        header: PageHeader {
            title: qsTr("CAMRA Breweries List")
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

        AdaptiveSearch {
            id: adaptive
            anchors.fill: parent
            model: breweriesmodel

            onFilterUpdated: {
                blistView.model = adaptive.filtermodel
            }
        }

        delegate: BackgroundItem {
            id: delegate

            Label {
                id: breweryname_field
                x: Theme.paddingLarge
                text: locname
                anchors.verticalCenter: parent.verticalCenter
                color: delegate.highlighted ? Theme.highlightColor : Theme.primaryColor
            }
            // onClicked: passbreweryDetails(locid)
            onClicked: pageStack.push(Qt.createComponent("BreweryDetailsPage.qml"), { information : locid + locname });
        }
        VerticalScrollDecorator {}
    }
}
