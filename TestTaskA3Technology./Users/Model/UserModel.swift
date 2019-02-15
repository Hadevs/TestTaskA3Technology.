//
//  UserModel.swift
//  TestTaskA3Technology.
//
//  Created by -=АДАМ=- on 13/02/2019.
//  Copyright © 2019 GurobaDeveloper. All rights reserved.
//

import UIKit

//модель User для JSON

// Раздели на разные файлы каждую модель
struct User: Decodable {
	
	var id      : Double?
	var name    : String?
	var username: String?
	var email   : String?
	var address : Address?
	var geo     : Geo?
	var phone   : String?
	var website : String?
	var company : Company?
	
}

struct Address: Decodable {
	var street : String?
	var suite  : String?
	var city   : String?
	var zipcode: String?
}

struct Geo: Decodable {
	var lat: String?
	var lng: String?
}

struct Company: Decodable {
	var name       : String?
	var catchPhrase: String?
	var bs         : String?
}
