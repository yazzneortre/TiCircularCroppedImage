//
//  MetaviIphoneCirclecropImageEditorProxy.m
//  circlecCrop
//
//  Created by Yazmin Ortiz on 05/01/17.
//
//

#import "MetaviIphoneCirclecropImageEditorProxy.h"
#import "TOCropViewController.h"
#import "TiApp.h"

@interface MetaviIphoneCirclecropImageEditorProxy () <UINavigationControllerDelegate,UIImagePickerControllerDelegate, TOCropViewControllerDelegate>
@property (nonatomic, strong) UIImage *image;           // The image we'll be cropping
@property (nonatomic, assign) TOCropViewCroppingStyle croppingStyle; //The cropping style
@property (nonatomic, assign) CGRect croppedFrame;
@property (nonatomic, assign) NSInteger angle;
@end

@implementation MetaviIphoneCirclecropImageEditorProxy
-(void)_destroy
{
    [super _destroy];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingImage:(UIImage *)image editingInfo:(NSDictionary *)editingInfo
{
    TOCropViewController *cropController = [[TOCropViewController alloc] initWithCroppingStyle:self.croppingStyle image:image];
    cropController.delegate = self;
    
    self.image = image;
    
    if (self.croppingStyle == TOCropViewCroppingStyleCircular) {
        [picker pushViewController:cropController animated:YES];
    }
    else { //otherwise dismiss, and then present from the main controller
        [picker dismissViewControllerAnimated:YES completion:^{
            [picker presentViewController:cropController animated:YES completion:nil];
        }];
    }
}

- (void)cropViewController:(TOCropViewController *)cropViewController didCropToImage:(UIImage *)image withRect:(CGRect)cropRect angle:(NSInteger)angle
{
    [cropViewController dismissViewControllerAnimated:YES completion:nil];
    if (image!=nil) {
        TiBlob *blob = [[TiBlob alloc] initWithImage:image];
        NSDictionary *event = @{@"image":blob};
        [self fireEvent:@"done" withObject: event];
    }
    
}

- (void)cropViewController:(TOCropViewController *)cropViewController didCropToCircularImage:(UIImage *)image withRect:(CGRect)cropRect angle:(NSInteger)angle
{
    [cropViewController dismissViewControllerAnimated:YES completion:nil];
    if (image!=nil) {
        TiBlob *blob = [[TiBlob alloc] initWithImage:image];
        NSDictionary *event = @{@"image":blob};
        [self fireEvent:@"done" withObject: event];
    }
    
    // 'image' is the newly cropped version of the original image
}


- (void)openCircleCrop:(id)args
{
    self.croppingStyle = TOCropViewCroppingStyleCircular;
    
    UIImagePickerController *profilePicker = [[UIImagePickerController alloc] init];
    profilePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    profilePicker.allowsEditing = NO;
    profilePicker.delegate = self;
    
    [[TiApp app] showModalController:profilePicker animated:YES];
}

- (void)openCropImage:(id)args
{
    self.croppingStyle = TOCropViewCroppingStyleDefault;
    
    UIImagePickerController *profilePicker = [[UIImagePickerController alloc] init];
    profilePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    profilePicker.allowsEditing = NO;
    profilePicker.delegate = self;
    
    [[TiApp app] showModalController:profilePicker animated:YES];
}

@end
