//
//  BaeminViewController.swift
//  NewWordAndAutoLayout
//
//  Created by Eunbee Kang on 2023/07/23.
//

import UIKit

class BaeminViewController: UIViewController {

    @IBOutlet var cardView: [UIView]!
    @IBOutlet var cardTitleLabel: [UILabel]!
    @IBOutlet var cardSubtitleLabel: [UILabel]!
    
    @IBOutlet var bottomImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configUI()
    }
    
    func configUI() {
        setCornerRadius(bottomImageView)
        configCardViews()
        configFontToLabels()
    }
    
    func configCardViews() {
        for view in cardView {
            setCornerRadius(view)
        }
    }
    
    func configFontToLabels() {
        for label in cardTitleLabel {
            label.font = .preferredFont(forTextStyle: .title2)
        }
        for label in cardSubtitleLabel {
            label.font = .preferredFont(forTextStyle: .subheadline)
        }
    }

    func setCornerRadius(_ view: UIView) {
        view.layer.cornerRadius = 10
        view.clipsToBounds = true
    }

}
