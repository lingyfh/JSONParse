//
//  JPViewController.m
//  JSONParse
//
//  Created by lingyfh on 03/02/2017.
//  Copyright (c) 2017 lingyfh. All rights reserved.
//

#import "JPViewController.h"
@import JSONParse;


@interface JPViewController ()

@end

@implementation JPViewController

- (BOOL)objIsNull:(id)obj {
    if (!obj || obj == nil || [obj isEqual:[NSNull null]]) {
        return YES;
    }
    return NO;
}

- (void)test {
    NSDictionary *rs = @{@"array": @[@0, @2, @3], @"dict": @{@"key": @"v"}, @"string": @"this is a string"};
    NSLog(@"json array = %@", [JSONParse optNSArray:rs valueForKey:@"array"]);
    NSLog(@"json array def = %@", [JSONParse optNSArray:rs valueForKey:@"array" defValue:@[@9,@8,@7]]);
    
    NSLog(@"json dict = %@", [JSONParse optNSDictionary:rs valueForKey:@"dict"]);
    NSLog(@"json dict def = %@", [JSONParse optNSDictionary:rs valueForKey:@"dict" defValue:@{@"def": @1}]);
    
    NSLog(@"json string = %@", [JSONParse optString:rs valueForKey:@"string"]);
    NSLog(@"json string def = %@", [JSONParse optString:rs valueForKey:@"string" defValue:@"defalut"]);
    
    rs = @{@"is_open": @YES};
    NSLog(@"json bool = %d", [JSONParse optBOOL:rs valueForKey:@"is_open"]);
    NSLog(@"json bool def = %d", [JSONParse optBOOL:rs valueForKey:@"is_open" defValue:false]);
    
    NSLog(@"json boolean = %d", [JSONParse optBoolean:rs valueForKey:@"is_open"]);
    NSLog(@"json boolean def = %d", [JSONParse optBoolean:rs valueForKey:@"is_open" defValue:false]);
    
    rs = @{@"int": @1};
    NSLog(@"json number = %@", [JSONParse optNSNumber:rs valueForKey:@"int"]);
    NSLog(@"json number def = %@", [JSONParse optNSNumber:rs valueForKey:@"int" defValue:[NSNumber numberWithInt:105]]);
    
    NSLog(@"json int = %d", [JSONParse optInt:rs valueForKey:@"int"]);
    NSLog(@"json int def = %d", [JSONParse optInt:rs valueForKey:@"int" defValue:101]);
    
    NSLog(@"json double = %lf", [JSONParse optDouble:rs valueForKey:@"int"]);
    NSLog(@"json double def = %lf", [JSONParse optDouble:rs valueForKey:@"int" defValue:102]);
    
    NSLog(@"json float = %lf", [JSONParse optFloat:rs valueForKey:@"int"]);
    NSLog(@"json float def = %lf", [JSONParse optFloat:rs valueForKey:@"int" defValue:103]);
    
    NSLog(@"json long = %ld", [JSONParse optLong:rs valueForKey:@"int"]);
    NSLog(@"json long def = %ld", [JSONParse optLong:rs valueForKey:@"int" defValue:104]);
}

- (void)testStringToDict {
    NSString *jsonString = @"{\"stringaaa\": null, \"string\": \"thisis a string\", \"int\": 1, \"double\": 1.015, \"float\": 1.0001, \"number\": 1, \"long\": 100, \"bool\": false, \"dict\": {\"aaa\": 1}, \"array\": [0, 1, 2], \"data\": null}";
    
    NSDictionary *dict = [JSONParse stringToNSDictionary:jsonString];
    NSLog(@"dict = %@", dict);
    NSString *string = [JSONParse dictToNSString:dict];
    NSLog(@"string = %@", string);
    
    
    dict = [JSONParse stringToNSDictionary:@"Test" defValue:@{@"key": @"defalut"}];
    NSLog(@"dict = %@", dict);
    NSString *stringJson = [JSONParse dictToNSString:@{} defValue:@"defalut"];
    NSLog(@"string = %@", stringJson);
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self test];
    [self testStringToDict];
    
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
