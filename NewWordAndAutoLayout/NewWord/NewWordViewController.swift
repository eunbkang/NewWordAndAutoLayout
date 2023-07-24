//
//  NewWordViewController.swift
//  NewWordAndAutoLayout
//
//  Created by Eunbee Kang on 2023/07/23.
//

import UIKit

class NewWordViewController: UIViewController {
    @IBOutlet var searchFieldBackground: UIView!
    @IBOutlet var searchField: UITextField!
    
    @IBOutlet var tag1Button: UIButton!
    @IBOutlet var tag2Button: UIButton!
    @IBOutlet var tag3Button: UIButton!
    @IBOutlet var tag4Button: UIButton!
    
    @IBOutlet var descriptionBackground: UIImageView!
    @IBOutlet var descriptionLabel: UILabel!
    
    let wordDict = [
        "별다줄": "별걸 다 줄이네",
        "중꺾마": "중요한 것은 꺾이지 않는 마음",
        "오운완": "오늘의 운동 완료",
        "스불재": "스스로 불러온 재앙"
    ]
    
    @IBAction func searchButtonTapped(_ sender: UIButton) {
        textFieldReturnKeyTapped(searchField)
    }
    
    @IBAction func tagButtonTapped(_ sender: UIButton) {
        searchField.text = sender.titleLabel?.text
        textFieldReturnKeyTapped(searchField)
    }
    
    @IBAction func textFieldReturnKeyTapped(_ sender: UITextField) {
        if wordDict[searchField.text ?? ""] != nil {
            descriptionLabel.text = wordDict[searchField.text!]
        } else {
            descriptionLabel.text = "찾는 결과가 없습니다."
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configUI()
    }
    
    func configUI() {
        configSearchBar()
        configTags()
        configDescriptionBackground()
    }
    
    func configSearchBar() {
        setBorderToView(searchFieldBackground)
        
        searchField.placeholder = "신조어를 입력하세요!"
        searchField.textAlignment = .left
        searchField.font = .systemFont(ofSize: 17)
        searchField.borderStyle = .none
    }
    
    func configTags() {
        configOneTag(tag1Button)
        configOneTag(tag2Button)
        configOneTag(tag3Button)
        configOneTag(tag4Button)
    }
    
    func configOneTag(_ tag: UIButton) {
        setBorderToView(tag, width: 1)
        
        tag.layer.cornerRadius = 10
        tag.tintColor = .black
    }
    
    func configDescriptionBackground() {
        descriptionBackground.image = UIImage(named: "background")
        descriptionBackground.contentMode = .scaleAspectFill
    }

    func setBorderToView(_ view: UIView, width: CGFloat = 2) {
        view.layer.borderWidth = width
        view.layer.borderColor = UIColor.black.cgColor
    }
}
