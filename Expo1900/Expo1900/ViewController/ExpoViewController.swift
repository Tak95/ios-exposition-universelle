//
//  Expo1900 - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ExpoViewController: UIViewController {
    var expo1900: Expo?
    let scrollView: UIScrollView = {
        let scrollView: UIScrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.backgroundColor = .white
        return scrollView
    }()
    
    let contentsView: UIView = {
        let contentsView: UIView = UIView()
        contentsView.translatesAutoresizingMaskIntoConstraints = false
        return contentsView
    }()
    
    private var titleLabel: UILabel = {
        var titleLabel: UILabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.font = UIFont.preferredFont(forTextStyle: .title1)
        titleLabel.numberOfLines = 2
        return titleLabel
    }()
    
    private var expoImage: UIImageView = {
        var expoImage: UIImageView = UIImageView()
        expoImage.translatesAutoresizingMaskIntoConstraints = false
        expoImage.contentMode = .scaleAspectFit
        return expoImage
    }()
    
    private var visitorsLabel: UILabel = {
        var visitorsLabel: UILabel = UILabel()
        visitorsLabel.translatesAutoresizingMaskIntoConstraints = false
        visitorsLabel.font = UIFont.preferredFont(forTextStyle: .title2)
        return visitorsLabel
    }()
    
    private var locationLabel: UILabel = {
        var locationLabel: UILabel = UILabel()
        locationLabel.translatesAutoresizingMaskIntoConstraints = false
        locationLabel.font = UIFont.preferredFont(forTextStyle: .title2)
        return locationLabel
    }()
    
    private var durationLabel: UILabel = {
        var durationLabel: UILabel = UILabel()
        durationLabel.translatesAutoresizingMaskIntoConstraints = false
        durationLabel.font = UIFont.preferredFont(forTextStyle: .title2)
        return durationLabel
    }()
    
    private var descriptionLabel: UILabel = {
        var descriptionLabel: UILabel = UILabel()
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.font = UIFont.preferredFont(forTextStyle: .body)
        descriptionLabel.numberOfLines = 0
        return descriptionLabel
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
        view.backgroundColor = .white
        self.view.addSubview(scrollView)
        scrollViewConstraints()
        contentsViewConstraints()
        dataContraints()
        decodeData()
        initData()
    }

    func decodeData() {
        guard let dataAsset = NSDataAsset(name: "exposition_universelle_1900") else { return }
        let jsonDecoder = JSONDecoder()
        expo1900 = try? jsonDecoder.decode(Expo.self, from: dataAsset.data)
    }
    
    func initData() {
        guard let expoData = expo1900 else { return }
        titleLabel.text = expoData.title
        expoImage.image = UIImage(named: "poster")
        visitorsLabel.text = "방문자 : \(expoData.visitors) 명"
        locationLabel.text = "개최지 : \(expoData.location)"
        durationLabel.text = "개최기간 : \(expoData.duration)"
        descriptionLabel.text = expoData.description
    }
    
    func scrollViewConstraints() {
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            scrollView.widthAnchor.constraint(equalTo: view.widthAnchor)
        ])
        scrollView.addSubview(contentsView)
        contentsView.addSubview(titleLabel)
        contentsView.addSubview(expoImage)
        contentsView.addSubview(visitorsLabel)
        contentsView.addSubview(locationLabel)
        contentsView.addSubview(durationLabel)
        contentsView.addSubview(descriptionLabel)
    }
    
    func contentsViewConstraints() {
        NSLayoutConstraint.activate([
            contentsView.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor),
            contentsView.leadingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor),
            contentsView.trailingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.trailingAnchor),
            contentsView.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor),
            contentsView.widthAnchor.constraint(equalTo: scrollView.frameLayoutGuide.widthAnchor)
        ])
    }
    
    func dataContraints() {
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: contentsView.leadingAnchor),
            titleLabel.topAnchor.constraint(equalTo: contentsView.topAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: contentsView.trailingAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: expoImage.topAnchor, constant: -10),
            titleLabel.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            expoImage.leadingAnchor.constraint(equalTo: contentsView.leadingAnchor),
            expoImage.trailingAnchor.constraint(equalTo: contentsView.trailingAnchor),
            expoImage.bottomAnchor.constraint(equalTo: visitorsLabel.topAnchor, constant: -10),
            expoImage.heightAnchor.constraint(equalToConstant: 200),
            visitorsLabel.leadingAnchor.constraint(equalTo: contentsView.leadingAnchor),
            visitorsLabel.trailingAnchor.constraint(equalTo: contentsView.trailingAnchor),
            visitorsLabel.bottomAnchor.constraint(equalTo: locationLabel.topAnchor, constant: -10),
            locationLabel.leadingAnchor.constraint(equalTo: contentsView.leadingAnchor),
            locationLabel.trailingAnchor.constraint(equalTo: contentsView.trailingAnchor),
            locationLabel.bottomAnchor.constraint(equalTo: durationLabel.topAnchor, constant: -10),
            durationLabel.leadingAnchor.constraint(equalTo: contentsView.leadingAnchor),
            durationLabel.trailingAnchor.constraint(equalTo: contentsView.trailingAnchor),
            durationLabel.bottomAnchor.constraint(equalTo: descriptionLabel.topAnchor, constant: -10),
            descriptionLabel.leadingAnchor.constraint(equalTo: contentsView.leadingAnchor),
            descriptionLabel.trailingAnchor.constraint(equalTo: contentsView.trailingAnchor),
            descriptionLabel.bottomAnchor.constraint(equalTo: contentsView.bottomAnchor),
            descriptionLabel.widthAnchor.constraint(equalTo: contentsView.widthAnchor)
        ])
        titleLabel.textAlignment = .center
        visitorsLabel.textAlignment = .center
        locationLabel.textAlignment = .center
        durationLabel.textAlignment = .center
    }
}
