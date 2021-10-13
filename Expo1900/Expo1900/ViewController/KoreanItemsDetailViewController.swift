//
//  KoreanItemsDetailViewController.swift
//  Expo1900
//
//  Created by 오인탁 on 2021/10/06.
//

import UIKit

class KoreanItemsDetailViewController: UIViewController {
    
    @IBAction func didTouchDownBackButton() {
        self.dismiss(animated: true, completion: nil)
    }

    @IBOutlet weak var koreanTitleNavigationBar: UINavigationBar!
    @IBOutlet weak var koreanItemsDetailImage: UIImageView!
    @IBOutlet weak var koreanItemsDetailDescription: UITextView!
//    var 임시데이터: KoreanItems?
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        koreanItemsDetailImage?.image = nil
//        koreanItemsDetailDescription?.text = "피즈의 재간둥이"
//        self.view.backgroundColor = .white
//        self.navigationItem.title = "페즈"
//        koreanTitleNavigationBar.topItem?.title

    }
    
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        koreanItemsDetailImage.image = UIImage(named: 임시데이터!.imageName)
//        koreanItemsDetailDescription.text = 임시데이터?.desc
//    }
    
    func cellConfiguration(data: KoreanItems) {
//        임시데이터 = data
        koreanItemsDetailImage.image = UIImage(named: data.imageName)
        koreanItemsDetailDescription.text = data.desc
        koreanTitleNavigationBar.topItem?.title = data.name
    }
    
//    func setData() {
//        guard let value = 임시데이터 else { return }
//        koreanItemsDetailImage.image = UIImage(named: value.imageName)
//        koreanItemsDetailDescription.text = value.desc
//    }
}
