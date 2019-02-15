//
//  CacheManager.swift
//  TestTaskA3Technology.
//
//  Created by -=HIZIR=- on 14/02/2019.
//  Copyright © 2019 GurobaDeveloper. All rights reserved.
//

import UIKit

final class CacheManager {
	// синглтон
	static let shared = CacheManager()
	private init(){}
	
	let cache = NSCache<NSString, UIImage>()
	// функцию переименовал, поменяй в других местах тоже
	func save(image: UIImage, for stringKey: String?) {
		guard let key = stringKey as NSString? else { return }
		cache.setObject(image, forKey: key)
	}
	
	// аналогично
	func image(by stringKey: String?) -> UIImage? {
		guard let key = stringKey as NSString? else { return nil }
		if let image = cache.object(forKey: key) {
			return image
		} else {
			return nil
		}
	}
}


