//
//  WallPainterBridge.h
//  Paint App
//
//  Created by Tushar Gusain on 18/10/19.
//  Copyright © 2019 Hot Cocoa Software. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface WallPainterBridge : NSObject

- (UIImage *) paintWallOf: (UIImage *) image touchPointX: (double) pointX touchPointY: (double) pointY imageWidth: (double) width imageHeight: (double) height colorToapply: (UIColor *) color;

- (UIImage *) applyTextureTo: (UIImage *) image textureToApply: (UIImage *) texture touchPointX: (double) pointX touchPointY: (double) pointY imageWidth: (double) width imageHeight: (double) height;

@end
