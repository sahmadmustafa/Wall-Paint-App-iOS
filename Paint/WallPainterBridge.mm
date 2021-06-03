//
//  WallPainterBridge.m
//  Paint App
//
//  Created by Tushar Gusain on 18/10/19.
//  Copyright © 2019 Hot Cocoa Software. All rights reserved.
//

#import <opencv2/opencv.hpp>
#import <opencv2/imgcodecs/ios.h>
#import <Foundation/Foundation.h>
#import "WallPainterBridge.h"
#include "WallPainter.hpp"

@implementation WallPainterBridge

- (UIImage *) paintWallOf:(UIImage *)image touchPointX:(double)pointX touchPointY:(double)pointY imageWidth:(double)width imageHeight:(double)height colorToapply:(UIColor*)color {
    
    // convert uiimage to mat
    cv::Mat opencvImage;
    UIImageToMat(image, opencvImage, true);
    
    // Run lane detection
    WallPainter wallPainter;
    cv::Point p = cv::Point(pointX,pointY);
    cv::Size imageSize = cv::Size(width,height);
    
    CGFloat red = 0;
    CGFloat green = 0;
    CGFloat blue = 0;
    CGFloat alpha = 0;

    [color getRed:&red green:&green blue:&blue alpha:&alpha];
    
    cv::Scalar chosenColor = cv::Scalar(red,green,blue,alpha);
    cv::Mat imageWithWallPainted = wallPainter.paint_wall(opencvImage,p,imageSize,chosenColor);
    
    // convert mat to uiimage and return it to the caller
    return MatToUIImage(imageWithWallPainted);
}

- (UIImage *) applyTextureTo:(UIImage *)image textureToApply:(UIImage *)texture touchPointX:(double)pointX touchPointY:(double)pointY imageWidth:(double)width imageHeight:(double)height {
    
    cv::Mat opencvImage;
    UIImageToMat(image, opencvImage, true);
    
    cv::Mat opencvTexture;
    UIImageToMat(texture, opencvTexture, true);
    
    // Run lane detection
    WallPainter wallPainter;
    cv::Point p = cv::Point(pointX,pointY);
    cv::Size imageSize = cv::Size(width,height);
    cv::Mat imageWithWallTextured = wallPainter.apply_texture(opencvImage, opencvTexture, p, imageSize);
    
    // convert mat to uiimage and return it to the caller
    return MatToUIImage(imageWithWallTextured);
}

@end
