// Tabbed Pane project template
import bb.cascades 1.0

TabbedPane {
     id : mainPage
    showTabsOnActionBar: true
    
 
    
    Tab {
        title: qsTr("Upload")
        imageSource: "asset:///images/upload-tab.png"
        
        UploadTab {
            id: uploadTab
        }
       
    }
        Tab {
                title: qsTr("About")
                imageSource: "asset:///images/about-tab.png"
                
                AboutTab {
                    id: aboutTab
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
