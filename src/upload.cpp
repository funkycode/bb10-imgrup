/*
 * upload.cpp
 *
 *  Created on: Jan 19, 2013
 *      Author: zogg
 */

#include "upload.hpp"
#include "up_image.hpp"


Upload::Upload()//(QObject *parent)
   // : QObject(parent),
{
	//dummy one for connection

}

Upload::~Upload()
{

}

void Upload::getImgUrl(int id, QString data){
	 qDebug() << "id  : "<< id <<" data "<< data;

	emit returnImgUrl(id, data);
}
void Upload::getUploadProgress (int id, int percentage){
	 qDebug() << "id : "<< id << " % is" <<percentage ;

	emit returnUploadProgress (id, percentage);
}

void Upload::uploadRequest(int id, QString filename)
{

	UploadImage *imgToUpload = new UploadImage(id);
	connect(imgToUpload, SIGNAL(returnImgData(int, QString)), this, SLOT(getImgUrl(int, QString)));
	connect(imgToUpload, SIGNAL(returnUploadProgress (int, int)),this,SLOT(getUploadProgress(int, int)));
	imgToUpload->requestUpload(filename);



}










