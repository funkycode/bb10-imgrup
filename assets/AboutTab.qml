import bb.cascades 1.0


Page {
    id: aboutTab
    Container {
        topMargin: 50
        topPadding: 50
                    leftPadding: 50
                    rightPadding: 50
        Label {
            id: headerLabel
            text: "ABOUT"
            
            horizontalAlignment: HorizontalAlignment.Center
            verticalAlignment: VerticalAlignment.Center
            textStyle {
                base: SystemDefaults.TextStyles.TitleText
                color: Color.create("#7e7b7b")
                fontSizeValue: 35
            }
        }
        Label {
            
             id: infoLabel
                        text: "This is simple imgur uploader, currently it just upload images. But i'm planning to add sharing, upload from camera and few more functions"
                        topMargin: 50
                        topPadding: 50
                        leftPadding: 50
                        rightPadding: 50
                        horizontalAlignment: HorizontalAlignment.Center
                        textStyle {
                            base: SystemDefaults.TextStyles.TitleText
                            fontSizeValue: 20
                            textAlign: justify
                            
                        }
                        multiline: true
            
        }
         Label {
                    
                     id: authorLabel
                                text: "by ZogG (thezogg@gmail.com)"
                                topMargin: 50
                                topPadding: 50
                                rightPadding: 25
                                horizontalAlignment: HorizontalAlignment.Right
                                textStyle {
                                    base: SystemDefaults.TextStyles.TitleText
                                    fontSizeValue: 15
                                }
                    
                }

}
}
