//
//  ViewController.swift
//  TestTaskA3Technology.
//
//  Created by -=АДАМ=- on 13/02/2019.
//  Copyright © 2019 GurobaDeveloper. All rights reserved.
//

import UIKit

class UsersViewController: UIViewController {
	//MARK: --- VARIBELS
	private var arrayUser = [User]()
	let parseUser = ParseJSONUsers()
	//MARK: --- OUTLETS
	@IBOutlet weak var userTableView    : UITableView!
	@IBOutlet weak var activityIndicator: UIActivityIndicatorView!
	//MARK: --- LOAD
	override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(animated)
		//проверка интернета
		activityIndicator.activityIndicator(on: true)
		if !Reachability.shared.isConnectedToNetwork() {
			Reachability.shared.alertVC(vc: self)
		} else {
			settingSelfController()
		}
	}
	//MARK: --- FUNCTIONS
	private func settingSelfController(){
		
		let parseJSON = ParseJSON(parseJSON: parseUser)
		
		parseJSON.parseJSON(url: URL_API.users.rawValue, id: nil) {(users) in
			self.arrayUser = users as! [User]
			self.activityIndicator.activityIndicator(on: false)
			self.userTableView.reloadData()
		}
		
		//		JSONManager.shared.parseUsers() { [unowned self] (users) in
		//			self.arrayUser = users
		//			self.activityIndicator.activityIndicator(on: false)
		//			self.userTableView.reloadData()
		//		}
	}
	//MARK: --- SEGUES
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if segue.identifier == ID.SgUser_UserDetail.rawValue {
			guard let user = sender as? User else { return }
			(segue.destination as! UserDetailViewController).curenUser = user
		}
	}
}
//MARK: --- DataSource
extension  UsersViewController: UITableViewDataSource {
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return arrayUser.count
	}
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
		let cell = tableView.dequeueReusableCell(withIdentifier: UsersTableViewCell.identifire, for: indexPath) as! UsersTableViewCell
		cell.user = arrayUser[indexPath.row] // вынеси это внутрь функции ячейки
		// func configure(by model)
		return cell
	}
}
//MARK: --- Delegate
extension  UsersViewController: UITableViewDelegate {
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		performSegue(withIdentifier: ID.SgUser_UserDetail.rawValue, sender: arrayUser[indexPath.row])
	}
}



