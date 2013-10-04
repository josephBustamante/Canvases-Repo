//
//  Users.h
//  Canvases
//
//  Created by Joseph Bustamante on 9/21/13.
//  Copyright (c) 2013 Joseph Bustamante. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Users : NSManagedObject

@property (nonatomic, retain) NSString * username;
@property (nonatomic, retain) NSString * password;

@end
