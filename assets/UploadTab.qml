import bb.cascades 1.0
import bb.cascades.pickers 1.0
import QtQuick 1.0

Page {
    id: uploadTab
    property string selectedFile: ""
    property string imgIdonImgur: ""
    property string url: ""
    Container {
                    topPadding: 50
        Label {
            id: urlLabel
            text: (selectedFile === "") ? "NO FILE IS CHOSEN YET" : "PUSH THE BUTTON TO UPLOAD:"
            topMargin: 50

            horizontalAlignment: HorizontalAlignment.Center
            textStyle {
                base: SystemDefaults.TextStyles.TitleText
                color: Color.create("#7e7b7b")
                fontSizeValue: 22
            }
            
        }
                                
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
            ImageView {
                id: previewImage
                imageSource: selectedFile
                maxHeight: 380
                // maxWidth: 380
                scalingMethod: ScalingMethod.AspectFit
                visible: (selectedFile === "") ? false : true
                layoutProperties: StackLayoutProperties {
                    spaceQuota: 1
                }            
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
        }
        Container {
            topPadding: 20
            horizontalAlignment: HorizontalAlignment.Center
            verticalAlignment: VerticalAlignment.Center
        Button {
            id: imgPicker
            text: "Choose image to upload"
            visible: (selectedFile == "") ? true : false
            onClicked: {
                filePicker.open();
                uploadPicture.visible = true;
            }                                 
        }
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
                uploader.upload_request(selectedFile);
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
    attachedObjects: [
        FilePicker {
            id: filePicker

            //property string selectedFile
            type: FileType.Picture
            title: "Select Picture"
            directories: [
                "/accounts/1000/shared/"
            ]
            // viewmode : FilePickerViewMode.GridView
            onFileSelected: {
                //  console.log("FileSelected signal received : " + selectedFiles);
                // testText.text = " test2 " + selectedFiles;
                selectedFile = selectedFiles[0];
            }
        },
        Connections {
            target: uploader
            onResulturl: {
                url = data;
                urlLabel.text = data;
                uploadPicture.visible = false;
                hintLabel.visible = true;
            }
            onResultprogress: {
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

