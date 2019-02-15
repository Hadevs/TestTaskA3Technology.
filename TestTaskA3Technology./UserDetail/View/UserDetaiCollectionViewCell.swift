//
//  UserDetaiCollectionViewCell.swift
//  TestTaskA3Technology.
//
//  Created by -=HIZIR=- on 14/02/2019.
//  Copyright © 2019 GurobaDeveloper. All rights reserved.
//

import UIKit

class UserDetaiCollectionViewCell: UICollectionViewCell {
	
	@IBOutlet weak var photoImageView   : UIImageView!
	@IBOutlet weak var viewImageView    : UIView!
	@IBOutlet weak var tittleLabel      : UILabel!
	@IBOutlet weak var activityLoadPhoto: UIActivityIndicatorView!
	
	public var photo: Photo? {
		didSet{
			tittleLabel.text = photo?.title
			ProxyManager.shared.proxy(url: photo?.url) { [unowned self] (image) in
				self.photoImageView.image = image
				self.activityLoadPhoto.activityIndicator(on: false)
			}
		}
	}
	// проверь работу с множеством ячеек, скорее всего у тебя неправильное
	// переиспользование
	
	override func awakeFromNib() {
		super.awakeFromNib() // не забывай про супер методы
		activityLoadPhoto.activityIndicator(on: true)
		photoImageView.addShadowAndRoundedCorners()
		viewImageView.addShadowAndRoundedCorners()
	}
}
