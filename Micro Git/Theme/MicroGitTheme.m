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
#import "MicroGitLabel.h"
#import "TitleLabel.h"
#import "BottomRefreshControl.h"

@implementation MicroGitTheme
+ (void)applyTheme
{
    [self applyThemeToTableCells];
    [self applyThemeToStatusBar];
    [self applyThemeToNavigationBar];
}

+ (void)applyThemeToTableCells
{
    //Applay theme to UITableView
//    [[UITableView appearance] setBackgroundColor:[UIColor appColorWithLightness:0.95]];
    
    // Apply effects to general label
    [[UILabel appearanceWhenContainedIn:UITableViewCell.class, nil]
     setFont:UIFont.labelFont];
    [[UILabel appearanceWhenContainedIn:UITableViewCell.class, nil]
     setTextColor:UIColor.labelColor];
//    [[UITableViewCell appearance]
//     setBackgroundColor:[UIColor appColorWithLightness:0.95]];
    
    //Selected background Appearance
    UIView *selectionView = [UIView new];
    selectionView.backgroundColor = [UIColor appColorWithLightness:0.95];
    [[UITableViewCell appearance] setSelectedBackgroundView:selectionView];
    
    //Git Icons tint color
    [[MicroGitLabel appearanceWhenContainedIn:UITableViewCell.class, nil]
     setTextColor:[UIColor appColorWithLightness:0.2]];
    [[MicroGitLabel appearanceWhenContainedIn:UITableViewCell.class, nil] setTextColor:[UIColor colorWithHex:@"#009999" alpha:1.]];
    
    // Title label
    [[TitleLabel appearanceWhenContainedIn:UITableViewCell.class, nil]
     setFont:[UIFont labelFontOfSize:23]];
    [[TitleLabel appearanceWhenContainedIn:UITableViewCell.class, nil]
     setShadowColor:[UIColor lightGrayColor]];
    [[TitleLabel appearanceWhenContainedIn:UITableViewCell.class, nil]
     setShadowOffset:CGSizeMake(0., 1.)];
//    [[TitleLabel appearanceWhenContainedIn:UITableViewCell.class, nil]
//     setTextColor:[UIColor appColorWithLightness:0.2]];
    [[TitleLabel appearanceWhenContainedIn:UITableViewCell.class, nil] setTextColor:[UIColor colorWithHex:@"#800000" alpha:1.]];
    
    // Set progress tint color
    [[UIActivityIndicatorView appearance] setColor:[UIColor appColorWithLightness:0.1]];
    
    // BottomRefreshcontrol
    [[BottomRefreshControl appearance] setBackgroundColor:[UIColor appColorWithLightness:0.9]];
    
    //UISearchBar
    [[UISearchBar appearance] setTintColor:[UIColor appColorWithLightness:0.2]];
    
}

+ (void)applyThemeToStatusBar
{
//    [UIStatusBar appearance]
}

+ (void)applyThemeToNavigationBar
{
    [[UINavigationBar appearance] setBackgroundColor:[UIColor appColorWithLightness:0.5]];
    [[UINavigationBar appearance] setTintColor:[UIColor appColorWithLightness:0.3]];
    [[UILabel appearanceWhenContainedIn:UINavigationBar.class, nil]
     setTextColor:UIColor.redColor];
    
    // Title attribute
    NSShadow * shadow = [[NSShadow alloc] init];
    shadow.shadowColor = [UIColor lightGrayColor];
    shadow.shadowOffset = CGSizeMake(0, -2);
    
    NSDictionary * navBarTitleTextAttributes =
  @{ NSForegroundColorAttributeName : [UIColor appColorWithLightness:0.2],
     NSShadowAttributeName          : shadow,
     NSFontAttributeName            : [UIFont boldSystemFontOfSize:18] };
    
    [[UINavigationBar appearance] setTitleTextAttributes:navBarTitleTextAttributes];
}

@end
