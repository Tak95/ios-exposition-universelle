//
//  Expo1900 - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ExpoViewController: UIViewController {
    var expo1900: Expo?
    
    private var titleLabel: UILabel!
    private var expoImage: UIImageView!
    private var visitorsLabel: UILabel!
    private var locationLabel: UILabel!
    private var durationLabel: UILabel!
    private var descriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
        decodeData()
        initData()
//        setupMainLayout()
//        dataContraints()
    }

    func decodeData() {
        guard let dataAsset = NSDataAsset(name: "exposition_universelle_1900") else { return }
        let jsonDecoder = JSONDecoder()
        try! jsonDecoder.decode(Expo.self, from: dataAsset.data)
    }
    
    func initData() {
        guard let expoData = expo1900 else { return }
        titleLabel.text = expoData.title
        expoImage.image = UIImage(named: "poster")
        visitorsLabel.text = "\(expoData.visitors) 명"
        locationLabel.text = expoData.location
        durationLabel.text = expoData.duration
        descriptionLabel.text = expoData.description
    }
    
    func setupMainLayout() {
        titleLabel?.translatesAutoresizingMaskIntoConstraints = false
        expoImage?.translatesAutoresizingMaskIntoConstraints = false
        visitorsLabel?.translatesAutoresizingMaskIntoConstraints = false
        locationLabel?.translatesAutoresizingMaskIntoConstraints = false
        durationLabel?.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel?.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(titleLabel)
        view.addSubview(expoImage)
        view.addSubview(visitorsLabel)
        view.addSubview(locationLabel)
        view.addSubview(durationLabel)
        view.addSubview(descriptionLabel)
        
//        titleLabel.font = .d
    }

    func dataContraints() {
        titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        titleLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        expoImage.centerXAnchor.constraint(equalTo: titleLabel.centerXAnchor).isActive = true
        expoImage.centerYAnchor.constraint(equalTo: titleLabel.bottomAnchor).isActive = true
    }
}

