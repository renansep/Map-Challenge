//
//  AppDelegate.m
//  Challenge
//
//  Created by Renan Cargnin on 2/5/14.
//  Copyright (c) 2014 Renan Cargnin. All rights reserved.
//

#import "AppDelegate.h"
#import "Local.h"
#import "ListaTableViewController.h"

@implementation AppDelegate {
    NSMutableArray *locais;
}
@synthesize listaTableViewControler;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    CLLocationCoordinate2D coord = CLLocationCoordinate2DMake(-23.616845,-46.796265);
    CLLocationCoordinate2D coord2 = CLLocationCoordinate2DMake(-46.616845,-23.796265);
    Local *loc = [[Local alloc] initWithNome:@"Trabalho" andCoordenada:coord andHora:8 andMinuto:0];
    locais = [[NSMutableArray alloc] init];
    [locais addObject:loc];
    Local *loc2 = [[Local alloc] initWithNome:@"Reunião" andCoordenada:coord2 andHora:15 andMinuto:0];
    [locais addObject:loc2];
    
    UITabBarController *tabBarController = (UITabBarController *)self.window.rootViewController;
    UINavigationController *navigationController = [tabBarController viewControllers][1];
    listaTableViewControler = [navigationController viewControllers][0];
    listaTableViewControler.locais = locais;
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
