// Tabbed pane project template
#include "Imgurbb10.hpp"
#include <upload.hpp>
#include <bb/cascades/Application>
#include <bb/cascades/QmlDocument>
#include <bb/cascades/AbstractPane>

using namespace bb::cascades;

Imgurbb10::Imgurbb10(bb::cascades::Application *app)
: QObject(app)
{
    // create scene document from main.qml asset
    // set parent to created document to ensure it exists for the whole application lifetime
	Upload upload_img;
    QmlDocument *qml = QmlDocument::create("asset:///main.qml").parent(this);

    // create root object for the UI
    AbstractPane *root = qml->createRootObject<AbstractPane>();
    qml->setContextProperty("uploader",&upload_img);


    // set created root object as a scene
    app->setScene(root);
}
