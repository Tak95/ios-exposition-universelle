//
//  KoreanItemsViewController.swift
//  Expo1900
//
//  Created by 오인탁 on 2021/10/19.
//

import UIKit

class KoreanItemsViewController: UIViewController {
    var koreanItemsData: [KoreanItems] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = false
        navigationController?.navigationBar.topItem?.title = "메인"
        view.backgroundColor = .white
    }
}
