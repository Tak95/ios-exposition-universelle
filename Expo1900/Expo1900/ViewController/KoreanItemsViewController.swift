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
        self.title = "한국의 출품작"
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let koreanItemsDetailViewController = KoreanItemDetailViewController()
        self.navigationController?.pushViewController(koreanItemsDetailViewController, animated: true)
        koreanItemsDetailViewController.didSelectedCellDescription(data: koreanItemsData[indexPath.row])
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
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
        self.addSubview(itemsImage)
        self.addSubview(labelStackView)
        labelStackView.addArrangedSubview(itemsTitle)
        labelStackView.addArrangedSubview(itemsShortDesc)
        itemsImageConstraints()
        labelStackViewConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private var labelStackView: UIStackView = {
        var labelStackView: UIStackView = UIStackView()
        labelStackView.translatesAutoresizingMaskIntoConstraints = false
        labelStackView.axis = .vertical
        return labelStackView
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
    
    func labelStackViewConstraints() {
        NSLayoutConstraint.activate([
            labelStackView.topAnchor.constraint(equalTo: self.topAnchor),
            labelStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            labelStackView.leadingAnchor.constraint(equalTo: itemsImage.trailingAnchor, constant: 15),
            labelStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
    }
    
    func itemsImageConstraints() {
        NSLayoutConstraint.activate([
            itemsImage.topAnchor.constraint(equalTo: contentView.topAnchor),
            itemsImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            itemsImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            itemsImage.trailingAnchor.constraint(equalTo: labelStackView.leadingAnchor,constant: -15),
            itemsImage.widthAnchor.constraint(equalToConstant: 100),
            itemsImage.heightAnchor.constraint(equalTo: itemsImage.widthAnchor)
        ])
    }
}
