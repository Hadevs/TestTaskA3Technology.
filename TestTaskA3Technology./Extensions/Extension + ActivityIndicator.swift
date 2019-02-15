//
//  Extension + ActivityIndicator.swift
//  TestTaskA3Technology.
//
//  Created by -=HIZIR=- on 14/02/2019.
//  Copyright © 2019 GurobaDeveloper. All rights reserved.
//

import UIKit

extension UIActivityIndicatorView {
	//работа активити индикатора
	
	// переименовал
	func show(isOn: Bool){
		isHidden = !isOn
		if !isOn {
			stopAnimating()
		} else {
			startAnimating()
		}
	}
}
