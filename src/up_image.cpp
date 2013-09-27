/*
 * up_image.cpp
 *
 *  Created on: Sep 27, 2013
 *      Author: zogg
 */

#include "keys.h"
#include "up_image.hpp"

UploadImage::UploadImage(int id)
:m_id(id),
 nam(new QNetworkAccessManager(this))
{

}

UploadImage::~UploadImage() {

}




void UploadImage::parseUploadResponse(QNetworkReply *reply)      //parsing data due to request
{
	if (reply->error() != QNetworkReply::NoError)
	{
		QString errtest = reply->errorString();
		qDebug() << "error: "<<errtest<<endl;
	}
    QString response = reply->readAll();
    QScriptValue sc;
    QScriptEngine engine;
    qDebug() << "test: "<<response;
    sc = engine.evaluate("("+ QString(response)+ ")");
    QString data;
    qDebug() << "url: "<<sc.property("upload").property("links").property("original").toString();
    data = sc.property("upload").property("links").property("original").toString();
    emit returnImgData(m_id, data);
    reply->close();
 }

void UploadImage::uploadProgressCalc( qint64 sent, qint64 total)
{
    double sent_p = sent;
    double total_p = total;
    double percentagedouble = (sent_p/total_p) * 100;
  //  int percentage = percentagedouble;
    emit returnUploadProgress (m_id, (int)percentagedouble);
}




void UploadImage::requestUpload(QString filename)
{
	    filename.remove(0,7);   // "file://","",1);
	    qDebug() << "file is : "<< filename;

	    QUrl url("http://api.imgur.com/2/upload.json");
	    QNetworkRequest request;
	    request.setUrl(url);

	    QString key=KEY;
	    QString keyAnon=ANON_KEY;
	    QString secret=SECRET;
	    QString method="HMAC-SHA1";
	    QString version ="1.0";

	    QByteArray postdata;
	    QFile imgFile(filename);

	    if (!imgFile.open(QIODevice::ReadOnly)){

	        qDebug() << "can't read file" << endl;
	        //TODO : add error handling;
	        return;
	    }
	    QByteArray fileData = imgFile.readAll().toBase64();
	    imgFile.close();


	    //POST data
	    postdata.append(QString("key=").toUtf8());
	    postdata.append(QUrl::toPercentEncoding(keyAnon));
	    postdata.append(QString("&image=").toUtf8());
	    postdata.append(QUrl::toPercentEncoding(fileData));
	    //END POST data
	    connect(nam, SIGNAL(finished(QNetworkReply*)), this, SLOT(parseUploadResponse(QNetworkReply*)));

	    QNetworkReply *reply = nam->post(request, postdata);
	    connect(reply, SIGNAL(uploadProgress(qint64,qint64)), this, SLOT(uploadProgressCalc(qint64,qint64)));
}
