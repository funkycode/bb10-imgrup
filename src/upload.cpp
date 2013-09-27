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
	UploadImage *imgToUpload = new UploadImage(-1);
    connect(imgToUpload, SIGNAL(returnImgData(int, QString)), this, SLOT(getImgUrl(int, QString)));
    connect(imgToUpload, SIGNAL(returnUploadProgress (int, int)),this,SLOT(getUploadProgress(int, int)));
}

Upload::~Upload()
{

}

void Upload::getImgUrl(int id, QString data){
	emit returnImgUrl(id, data);
}
void Upload::getUploadProgress (int id, int percentage){
	emit returnUploadProgress (id, percentage);
}

void Upload::uploadRequest(QString filename, int id)
{

	UploadImage *imgToUpload = new UploadImage(id);
	imgToUpload->requestUpload(filename);



}










