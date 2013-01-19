/*
 * upload.hpp
 *
 *  Created on: Jan 19, 2013
 *      Author: zogg
 */




#ifndef UPLOAD_HPP_
#define UPLOAD_HPP_


#include <QObject>
#include <QString>
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <QByteArray>
#include <QtScript/QScriptEngine>
#include <QtScriptTools/QtScriptTools>
#include <QNetworkAccessManager>
#include <QNetworkReply>
#include <QNetworkRequest>
#include <QNetworkSession>

class Upload : public QObject
{
    Q_OBJECT

public:


    Upload(QObject *parent = 0);
    ~Upload();


    Q_INVOKABLE void upload_request(QString filename);


signals:

    void resulturl(QString data);
    void resultprogress (int percentage);

public slots:

    void parser(QNetworkReply *reply);
    void progresscalc(qint64 sent, qint64 total);







private:

    QNetworkAccessManager *nam;

};







#endif /* UPLOAD_HPP_ */
