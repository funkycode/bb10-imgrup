// Tabbed pane project template
#include "Imgurbb10.hpp"

#include <bb/cascades/Application>
#include <bb/cascades/pickers/FilePicker>
#include <QLocale>
#include <QTranslator>
#include <Qt/qdeclarativedebug.h>

using namespace bb::cascades;

Q_DECL_EXPORT int main(int argc, char **argv)
{

//	        qmlRegisterUncreatableType<bb::cascades::pickers::FilePickerMode>("bb.cascades.pickers", 1, 0, "FilePickerMode", "");
//	        qmlRegisterUncreatableType<bb::cascades::pickers::FilePickerSortFlag>("bb.cascades.pickers", 1, 0, "FilePickerSortFlag", "");
//	        qmlRegisterUncreatableType<bb::cascades::pickers::FilePickerSortOrder>("bb.cascades.pickers", 1, 0, "FilePickerSortOrder", "");
//	        qmlRegisterUncreatableType<bb::cascades::pickers::FileType>("bb.cascades.pickers", 1, 0, "FileType", "");



    // this is where the server is started etc
    Application app(argc, argv);

    // localization support
    QTranslator translator;
    QString locale_string = QLocale().name();
    QString filename = QString( "imgurbb10_%1" ).arg( locale_string );
    if (translator.load(filename, "app/native/qm")) {
        app.installTranslator( &translator );
    }
    qmlRegisterType<bb::cascades::pickers::FilePicker>("bb.cascades.pickers", 1, 0, "FilePicker");
    // create the application pane object to init UI etc.
    new Imgurbb10(&app);

    // we complete the transaction started in the app constructor and start the client event loop here
    return Application::exec();
    // when loop is exited the Application deletes the scene which deletes all its children (per qt rules for children)
}
