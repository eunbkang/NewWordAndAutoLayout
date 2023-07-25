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
    
    @IBOutlet var tagButton: [UIButton]!
    
    @IBOutlet var descriptionBackground: UIImageView!
    @IBOutlet var descriptionLabel: UILabel!
    
    enum WordOption: String, CaseIterable {
        case shorten = "별다줄"
        case mindset = "중꺾마"
        case workout = "오운완"
        case disaster = "스불재"
        
        var description: String {
            switch self {
            case .shorten:
                return "별걸 다 줄이네"
            case .mindset:
                return "중요한 것은 꺾이지 않는 마음"
            case .workout:
                return "오늘의 운동 완료"
            case .disaster:
                return "스스로 불러온 재앙"
            }
        }
    }
    
    @IBAction func searchButtonTapped(_ sender: UIButton) {
        textFieldReturnKeyTapped(searchField)
    }
    
    @IBAction func tagButtonTapped(_ sender: UIButton) {
        searchField.text = sender.titleLabel?.text
        textFieldReturnKeyTapped(searchField)
    }
    
    @IBAction func textFieldReturnKeyTapped(_ sender: UITextField) {
        guard let text = searchField.text else {
            showAlert()
            return
        }
        if text.count <= 1 {
            showAlert()
        } else {
            if let description = WordOption(rawValue: text)?.description {
                descriptionLabel.text = description
            } else {
                descriptionLabel.text = "찾는 결과가 없습니다."
            }
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
        for button in tagButton {
            configOneTag(button)
            configTagTitle(button)
        }
    }
    
    func configOneTag(_ button: UIButton) {
        setBorderToView(button, width: 1)
        
        button.layer.cornerRadius = 10
        button.tintColor = .black
    }
    
    func configTagTitle(_ button: UIButton) {
        let wordList = WordOption.allCases
        button.setTitle(wordList[button.tag - 1].rawValue, for: .normal)
    }
    
    func configDescriptionBackground() {
        descriptionBackground.image = UIImage(named: "background")
        descriptionBackground.contentMode = .scaleAspectFill
    }

    func setBorderToView(_ view: UIView, width: CGFloat = 2) {
        view.layer.borderWidth = width
        view.layer.borderColor = UIColor.black.cgColor
    }
    
    func showAlert() {
        let alert = UIAlertController(title: "빈칸 입력", message: "빈칸 또는 한 글자만 입력하셨습니다.", preferredStyle: .alert)
        let action = UIAlertAction(title: "다시 입력", style: .default)
        alert.addAction(action)
        
        present(alert, animated: true)
    }
    
    
}
