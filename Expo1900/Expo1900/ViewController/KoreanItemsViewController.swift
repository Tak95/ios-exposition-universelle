//
//  KoreanItemsViewController.swift
//  Expo1900
//
//  Created by 오인탁 on 2021/09/28.
//

import UIKit

class KoreanItemsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBAction func didTouchdownBackButton() {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBOutlet weak var koreanItemsTableView: UITableView!
    var koreanItemsData: [KoreanItems] = []
//    let viewControllerInstance = KoreanItemsDetailViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.koreanItemsTableView.delegate = self
        self.koreanItemsTableView.dataSource = self
        decodeKoreanItemsData()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return koreanItemsData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = self.koreanItemsTableView.dequeueReusableCell(withIdentifier: "itemsCell", for: indexPath) as? KoreanItemsCell else { return UITableViewCell() }
        cell.koreanItemsName.text = koreanItemsData[indexPath.row].name
        cell.koreanItemsShortDesc.text = koreanItemsData[indexPath.row].shortDesc
        cell.koreanItemsImageView.image = UIImage(named: koreanItemsData[indexPath.row].imageName)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let viewControllerInstance = self.storyboard?.instantiateViewController(withIdentifier: "KoreanItemsDetailViewController") as! KoreanItemsDetailViewController
        viewControllerInstance.modalPresentationStyle = .fullScreen
        self.present(viewControllerInstance, animated: true, completion: nil)
        viewControllerInstance.cellConfiguration(data: koreanItemsData[indexPath.row])
    }
    
    func decodeKoreanItemsData() {
        guard let dataAsset = NSDataAsset(name: "items") else { return }
        let decoder = JSONDecoder()
        koreanItemsData = try! decoder.decode([KoreanItems].self, from: dataAsset.data)
    }
}

class KoreanItemsCell: UITableViewCell {
    @IBOutlet weak var koreanItemsName: UILabel!
    @IBOutlet weak var koreanItemsShortDesc: UILabel!
    @IBOutlet weak var koreanItemsImageView: UIImageView!
}
