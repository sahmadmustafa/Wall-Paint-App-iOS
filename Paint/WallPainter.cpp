//
//  WallPainter.cpp
//  Paint App
//
//  Created by Tushar Gusain on 18/10/19.
//  Copyright © 2019 Hot Cocoa Software. All rights reserved.
//

#include "WallPainter.hpp"

using namespace cv;
using namespace std;

Mat WallPainter::paint_wall(Mat image,Point p, cv::Size imageSize, cv::Scalar chosenColor) {
    
    double cannyMinThres = 30.0;
    double ratio = 2.5;

    Mat mRgbMat = image;

    cvtColor(mRgbMat,mRgbMat,COLOR_RGBA2RGB);

    Mat mask = Mat(Size(mRgbMat.cols/8.0, mRgbMat.rows/8.0), CV_8UC1, Scalar(0.0));

    Mat img ;
    mRgbMat.copyTo(img);

    Mat mGreyScaleMat;
    cvtColor(mRgbMat, mGreyScaleMat,COLOR_RGB2GRAY, 3);
    medianBlur(mGreyScaleMat,mGreyScaleMat,3);


    Mat cannyGreyMat;
    Canny(mGreyScaleMat, cannyGreyMat, cannyMinThres, cannyMinThres*ratio, 3);

    //hsv
    Mat hsvImage;
    cvtColor(img,hsvImage,COLOR_RGB2HSV);

    //got the hsv values
    vector<Mat> list = vector<Mat>(3);
    split(hsvImage, list);

    Mat sChannelMat;
    
    vector<Mat> sList = vector<Mat>{list[1]};
//    sList.push_back(list[1]);
    merge(sList, sChannelMat);
    
    medianBlur(sChannelMat,sChannelMat,3);
    
    // canny
    Mat cannyMat;
    Canny(sChannelMat, cannyMat, cannyMinThres, cannyMinThres*ratio, 3);

    addWeighted(cannyMat,0.5, cannyGreyMat,0.5 ,0.0,cannyMat);
    dilate(cannyMat, cannyMat,mask, Point(0.0,0.0), 5);
    
    cout<<mRgbMat.cols<<","<<mRgbMat.rows<<"\n";
    
    double width = imageSize.width;
    double height = imageSize.height;
    
    Point seedPoint = Point(p.x*(double(mRgbMat.cols)/width), p.y*(double(mRgbMat.rows)/height));
    
    cout<<seedPoint.x<<","<<seedPoint.y<<"\n";

    resize(cannyMat, cannyMat, Size(cannyMat.cols + 2.0, cannyMat.rows + 2.0));

    medianBlur(mRgbMat,mRgbMat,15);

    int floodFillFlag = 8;
    
    floodFill(mRgbMat,cannyMat,seedPoint,chosenColor,0,Scalar(5.0, 5.0, 5.0),Scalar(5.0, 5.0, 5.0),floodFillFlag);
    dilate(mRgbMat, mRgbMat, mask, Point(0.0,0.0), 5);

    //got the hsv of the mask image
    Mat rgbHsvImage;
    cvtColor(mRgbMat,rgbHsvImage,COLOR_RGB2HSV);

    vector<Mat> list1 = vector<Mat>(3);
    split(rgbHsvImage, list1);

    //merged the "v" of original image with mRgb mat
    Mat result;
    
    vector<Mat> newList = vector<Mat>();
    newList.push_back(list1[0]);
    newList.push_back(list1[1]);
    newList.push_back(list[2]);
    merge(newList, result);

    // converted to rgb
    cvtColor(result, result, COLOR_HSV2RGB);

    addWeighted(result,0.7, img,0.3 ,0.0,result);

    return result;
    
}

Mat WallPainter::apply_texture(Mat image, Mat texture, Point p, cv::Size imageSize) {
    double cannyMinThres = 30.0;
    double ratio = 2.5;

    Mat mRgbMat = image;
    
    cvtColor(mRgbMat,mRgbMat,COLOR_RGBA2RGB);

    Mat mask = Mat(Size(mRgbMat.cols/8.0, mRgbMat.rows/8.0),CV_8UC1, Scalar(0.0));
    //        Imgproc.dilate(mRgbMat, mRgbMat,mask, Point(0.0,0.0), 5)

    Mat img;
    mRgbMat.copyTo(img);

            // grayscale
    Mat mGreyScaleMat;
    cvtColor(mRgbMat, mGreyScaleMat,COLOR_RGB2GRAY, 3);
    medianBlur(mGreyScaleMat,mGreyScaleMat,3);


    Mat cannyGreyMat;
    Canny(mGreyScaleMat, cannyGreyMat, cannyMinThres, cannyMinThres*ratio, 3);

            //hsv
    Mat hsvImage;
    cvtColor(img,hsvImage,COLOR_RGB2HSV);

            //got the hsv values
    vector<Mat> list = vector<Mat>(3);
    split(hsvImage, list);

    Mat sChannelMat;
    vector<Mat> sList = vector<Mat>{list[1]};
    merge(sList, sChannelMat);
    medianBlur(sChannelMat,sChannelMat,3);

            // canny
    Mat cannyMat;
    Canny(sChannelMat, cannyMat, cannyMinThres, cannyMinThres*ratio, 3);

    addWeighted(cannyMat,0.5, cannyGreyMat,0.5 ,0.0,cannyMat);
    dilate(cannyMat, cannyMat,mask, Point(0.0,0.0), 5);

    double width = imageSize.width;
    double height = imageSize.height;
    
    Point seedPoint = Point(p.x*(double(mRgbMat.cols)/width), p.y*(double(mRgbMat.rows)/height));

    resize(cannyMat, cannyMat, Size(cannyMat.cols + 2.0, cannyMat.rows + 2.0));
    Mat cannyMat1;
    cannyMat.copyTo(cannyMat1);

    Mat wallMask = Mat(mRgbMat.size(),mRgbMat.type());

    int floodFillFlag = 8;
    floodFill(wallMask,cannyMat,seedPoint,Scalar(255.0,255.0,255.0),0,Scalar(5.0, 5.0, 5.0),Scalar(5.0, 5.0, 5.0),floodFillFlag);

            //second floodfill is not working 5
    floodFill(mRgbMat, cannyMat1,seedPoint,Scalar(0.0,0.0,0.0),0,Scalar(5.0, 5.0, 5.0),Scalar(5.0, 5.0, 5.0),floodFillFlag);

    Mat textureImgMat;
    cvtColor(texture,textureImgMat,COLOR_RGBA2RGB);
    resize(textureImgMat, textureImgMat, Size(mRgbMat.cols, mRgbMat.rows));
    
    bitwise_and(wallMask ,textureImgMat,textureImgMat);

    Mat resultImage;
    bitwise_or(textureImgMat,mRgbMat,resultImage);

            ////alpha blending

            //got the hsv of the mask image
    Mat rgbHsvImage;
    cvtColor(resultImage,rgbHsvImage,COLOR_RGB2HSV);

    vector<Mat> list1 = vector<Mat>(3);
    split(rgbHsvImage, list1);

            //merged the "v" of original image with mRgb mat
    Mat result;
    vector<Mat> newList = vector<Mat>();
    newList.push_back(list1[0]);
    newList.push_back(list1[1]);
    newList.push_back(list[2]);
    merge(newList, result);

            // converted to rgb
    cvtColor(result, result, COLOR_HSV2RGB);

    addWeighted(result,0.8, img,0.2 ,0.0,result);

    return result;
}
