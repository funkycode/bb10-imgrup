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
#include "up_image.hpp"

class Upload : public QObject
{
    Q_OBJECT

public:


    Upload();
    ~Upload();
    Q_INVOKABLE void uploadRequest(int id, QString filename);

    signals:

    	    void returnImgUrl(int id, QString data);
    	    void returnUploadProgress (int id, int percentage);

    public slots:

    	    void getImgUrl(int id, QString data);
    	    void getUploadProgress (int id, int percentage);

private:


};







#endif /* UPLOAD_HPP_ */
