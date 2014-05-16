//
//  DisplayViewController.m
//  PhotoViewerDemo
//
//  Created by Victor  Adu on 5/1/14.
//  Copyright (c) 2014 Victor  Adu. All rights reserved.
//

#import "DisplayViewController.h"

@interface DisplayViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *currentImage;

@end

@implementation DisplayViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIImage *image = [UIImage imageNamed:self.currentPhoto.filename];
    [self.currentImage setImage:image]; //grab and set image to show on fullscreen.
    
    self.title = self.currentPhoto.name;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    InfoViewController *ivc = [segue destinationViewController];
    // Pass the selected object to the new view controller.
    ivc.currentPhoto = self.currentPhoto;
}


@end
