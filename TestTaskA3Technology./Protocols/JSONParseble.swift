//
//  JSONParseble.swift
//  TestTaskA3Technology.
//
//  Created by -=HIZIR=- on 15/02/2019.
//  Copyright © 2019 GurobaDeveloper. All rights reserved.
//

import UIKit

protocol JSONParseble {
	func parseJSON(url: String, id: Double? , complition: @escaping Clousure<Decodable> )
	
	func parse(urlString: String, complition: @escaping Clousure<Data>)
}

extension JSONParseble {
	// нарушенные отступы
	func parse(urlString: String, complition: @escaping Clousure<Data>){
		guard let url  = URL(string: urlString) else { return }
		let urlRequest = URLRequest(url: url, cachePolicy: .returnCacheDataElseLoad, timeoutInterval: 0)
		let dataTask   = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
			guard error == nil else { return }
			guard let data  = data else { return}
			complition(data)
		}
		dataTask.resume()
	}
}
