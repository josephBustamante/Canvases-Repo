//
//  Canvas.h
//  Canvases
//
//  Created by Joseph Bustamante on 10/8/13.
//  Copyright (c) 2013 Joseph Bustamante. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Canvas : NSManagedObject

@property (nonatomic, retain) NSString * title;
@property (nonatomic, retain) NSData * smallPicture;
@property (nonatomic, retain) NSString * desc;

@end
