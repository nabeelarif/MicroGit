//
//  MicroGitLabel.m
//  Micro Git
//
//  Created by Nabeel Arif on 2/14/16.
//  Copyright © 2016 Nabeel. All rights reserved.
//

#import "MicroGitLabel.h"
#import "UIFont+Theme.h"

@implementation MicroGitLabel
-(instancetype)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self setup];
    }
    return self;
}
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}
-(void)setup{
    self.font = [UIFont gitFont];
    self.adjustsFontSizeToFitWidth = YES;
    self.minimumScaleFactor = 0.5;
}
@end
