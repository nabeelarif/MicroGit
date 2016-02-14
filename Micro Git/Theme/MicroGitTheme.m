//
//  MicroGitTheme.m
//  Micro Git
//
//  Created by Nabeel Arif on 2/14/16.
//  Copyright © 2016 Nabeel. All rights reserved.
//

#import "MicroGitTheme.h"
#import <UIKit/UIKit.h>
#import "UIColor+Theme.h"
#import "UIFont+Theme.h"

@implementation MicroGitTheme
+ (void)applyTheme
{
    [self applyThemeToTableCells];
    [self applyThemeToStatusBar];
    [self applyThemeToNavigationBar];
}

+ (void)applyThemeToTableCells
{
    [[UILabel appearanceWhenContainedIn:UITableViewCell.class, nil]
     setFont:UIFont.labelFont];
    [[UILabel appearanceWhenContainedIn:UITableViewCell.class, nil]
     setTextColor:UIColor.labelColor];
    [[UITableViewCell appearance]
     setBackgroundColor:UIColor.tableViewCellBackgroundColor];
}

+ (void)applyThemeToStatusBar
{
    // Apply theme to UIStatusBar
}

+ (void)applyThemeToNavigationBar
{
    // Apply theme to UINavigationBar
}

@end
