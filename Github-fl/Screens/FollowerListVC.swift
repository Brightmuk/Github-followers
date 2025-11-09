//
//  FollowerListVC.swift
//  Github-fl
//
//  Created by Bright Mukonesi on 24/10/2025.
//

import UIKit

class FollowerListVC: UIViewController {
    var username: String!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = true
        NetworkManager.shared.getFollowers(for: username, page: 1) { (followers, errorMessage) in
            
            guard let followers = followers else{
                self.presentGFAlertOnMainThread(title: "Error happened", message: errorMessage!, buttonTitle: "Ok")
                return
            }
            print("Followers count = \(followers.count)")
        }

    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }

}
