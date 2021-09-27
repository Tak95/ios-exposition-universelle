//
//  Expo1900 - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var expo1900Title: UILabel!
    @IBOutlet weak var expo1900Visitors: UILabel!
    @IBOutlet weak var expo1900Location: UILabel!
    @IBOutlet weak var expo1900Duration: UILabel!
    @IBOutlet weak var expo1900Description: UILabel!
    var expoData: Expo1900?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        decodeExpoData()
        initExpoData()
        // Do any additional setup after loading the view.
    }
    
    private func decodeExpoData() {
        guard let dataAsset = NSDataAsset(name: "exposition_universelle_1900") else { return }
        let decoder = JSONDecoder()
        expoData = try? decoder.decode(Expo1900.self, from: dataAsset.data)
    }
    
    func decimalFormatterNumber() -> String {
        guard let expoDataItem = expoData else { return "" }
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        guard let result = numberFormatter.string(from: NSNumber(value: expoDataItem.visitors)) else { return "" }
        
        return result
    }
    
    func initExpoData() {
        guard let expoDataItem = expoData else { return }
        expo1900Title.text = expoDataItem.title
        expo1900Visitors.text = "방문객 : \(decimalFormatterNumber())명"
        expo1900Location.text = "개최지 : \(expoDataItem.location)"
        expo1900Duration.text = "개최 기간 : \(expoDataItem.duration)"
        expo1900Description.text = expoDataItem.description
    }

}

