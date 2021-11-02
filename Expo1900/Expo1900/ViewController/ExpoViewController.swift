//
//  Expo1900 - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ExpoViewController: UIViewController {
    var expo1900: Expo?
    
    private let scrollView: UIScrollView = {
        let scrollView: UIScrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.backgroundColor = .white
        return scrollView
    }()
    
    private let contentsView: UIView = {
        let contentsView: UIView = UIView()
        contentsView.translatesAutoresizingMaskIntoConstraints = false
        return contentsView
    }()
    
    private var titleLabel: UILabel = {
        var titleLabel: UILabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.font = UIFont.preferredFont(forTextStyle: .title1)
        titleLabel.numberOfLines = 2
        titleLabel.textAlignment = .center
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
        visitorsLabel.textAlignment = .center
        return visitorsLabel
    }()
    
    private var locationLabel: UILabel = {
        var locationLabel: UILabel = UILabel()
        locationLabel.translatesAutoresizingMaskIntoConstraints = false
        locationLabel.font = UIFont.preferredFont(forTextStyle: .title2)
        locationLabel.textAlignment = .center
        return locationLabel
    }()
    
    private var durationLabel: UILabel = {
        var durationLabel: UILabel = UILabel()
        durationLabel.translatesAutoresizingMaskIntoConstraints = false
        durationLabel.font = UIFont.preferredFont(forTextStyle: .title2)
        durationLabel.textAlignment = .center
        return durationLabel
    }()
    
    private var descriptionLabel: UILabel = {
        var descriptionLabel: UILabel = UILabel()
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.font = UIFont.preferredFont(forTextStyle: .body)
        descriptionLabel.numberOfLines = 0
        return descriptionLabel
    }()
    
    private var conversionButton: UIButton = {
        var conversionButton: UIButton = UIButton()
        conversionButton.translatesAutoresizingMaskIntoConstraints = false
        conversionButton.titleLabel?.font = UIFont.preferredFont(forTextStyle: .footnote)
        conversionButton.setTitle("🇰🇷     한국의 출품작     🇰🇷", for: .normal)
        conversionButton.setTitleColor(UIColor.blue, for: .normal)
        conversionButton.backgroundColor = .white
        conversionButton.contentHorizontalAlignment = .center
        return conversionButton
    }()
    
    func convertButton() {
        conversionButton.addTarget(self, action: #selector(convertViewController), for: .touchUpInside)
    }
    
    @objc func convertViewController() {
        let koreanItemsViewController = KoreanItemsViewController()
        self.navigationController?.pushViewController(koreanItemsViewController, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
        view.backgroundColor = .white
        scrollViewConstraints()
        contentsViewConstraints()
        dataContraints()
        convertButton()
        decodeData()
        initData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }

    func decodeData() {
        guard let dataAsset = NSDataAsset(name: "exposition_universelle_1900") else { return }
        let jsonDecoder = JSONDecoder()
        expo1900 = try? jsonDecoder.decode(Expo.self, from: dataAsset.data)
    }
    
    func convertDecimalVisitors() -> String {
        guard let expoItem = expo1900 else { return "" }
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        guard let result = numberFormatter.string(from: NSNumber(value: expoItem.visitors)) else { return "" }
        return result
    }
    
    func initData() {
        guard let expoData = expo1900 else { return }
        titleLabel.text = expoData.title
        expoImage.image = UIImage(named: "poster")
        visitorsLabel.text = "방문자 : \(convertDecimalVisitors()) 명"
        locationLabel.text = "개최지 : \(expoData.location)"
        durationLabel.text = "개최기간 : \(expoData.duration)"
        descriptionLabel.text = expoData.description
    }
    
    func addSubview() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentsView)
        contentsView.addSubview(titleLabel)
        contentsView.addSubview(expoImage)
        contentsView.addSubview(visitorsLabel)
        contentsView.addSubview(locationLabel)
        contentsView.addSubview(durationLabel)
        contentsView.addSubview(descriptionLabel)
        contentsView.addSubview(conversionButton)
    }
    
    func scrollViewConstraints() {
        addSubview()
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            scrollView.widthAnchor.constraint(equalTo: view.widthAnchor)
        ])
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
        titleLabelConstraints()
        expoImageConstraints()
        visitorsLabelConstraints()
        locationLabelConstraints()
        durationLabelConstraints()
        descriptionLabelConstraints()
        conversionButtonConstraints()
    }
    
    // MARK: dataConstraints Method
    func titleLabelConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: contentsView.leadingAnchor),
            titleLabel.topAnchor.constraint(equalTo: contentsView.topAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: contentsView.trailingAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: expoImage.topAnchor, constant: -10),
            titleLabel.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])
    }
    
    func expoImageConstraints() {
        NSLayoutConstraint.activate([
            expoImage.leadingAnchor.constraint(equalTo: contentsView.leadingAnchor),
            expoImage.trailingAnchor.constraint(equalTo: contentsView.trailingAnchor),
            expoImage.bottomAnchor.constraint(equalTo: visitorsLabel.topAnchor, constant: -10),
            expoImage.heightAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    func visitorsLabelConstraints() {
        NSLayoutConstraint.activate([
            visitorsLabel.leadingAnchor.constraint(equalTo: contentsView.leadingAnchor),
            visitorsLabel.trailingAnchor.constraint(equalTo: contentsView.trailingAnchor),
            visitorsLabel.bottomAnchor.constraint(equalTo: locationLabel.topAnchor, constant: -10)
        ])
    }
    
    func locationLabelConstraints() {
        NSLayoutConstraint.activate([
            locationLabel.leadingAnchor.constraint(equalTo: contentsView.leadingAnchor),
            locationLabel.trailingAnchor.constraint(equalTo: contentsView.trailingAnchor),
            locationLabel.bottomAnchor.constraint(equalTo: durationLabel.topAnchor, constant: -10)
        ])
    }
    
    func durationLabelConstraints() {
        NSLayoutConstraint.activate([
            durationLabel.leadingAnchor.constraint(equalTo: contentsView.leadingAnchor),
            durationLabel.trailingAnchor.constraint(equalTo: contentsView.trailingAnchor),
            durationLabel.bottomAnchor.constraint(equalTo: descriptionLabel.topAnchor, constant: -10)
        ])
    }
    
    func descriptionLabelConstraints() {
        NSLayoutConstraint.activate([
            descriptionLabel.leadingAnchor.constraint(equalTo: contentsView.leadingAnchor),
            descriptionLabel.trailingAnchor.constraint(equalTo: contentsView.trailingAnchor),
            descriptionLabel.bottomAnchor.constraint(equalTo: conversionButton.topAnchor, constant: -10),
            descriptionLabel.widthAnchor.constraint(equalTo: contentsView.widthAnchor)
        ])
    }
    
    func conversionButtonConstraints() {
        NSLayoutConstraint.activate([
            conversionButton.leadingAnchor.constraint(equalTo: contentsView.leadingAnchor),
            conversionButton.trailingAnchor.constraint(equalTo: contentsView.trailingAnchor),
            conversionButton.bottomAnchor.constraint(equalTo: contentsView.bottomAnchor, constant: -10)
        ])
    }
}
