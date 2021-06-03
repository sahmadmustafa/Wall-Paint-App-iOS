//
//  WallPainter.hpp
//  Paint App
//
//  Created by Tushar Gusain on 18/10/19.
//  Copyright © 2019 Hot Cocoa Software. All rights reserved.
//

#ifndef WallPainter_hpp
#define WallPainter_hpp
#endif /* WallPainter_hpp */

#include <opencv2/opencv.hpp>

class WallPainter {
    
public:
    
    /*
     Returns image with lane overlay
     */
    cv::Mat paint_wall(cv::Mat image,cv::Point p, cv::Size imageSize,cv::Scalar chosenColor);
    cv::Mat apply_texture(cv::Mat image,cv::Mat texture,cv::Point p, cv::Size imageSize);
    
};
