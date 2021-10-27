//
//  KoreanItemsViewController.swift
//  Expo1900
//
//  Created by 오인탁 on 2021/10/19.
//

import UIKit

class KoreanItemsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var koreanItemsData: [KoreanItems] = []
    var koreanItemsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = false
        navigationController?.navigationBar.topItem?.title = "메인"
        view.backgroundColor = .white
        decodeKoreanItemsData()
        koreanItemsTableView.delegate = self
        koreanItemsTableView.dataSource = self
    }
    
    func decodeKoreanItemsData() {
        guard let dataAsset = NSDataAsset(name: "items") else { return }
        let jsonDecoder = JSONDecoder()
        koreanItemsData = try! jsonDecoder.decode([KoreanItems].self, from: dataAsset.data)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return koreanItemsData.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = koreanItemsTableView.dequeueReusableCell(withIdentifier: "items", for: indexPath) as? KoreanItemsCell else { return UITableViewCell() }
        cell.itemsTitle.text = koreanItemsData[indexPath.row].name
        cell.itemsImage.image = UIImage(named: koreanItemsData[indexPath.row].imageName)
        cell.itemsShortDesc.text = koreanItemsData[indexPath.row].shortDesc
        return cell
    }
}
class KoreanItemsCell: UITableViewCell {
    var stackView: UIStackView = {
        var stackView: UIStackView = UIStackView()
//        stackView.addSubview(itemsTitle)
//        stackView.addSubview(itemsImage)
//        stackView.addSubview(itemsShortDesc)
        return stackView
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
        return itemsImage
    }()
    var itemsShortDesc: UILabel = {
        var itemsShortDesc: UILabel = UILabel()
        itemsShortDesc.translatesAutoresizingMaskIntoConstraints = false
        itemsShortDesc.font = UIFont.preferredFont(forTextStyle: .footnote)
        itemsShortDesc.numberOfLines = 0
        return itemsShortDesc
    }()
}
