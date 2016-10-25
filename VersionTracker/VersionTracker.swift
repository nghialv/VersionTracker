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
		return Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as! String
	}
	
	public static var currentBuild: String {
		return Bundle.main.object(forInfoDictionaryKey: "CFBundleVersion") as! String
	}
	
	public static func track() {
		let standardUserDefaults = UserDefaults.standard
		
		let oldVersionTrail = standardUserDefaults.object(forKey: VersionTrailKey) as? VersionTrailDictionary
	
		versionTrail = oldVersionTrail ?? [:]
		isFirstLaunchEver = oldVersionTrail == nil
        
        if let versions = versionTrail[VersionsKey], versions.contains(currentVersion) {
			isFirstLaunchForVersion = false
		} else {
			isFirstLaunchForVersion = true
			var versions = versionTrail[VersionsKey] ?? []
			versions.append(currentVersion)
			versionTrail[VersionsKey] = versions
		}
		
		if let builds = versionTrail[BuildsKey], builds.contains(currentBuild) {
			isFirstLaunchForBuild = false
		} else {
			isFirstLaunchForBuild = true
			var builds = versionTrail[BuildsKey] ?? []
			builds.append(currentBuild)
			versionTrail[BuildsKey] = builds
		}
		
		// Store version trail
		standardUserDefaults.set(versionTrail, forKey: VersionTrailKey)
		standardUserDefaults.synchronize()
	}
}
