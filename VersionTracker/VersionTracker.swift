//
//  VersionTracker.swift
//  Example
//
//  Created by Le VanNghia on 7/3/15.
//  Copyright (c) 2015 Le Van Nghia. All rights reserved.
//

import Foundation

private let VersionTrailKey = "VersionTracker.VersionTrailKey"
private let VersionsKey = "VersionTracker.VersionsKey"
private let BuildsKey = "VersionTracker.BuildsKey"

public struct VersionTracker {
	typealias VersionTrailDictionary = [String: [String]]
	
	private static var versionTrail: VersionTrailDictionary = [:]
	public private(set) static var isFirstLaunchEver = false
	public private(set) static var isFirstLaunchForVersion = false
	public private(set) static var isFirstLaunchForBuild = false
	
	public static var currentVersion: String {
		return NSBundle.mainBundle().objectForInfoDictionaryKey("CFBundleShortVersionString") as! String
	}
	
	public static var currentBuild: String {
		return NSBundle.mainBundle().objectForInfoDictionaryKey("CFBundleVersion") as! String
	}
	
	public static func track() {
		let standardUserDefaults = NSUserDefaults.standardUserDefaults()
		
		let oldVersionTrail = standardUserDefaults.objectForKey(VersionTrailKey) as? VersionTrailDictionary
	
		versionTrail = oldVersionTrail ?? [:]
		isFirstLaunchEver = oldVersionTrail == nil
		
		if let versions = versionTrail[VersionsKey] where contains(versions, currentVersion) {
			isFirstLaunchForVersion = false
		} else {
			isFirstLaunchForVersion = true
			var versions = versionTrail[VersionsKey] ?? []
			versions.append(currentVersion)
			versionTrail[VersionsKey] = versions
		}
		
		if let builds = versionTrail[BuildsKey] where contains(builds, currentBuild) {
			isFirstLaunchForBuild = false
		} else {
			isFirstLaunchForBuild = true
			var builds = versionTrail[BuildsKey] ?? []
			builds.append(currentBuild)
			versionTrail[BuildsKey] = builds
		}
		
		// Store version trail
		standardUserDefaults.setObject(versionTrail, forKey: VersionTrailKey)
		standardUserDefaults.synchronize()
	}
}
