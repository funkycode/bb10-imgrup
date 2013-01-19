// Tabbed Pane project template
import bb.cascades 1.0

TabbedPane {
     id : mainPage
    showTabsOnActionBar: true
    
    Tab {
        title: qsTr("Upload")
        imageSource: ""
        
        UploadTab {
            id: uploadTab
        }
       
    }
    Tab {
        title: qsTr("Tab 2")
        Page {
            id: tab2
            actions: [
            // define the actions for tab here
            ActionItem {
                    title: qsTr("Raise")
                    onTriggered: {
                        // run the image animation
                        raiseAnimation.play();
                    }
                }
            ]
            Container {
                // define tab content here
                Label {
                    text: qsTr("Tab 2 title")
                    horizontalAlignment: HorizontalAlignment.Center
                    textStyle {
                        base: SystemDefaults.TextStyles.TitleText
                    }
                }
                ImageView {
                    id: imgTab2
                    imageSource: "asset:///images/picture1.png"
                    verticalAlignment: VerticalAlignment.Center
                    horizontalAlignment: HorizontalAlignment.Center
                    layoutProperties: StackLayoutProperties {
                        spaceQuota: 1.0
                    }
                    scalingMethod: ScalingMethod.AspectFit
                    opacity: 0.2
                    animations: [
                        // define animations for image here
                        ParallelAnimation {
                            id: raiseAnimation
                            FadeTransition {fromOpacity: 0.2; toOpacity: 1; duration: 1000}
                            ScaleTransition {fromX: 1; fromY: 1; toX: 1.5; toY: 1.5; duration: 1000; easingCurve: StockCurve.DoubleElasticOut}
                        }
                    ]
                }
            }
        }
    }
    onCreationCompleted: {
        // this slot is called when declarative scene is created
        // write post creation initialization here
        console.log("TabbedPane - onCreationCompleted()")

        // enable layout to adapt to the device rotation
        // don't forget to enable screen rotation in bar-bescriptor.xml (Application->Orientation->Auto-orient)
        OrientationSupport.supportedDisplayOrientation = SupportedDisplayOrientation.All;
    }
}
