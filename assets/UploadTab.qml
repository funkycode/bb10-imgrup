import bb.cascades 1.0
import bb.cascades.pickers 1.0
import QtQuick 1.0

Page {
    id: uploadTab
    
    Container {
                    topPadding: 50
     
                    ListView {
                        id: imgListView
                        dataModel: filesList
                        
                        listItemComponents: [
                            /*ListItemComponent {
                                type: "header"
                                
                                Header {
                                    title: ListItemData
                                }
                            },
                            */
                            ListItemComponent {
                                type: "listItem"
                                id: listItem
                                UploadImageItem{
                                    text: ListItem.data.test.toString()
                                    imgurID: ListItemData.test
                                    fileName: ListItemData.fileName
                                }
                            }
                        ]
                    }
            
            
            
         /*   
            
                     
        Container {
            // horizontalAlignment: HorizontalAlignment.Center
            layout: StackLayout {
                orientation: LayoutOrientation.LeftToRight
            }
            leftMargin: 20
            rightMargin: 20
            leftPadding: 20
            rightPadding: 20
            bottomPadding: 20
            visible: (url === "") ? false : true
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
                              invokeQuery.mimeType = "text/plain"
				              invokeQuery.data = url + " ";
				              invokeQuery.updateQuery();
                            }                                 
        }
    }
        Container {
            // horizontalAlignment: HorizontalAlignment.Center
            layout: StackLayout {
                orientation: LayoutOrientation.LeftToRight
            }
            topPadding: 20
            leftMargin: 20
            rightMargin: 20
            leftPadding: 20
            rightPadding: 20
            //  visible: (selectedFile === "") ? false :true
            
                onTouch: {                                   
                    filePicker.open()
                    hintLabel.visible = false
                    uploadPicture.visible = true
                }
                onImageSourceChanged: 
                    {
                        console.log("Image source trigger")
                        
                        
                    }
            }
            
        }
        Container {
            topPadding: 20
            horizontalAlignment: HorizontalAlignment.Center
            verticalAlignment: VerticalAlignment.Center
      
        Button {
            id: uploadPicture
            horizontalAlignment: HorizontalAlignment.Center
            verticalAlignment: VerticalAlignment.Center
            text: "Upload"
             visible: false
            onClicked: {
                //console.log("selected file is " + selectedFile);
                uploadProgress.visible = true;
                uploadPicture.visible = false;
                uploader.uploadRequest(1 ,selectedFile);
            }
        }
          Label {
                    id: hintLabel
                    text: "TAP THE IMAGE TO UPLOAD MORE"
                    topMargin: 20
                    visible : false
                    horizontalAlignment: HorizontalAlignment.Center
                    textStyle {
                        base: SystemDefaults.TextStyles.TitleText
                        color: Color.create("#7e7b7b")
                        fontSizeValue: 22
                    }
    }
    }
    */
    Button {
    id: imgPicker
    text: "Choose image to upload"
    visible: (selectedFile == "") ? true : false
    onClicked: {
    filePicker.open();
    }                                 
    }
    
    attachedObjects: [
        GroupDataModel {
            id: filesList
            objectName: "filesList"
        },
        FilePicker {
            id: filePicker

            //property string selectedFile
            type: FileType.Picture
            title: "Select Picture"
            mode: FilePickerMode.PickerMultiple
            directories: [
                "/accounts/1000/shared/"
            ]
            // viewmode : FilePickerViewMode.GridView
//            onPickerClosed: {
//                
//                dataModel.clear();
//                dataModel.insert(item);
//               // imgListView.model
//                
//            }
            onFileSelected: {
                 
                filesList.clear();
                filesList.insert(
                    {
                            "fileName": "file://" + selectedFiles[0],
                            "test" : "test"
                    }
                );
                
                  console.log("FileSelected signal received : " + selectedFiles);
                // testText.text = " test2 " + selectedFiles;
                 // selectedFile = "file://" + selectedFiles[0];
            }
        },
        Connections {
            target: uploader
            onReturnImgUrl: {
                console.log("qml id : " + id);
                url = data;
                urlLabel.text = data;
                uploadPicture.visible = false;
                hintLabel.visible = true;
            }
            onReturnUploadProgress: {
                console.log("qml id : " + id);
                uploadProgress.value = percentage;
                if (percentage === 100) uploadProgress.visible = false;
            }
        },
	    Invocation {
	       id: invokeShare
	       query: InvokeQuery {
	           id:invokeQuery
	           mimeType: "text/plain"                        
	       }
	       onArmed: {
	           if (invokeQuery.data != "") {
	               trigger("bb.action.SHARE");
	           }
	       }             
	    }
    ]
  
  }
 }

