#ifndef Imgurbb10_HPP_
#define Imgurbb10_HPP_

#include <QObject>
#include <upload.hpp>
#include <bb/cascades/Application>
#include <bb/cascades/QmlDocument>
#include <bb/cascades/AbstractPane>
#include <bb/system/Clipboard>

#include <bb/cascades/InvokeActionItem>
#include <bb/system/SystemToast>
//#include <bb/cascades/InvokeQuery>
//#include <bb/system/InvokeManager>
//#include <bb/system/InvokeRequest>
//#include <bb/cascades/Invocation>

namespace bb { namespace cascades { class Application; }}

/*!
 * @brief Application pane object
 *
 *Use this object to create and init app UI, to create context objects, to register the new meta types etc.
 */
class Imgurbb10 : public QObject
{
    Q_OBJECT
public:
    Imgurbb10(bb::cascades::Application *app);
    Q_INVOKABLE void copyText(QByteArray text);
    Q_INVOKABLE void openUrl(QString url);
    virtual ~Imgurbb10() {}
};

#endif /* Imgurbb10_HPP_ */
