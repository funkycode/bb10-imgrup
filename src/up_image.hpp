/*
 * up_image.hpp
 *
 *  Created on: Sep 27, 2013
 *      Author: zogg
 */

#ifndef UP_IMAGE_HPP_
#define UP_IMAGE_HPP_

#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <QFile>
#include <QObject>
#include <QString>
#include <QByteArray>
#include <QtScript/QScriptEngine>
#include <QtScriptTools/QtScriptTools>
#include <QNetworkAccessManager>
#include <QNetworkReply>
#include <QNetworkRequest>
#include <QNetworkSession>



class UploadImage : public QObject
{
	Q_OBJECT

public:

	UploadImage(int id);
	virtual ~UploadImage();
	void requestUpload(QString filename);

signals:

	    void returnImgData(int id, QString data);
	    void returnUploadProgress (int id, int percentage);

public slots:

	    void parseUploadResponse(QNetworkReply *reply);
	    void uploadProgressCalc(qint64 sent, qint64 total);

private:
	QNetworkAccessManager *nam;
	int m_id;
};

#endif /* UP_IMAGE_HPP_ */
