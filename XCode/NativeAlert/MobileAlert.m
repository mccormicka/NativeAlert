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
    //Hold onto the context so we can dispatch our message later.
    context = ctx;
    
    //Create our alert.
    self.alert = [[[UIAlertView alloc] initWithTitle:title 
                                                    message:message
                                                   delegate:self 
                                          cancelButtonTitle:closeLabel
                                          otherButtonTitles:nil] retain];
    //Split our labels into an array
    NSArray *labels = [otherLabels componentsSeparatedByString:@","];
    
    //Add each label to our array.
    for (NSString *label in labels) 
    {
        [alert addButtonWithTitle:label];
    }
    [alert show];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    
    //Create our params to pass to the event dispatcher.
    NSString *buttonID = [NSString stringWithFormat:@"%d", buttonIndex];
    //This is the event name we will use in actionscript to know it is our 
    //event that was dispatched.
    NSString *event_name = @"ALERT_CLOSED";
    
    FREDispatchStatusEventAsync(context, (uint8_t*)[event_name UTF8String], (uint8_t*)[buttonID UTF8String]);
    //Cleanup references.
    [alert release];
    context = nil;
}

@end
