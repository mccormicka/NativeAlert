//
//  MobileAlert.m
//  NativeAlert
//
//  Created by Anthony McCormick on 22/10/2011.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "MobileAlert.h"

@implementation MobileAlert

@synthesize alert;

FREContext *context;

-(void)showAlertWithTitle: (NSString *)title 
                  message: (NSString*)message 
               closeLabel: (NSString*)closeLabel
              otherLabels: (NSString*)otherLabels
                  context: (FREContext *)ctx
{
    context = ctx;
    self.alert = [[[UIAlertView alloc] initWithTitle:title 
                                                    message:message
                                                   delegate:self 
                                          cancelButtonTitle:closeLabel
                                          otherButtonTitles:nil] retain];
    
    NSArray *labels = [otherLabels componentsSeparatedByString:@","];
    
    for (NSString *label in labels) 
    {
        [alert addButtonWithTitle:label];
    }
    [alert show];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{

    NSString *buttonID = [NSString stringWithFormat:@"%d", buttonIndex];
    NSString *event_name = @"ALERT_CLOSED";
    
    FREDispatchStatusEventAsync(context, (uint8_t*)[event_name UTF8String], (uint8_t*)[buttonID UTF8String]);
    [alert release];
    context = nil;
}

@end
