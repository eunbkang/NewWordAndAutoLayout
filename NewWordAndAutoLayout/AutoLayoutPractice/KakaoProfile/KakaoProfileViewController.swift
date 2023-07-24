//
//  KakaoProfileViewController.swift
//  NewWordAndAutoLayout
//
//  Created by Eunbee Kang on 2023/07/23.
//

import UIKit

class KakaoProfileViewController: UIViewController {
    @IBOutlet var profileImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configUI()
    }
    
    func configUI() {
        profileImageView.layer.cornerRadius = 30
    }
}
