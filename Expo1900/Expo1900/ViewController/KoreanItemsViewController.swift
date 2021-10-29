//
//  KoreanItemsViewController.swift
//  Expo1900
//
//  Created by 오인탁 on 2021/10/19.
//

import UIKit

class KoreanItemsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var koreanItemsData: [KoreanItems] = []
    var koreanItemsTableView: UITableView = {
        var koreanItemsTableView: UITableView = UITableView()
        koreanItemsTableView.translatesAutoresizingMaskIntoConstraints = false
        return koreanItemsTableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = false
        navigationController?.navigationBar.topItem?.title = "메인"
//        navigationController?.navigationBar.prefersLargeTitles = true
        view.backgroundColor = .white
        koreanItemsTableViewConstraints()
        attribute()
        decodeKoreanItemsData()
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return koreanItemsData.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = koreanItemsTableView.dequeueReusableCell(withIdentifier: "KoreanItemsCellId", for: indexPath) as? KoreanItemsCell else { return UITableViewCell() }
        cell.itemsTitle.text = koreanItemsData[indexPath.row].name
        cell.itemsImage.image = UIImage(named: koreanItemsData[indexPath.row].imageName)
        cell.itemsShortDesc.text = koreanItemsData[indexPath.row].shortDesc
        return cell
    }
    
    func attribute() {
        koreanItemsTableView.register(KoreanItemsCell.self, forCellReuseIdentifier: KoreanItemsCell.cellId)
        koreanItemsTableView.delegate = self
        koreanItemsTableView.dataSource = self
    }
    
    func decodeKoreanItemsData() {
        guard let dataAsset = NSDataAsset(name: "items") else { return }
        let jsonDecoder = JSONDecoder()
        koreanItemsData = try! jsonDecoder.decode([KoreanItems].self, from: dataAsset.data)
    }
    
    func koreanItemsTableViewConstraints() {
        self.view.addSubview(koreanItemsTableView)
        NSLayoutConstraint.activate([
            koreanItemsTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            koreanItemsTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            koreanItemsTableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            koreanItemsTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

class KoreanItemsCell: UITableViewCell {
    
    static let cellId = "KoreanItemsCellId"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.contentView.addSubview(cellStackView)
        cellStackView.addArrangedSubview(itemsImage)
        cellStackView.addArrangedSubview(labelStackView)
        labelStackView.addArrangedSubview(itemsTitle)
        labelStackView.addArrangedSubview(itemsShortDesc)
//        labelStackViewConstraints()
        cellStackViewConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var labelStackView: UIStackView = {
        var labelStackView: UIStackView = UIStackView()
        labelStackView.translatesAutoresizingMaskIntoConstraints = false
        labelStackView.axis = .vertical
        return labelStackView
    }()
    var cellStackView: UIStackView = {
        var cellStackView: UIStackView = UIStackView()
        cellStackView.translatesAutoresizingMaskIntoConstraints = false
        cellStackView.spacing = 10
        return cellStackView
    }()
    var itemsTitle: UILabel = {
        var itemsTitle: UILabel = UILabel()
        itemsTitle.translatesAutoresizingMaskIntoConstraints = false
        itemsTitle.font = UIFont.preferredFont(forTextStyle: .headline)
        return itemsTitle
    }()
    var itemsImage: UIImageView = {
        var itemsImage: UIImageView = UIImageView()
        itemsImage.translatesAutoresizingMaskIntoConstraints = false
        itemsImage.contentMode = .scaleAspectFit
        return itemsImage
    }()
    var itemsShortDesc: UILabel = {
        var itemsShortDesc: UILabel = UILabel()
        itemsShortDesc.translatesAutoresizingMaskIntoConstraints = false
        itemsShortDesc.font = UIFont.preferredFont(forTextStyle: .footnote)
        itemsShortDesc.numberOfLines = 0
        return itemsShortDesc
    }()
    
//    func labelStackViewConstraints() {
//        NSLayoutConstraint.activate([
//            labelStackView.topAnchor.constraint(equalTo: self.topAnchor),
//            labelStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
//            labelStackView.leadingAnchor.constraint(equalTo: itemsImage.trailingAnchor),
//            labelStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor)
//        ])
//        itemsTitleConstraints()
//        itemsShortDescConstraints()
//    }
//
//    func itemsTitleConstraints() {
//        NSLayoutConstraint.activate([
//            itemsTitle.topAnchor.constraint(equalTo: labelStackView.topAnchor),
//            itemsTitle.bottomAnchor.constraint(equalTo: itemsShortDesc.topAnchor),
//            itemsTitle.leadingAnchor.constraint(equalTo: labelStackView.leadingAnchor),
//            itemsTitle.trailingAnchor.constraint(equalTo: labelStackView.trailingAnchor)
//        ])
//    }
//
//    func itemsShortDescConstraints() {
//        NSLayoutConstraint.activate([
//            itemsShortDesc.topAnchor.constraint(equalTo: itemsTitle.bottomAnchor),
//            itemsShortDesc.bottomAnchor.constraint(equalTo: labelStackView.bottomAnchor),
//            itemsShortDesc.leadingAnchor.constraint(equalTo: labelStackView.leadingAnchor),
//            itemsShortDesc.trailingAnchor.constraint(equalTo: labelStackView.trailingAnchor)
//        ])
//    }
    
    func cellStackViewConstraints() {
        NSLayoutConstraint.activate([
            cellStackView.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            cellStackView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),
            cellStackView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            cellStackView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor)
        ])
        itemsImageConstraints()
    }
    
    func itemsImageConstraints() {
        NSLayoutConstraint.activate([
//            itemsImage.topAnchor.constraint(equalTo: cellStackView.topAnchor),
//            itemsImage.bottomAnchor.constraint(equalTo: cellStackView.bottomAnchor),
//            itemsImage.leadingAnchor.constraint(equalTo: cellStackView.leadingAnchor),
//            itemsImage.trailingAnchor.constraint(equalTo: labelStackView.leadingAnchor),
            itemsImage.widthAnchor.constraint(equalToConstant: 100),
            itemsImage.heightAnchor.constraint(equalTo: itemsImage.widthAnchor)
        ])
    }
}
