//
//  ProxyManager.swift
//  TestTaskA3Technology.
//
//  Created by -=АДАМ=- on 13/02/2019.
//  Copyright © 2019 GurobaDeveloper. All rights reserved.
//

import UIKit

final class ProxyManager {
	// Синглтон
	static let shared = ProxyManager()
	private init(){}
	
	func proxy(url: String?, comlition: @escaping Clousure<UIImage>){
		if let imageGet = CacheManager.shared.getData(stringKey: url) {
			DispatchQueue.main.async {
				comlition(imageGet)
			}
		} else {
			// отступы были нарушены, я поправил
			PhotoLoadManager.shared.loadPhotoURL(url: url) {(image) in
				CacheManager.shared.saveData(stringKey: url, image: image)
				DispatchQueue.main.async {
					comlition(image)
				}
			}
		}
	}
}

