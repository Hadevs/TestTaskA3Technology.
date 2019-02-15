//
//  ParseJSONUsers.swift
//  TestTaskA3Technology.
//
//  Created by -=HIZIR=- on 15/02/2019.
//  Copyright © 2019 GurobaDeveloper. All rights reserved.
//

import UIKit

// Вместо 3х разных классов я бы сделал 1 Generic класс, который делал бы подобный функционал. У тебя будет 30 моделей, ты собираешься 30 классов для них делать?
class ParseJSONUsers: JSONParseble {
	
	
	func parseJSON(url: String, id: Double?, complition: @escaping Clousure<Decodable>) {
		parse(urlString: url) {(data) in
			do{
				let getUsers = try JSONDecoder().decode([User].self, from: data)
				DispatchQueue.main.async {
					complition(getUsers)
				}
			} catch let error {
				print(error.localizedDescription)
			}
		}
	}
	
}
