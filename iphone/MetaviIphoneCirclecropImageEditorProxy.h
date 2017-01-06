//
//  MetaviIphoneCirclecropImageEditorProxy.h
//  circlecCrop
//
//  Created by Yazmin Ortiz on 05/01/17.
//
//

#import "TOCropViewController.h"
#import "TiProxy.h"


@interface MetaviIphoneCirclecropImageEditorProxy : TiProxy<TOCropViewControllerDelegate>

- (void)openCircleCrop:(id)args;
- (void)openCropImage:(id)args;

@end
