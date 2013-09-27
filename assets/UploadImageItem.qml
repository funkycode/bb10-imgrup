import bb.cascades 1.0

Container {
    property alias fileName: previewImage.imageSource
    property string imgurID: ""
    property alias imgUrl: urlLabel.text
    property alias text: testLabel.text
    
    onTextChanged: {
        console.log("Text has changed to:", text)
    }
    onFileNameChanged: {
        console.log("Text has changed to:", fileName)
        previewImage.imageSource = fileName
        
    }
    layout: StackLayout {
    orientation: LayoutOrientation.LeftToRight
    }
    
    Label {
     	id: testLabel
     	text: "test"   
    }
    
    Container{
        ImageView {
            id: previewImage
            //imageSource: ListItemData.fileName
            imageSource: fileName
            maxHeight: 380
            // maxWidth: 380
            scalingMethod: ScalingMethod.AspectFit
            
            layoutProperties: StackLayoutProperties {
                spaceQuota: 1
            }  
            onImageSourceChanged: 
            {
                console.log("Image source trigger")
            
            
            } 
        }         
       
        
        Container {
            layout: StackLayout {
                orientation: LayoutOrientation.TopToBottom
            }
            Container {
                ProgressIndicator {
                    verticalAlignment: VerticalAlignment.Center
                    id: uploadProgress
                    visible: false
                    layoutProperties: StackLayoutProperties {
                        spaceQuota: 2
                    }
                    fromValue: 0
                    toValue: 100
                }
                
                Label {
                    id: urlLabel
                    text: imgurID
                        //imgUrl //(imgUrl === "") ? "" : imgUrl
                   // topMargin: 50
                    
                    horizontalAlignment: HorizontalAlignment.Center
                    textStyle {
                        base: SystemDefaults.TextStyles.TitleText
                        color: Color.create("#7e7b7b")
                        fontSizeValue: 12
                    }
                
                }
                
                Container {
                    id: controlButtons
                    layout: StackLayout {
                        orientation: LayoutOrientation.LeftToRight
                    }
                    Button {
                        id: openButton
                        text: "open"
                        layoutProperties: StackLayoutProperties {
                            spaceQuota: 1
                        }
                        onClicked: {            
                            qmlhandler.openUrl(url)
                        
                        }
                    }
                    Button {
                        id: copyButton
                        layoutProperties: StackLayoutProperties {
                            spaceQuota: 1
                        }
                        text: "copy"
                        onClicked: {
                            qmlhandler.copyText(url);
                        }
                    
                    }   
                    Button {
                        id: shareButton
                        layoutProperties: StackLayoutProperties {
                            spaceQuota: 1
                        }
                        text: "share"
                        onClicked: {
                            /*
                            invokeQuery.mimeType = "text/plain"
                            invokeQuery.data = url + " ";
                            invokeQuery.updateQuery();
                            */
                        }                                 
                    }
                }
            }
        }
        
        
        
    
    }
}

