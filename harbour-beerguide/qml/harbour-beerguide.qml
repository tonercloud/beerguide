import QtQuick 2.0
import Sailfish.Silica 1.0
import "pages"

ApplicationWindow {
    id: appWindows

    initialPage: Component { BreweryListPage { } }
    cover: Qt.resolvedUrl("cover/CoverPage.qml")
}
