import bb.cascades 1.0
import bb.cascades.pickers 1.0

 Page {
            id: uploadTab
            
            property string selectedFile
           
               Container {
                 Label {
                    text: qsTr("Upload Tab")
                    horizontalAlignment: HorizontalAlignment.Center
                    textStyle {
                        base: SystemDefaults.TextStyles.TitleText
                    }
                }
                
                
                
                
                
                Button 
                {
                    id: imgPicker
                    text: "Choose image to upload"
                    onClicked: {
                                filePicker.open()
                                    }
                }
                
                Button 
                {
                    id: uploadPickture
                                        text: "Upload "
                                        onClicked: {
                                                         uploader.upload_request(selectedFile);
                                                        }
                }

                 Label {
                     id: testText
                     text: "test"
                     
                 }
                  Label {
                                      id: testText2
                                      text: " Selected file is " + selectedFile
                                      
                        }
                        
                        
                        
                        
                                  
            }
            
             attachedObjects: [
                                   FilePicker {
                                                      id:filePicker
                                                      
                                                      //property string selectedFile
                                                       
                                                      type : FileType.Picture
                                                      title : "Select Picture"
                                                      directories : ["/accounts/1000/shared/"]
                                                     // viewmode : FilePickerViewMode.GridView
                                                      onFileSelected : {
                                                          console.log("FileSelected signal received : " + selectedFiles);
                                                          testText.text = " test2 " + selectedFiles;
                                                          
                                                          uploadTab.selectedFile = selectedFiles[0];
                                                          
                                                      }
                                                  }
                                              ]
            
        }