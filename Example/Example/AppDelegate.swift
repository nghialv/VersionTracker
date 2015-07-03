//
//  AppDelegate.swift
//  Example
//
//  Created by Le VanNghia on 7/3/15.
//  Copyright (c) 2015 Le Van Nghia. All rights reserved.
//

import UIKit
import VersionTracker

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

	var window: UIWindow?


	func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
		VersionTracker.track()
		
		if VersionTracker.isFirstLaunchEver {
			println("isFirstLaunchEver")
		}
		
		if VersionTracker.isFirstLaunchForVersion {
			println("isFirstLaunchForVersion")
		}
		
		if VersionTracker.isFirstLaunchForBuild {
			println("isFirstLaunchForBuild")
		}
		
		return true
	}

}

