//
//  ViewController.m
//  dispatch_栅栏
//
//  Created by renjinwei on 2020/12/30.
//  Copyright © 2020 renjinwei. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


- (IBAction)barrierBtn:(id)sender {
 
    [self barrierRun];
}


- (void)barrierRun
{
    // thread3 should run after thread1 and thread2 complete
    dispatch_queue_t queue = dispatch_queue_create("BarrierDemo", DISPATCH_QUEUE_CONCURRENT);
     
     dispatch_async(queue, ^{
         for (int i = 0; i < 10; i++) {
             NSLog(@"thread1 %@", [NSThread currentThread]);
         }
     });
     dispatch_async(queue, ^{
         for (int i = 0; i < 10; i++) {
             NSLog(@"thread2 %@", [NSThread currentThread]);
         }
     });
     dispatch_barrier_sync(queue, ^{
         NSLog(@"========= dispatch_barrier ========");
     });
     
     dispatch_async(queue, ^{
         for (int i = 0; i < 10; i++) {
             NSLog(@"thread3 %@", [NSThread currentThread]);
         }
     });
}

@end
