// Tabbed pane project template
#include "Imgurbb10.hpp"


using namespace bb::cascades;

Imgurbb10::Imgurbb10(bb::cascades::Application *app)
: QObject(app)
{
    // create scene document from main.qml asset
    // set parent to created document to ensure it exists for the whole application lifetime
	Upload *upload_img = new Upload();


    QmlDocument *qml = QmlDocument::create("asset:///main.qml").parent(this);
    qml->setContextProperty("uploader",upload_img);
    qml->setContextProperty("qmlhandler",this);
    // create root object for the UI
    AbstractPane *root = qml->createRootObject<AbstractPane>();
    


    // set created root object as a scene
    app->setScene(root);
}

void Imgurbb10::copyText(QByteArray text)
{

	 bb::system::Clipboard clipboard;
	 clipboard.clear();
	 clipboard.insert("text/plain", text);
	 bb::system::SystemToast *toast = new bb::system::SystemToast(this);
     toast->setBody("link was copied");
	 toast->show();
}

void Imgurbb10::openUrl(QString url)
{
//	Invocation* m_pInvocation = Invocation::create(
//	    InvokeQuery::create()
//	      .parent(this)
//	      .mimeType("text/html")
//	      .uri("http://google.com")
//	      .invokeActionId("bb.action.OPEN"));
//
//	m_pInvocation->trigger("bb.action.OPEN");
	QDesktopServices::openUrl(QUrl(url));


}
