//
//  PhotoLoadManager.swift
//  TestTaskA3Technology.
//
//  Created by -=HIZIR=- on 14/02/2019.
//  Copyright © 2019 GurobaDeveloper. All rights reserved.
//

import UIKit

final class PhotoLoadManager {
	// В идеальной архитектуре Синглтонам не место, почитай про Dependency Injection
	static let shared = PhotoLoadManager()
	
	func loadPhotoURL(url: String?, complition: @escaping Clousure<UIImage>){
		guard let urlString = url else { return }
		guard let URL = URL(string: urlString) else { return }
		
		let request  = URLRequest(url: URL, cachePolicy: .returnCacheDataElseLoad, timeoutInterval: 10)
		let dataTask = URLSession.shared.dataTask(with: request) { (data, response, error) in
			
			guard error == nil else { return }
			guard let data = data else { return }
			guard let image = UIImage(data: data) else { return }
			
		complition(image)
		}
		dataTask.resume()
	}
	private init(){}
}
