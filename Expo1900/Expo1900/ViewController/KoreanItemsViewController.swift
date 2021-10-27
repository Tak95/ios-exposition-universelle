//
//  KoreanItemsViewController.swift
//  Expo1900
//
//  Created by 오인탁 on 2021/10/19.
//

import UIKit

class KoreanItemsViewController: UIViewController {
    var koreanItemsData: [KoreanItems] = []
    var koreanItemsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = false
        navigationController?.navigationBar.topItem?.title = "메인"
        view.backgroundColor = .white
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
        return cell
    }
}
class KoreanItemsCell: UITableViewCell {
    var itemsTitle: UILabel!
    var itemsImage: UIImageView!
    var itemsShortDesc: UILabel!
}
