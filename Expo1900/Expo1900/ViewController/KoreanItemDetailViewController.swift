//
//  KoreanItemDetailViewController.swift
//  Expo1900
//
//  Created by 오인탁 on 2021/10/19.
//

import UIKit

class KoreanItemDetailViewController: UIViewController {

    private var itemImage: UIImageView = {
        var itemImage: UIImageView = UIImageView()
        itemImage.translatesAutoresizingMaskIntoConstraints = false
        itemImage.contentMode = .scaleAspectFit
        return itemImage
    }()
    
    private var itemDescription: UITextView = {
        var itemDescription: UITextView = UITextView()
        itemDescription.translatesAutoresizingMaskIntoConstraints = false
        itemDescription.font = UIFont.preferredFont(forTextStyle: .body)
        return itemDescription
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubView()
        view.backgroundColor = .white
        navigationController?.navigationBar.topItem?.title = "한국의 출품작"
        dataConstraints()
    }
    
    func didSelectedCellDescription(data: KoreanItems) {
        itemImage.image = UIImage(named: data.imageName)
        itemDescription.text = data.desc
        self.title = data.name
    }
    
    func addSubView() {
        view.addSubview(itemImage)
        view.addSubview(itemDescription)
    }
    
    func dataConstraints() {
        itemImageConstraints()
        itemDescriptionConstraints()
    }
    
    func itemImageConstraints() {
        NSLayoutConstraint.activate([
            itemImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            itemImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            itemImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            itemImage.bottomAnchor.constraint(equalTo: itemDescription.topAnchor, constant: -20),
            itemImage.heightAnchor.constraint(equalToConstant: 300)
        ])
    }
    
    func itemDescriptionConstraints() {
        NSLayoutConstraint.activate([
            itemDescription.topAnchor.constraint(equalTo: itemImage.bottomAnchor, constant: 20),
            itemDescription.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            itemDescription.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            itemDescription.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}
