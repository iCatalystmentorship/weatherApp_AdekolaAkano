//
//  ViewController.swift
//  WeatherApp
//
//  Created by Dekola Ak on 10/10/2019.
//  Copyright © 2019 Dekola Ak. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    let location = "Khorramabad . Iran"
    let weatherCondition = "Most Cloudy"
    let temperature = "12"
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = UIColor.white
        view.addSubview(views: locationLb, topSv, weatherDetailsLb, collectioView)
        
        locationLb.alignTopToParentTop(by: 50)
        
        view.alignHorizontal(views: locationLb, topSv, weatherDetailsLb)
        
        topSv.alignTopToBottomOf(of: locationLb, by: 30)
        
        weatherDetailsLb.alignTopToBottomOf(of: topSv, by: 20)
        
        collectioView.alignBottomToBottomOf(of: view, by: -15)
        collectioView.alignStartToStartOf(of: view, by: 15)
        collectioView.alignEndToEndOf(of: view, by: -15)
        
        collectioView.setHeight(height: 135)
    }
    
    lazy var locationLb:UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.textAlignment = .center
        let attributedText = NSMutableAttributedString()
        
        let attachment = NSTextAttachment()
        attachment.image = #imageLiteral(resourceName: "location")
        attachment.bounds = CGRect(x: 0, y: 0, width: 18, height: 18)
        attributedText.append(NSAttributedString(attachment: attachment))
        
        attributedText.append(NSAttributedString(string: "  \(location)", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 17), NSAttributedString.Key.foregroundColor: UIColor.customOrange]))
        
        attributedText.append(NSAttributedString(string: "\nUpdated As Of ", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 13), NSAttributedString.Key.foregroundColor: UIColor.customOrange]))
        
        attributedText.append(NSAttributedString(string: Date().string(format: "HH:mm a"), attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 13), NSAttributedString.Key.foregroundColor: UIColor.customOrange]))
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 4
        paragraphStyle.alignment = .center
        attributedText.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: NSMakeRange(0, attributedText.string.count))
        
        label.attributedText = attributedText
        
        return label
    }()

    lazy var temperatureLb:UILabel={
        let label = UILabel()
        
        let attributedText = NSMutableAttributedString()
        
        attributedText.append(NSAttributedString(string: temperature, attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 140), NSAttributedString.Key.foregroundColor:UIColor.customOrange]))
        
        let degreeImageAttachment = NSTextAttachment()
        degreeImageAttachment.image = #imageLiteral(resourceName: "degree")
        degreeImageAttachment.bounds = CGRect(x: 0, y: 80, width: 18, height: 18)
        attributedText.append(NSAttributedString(attachment: degreeImageAttachment))
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 4
        paragraphStyle.alignment = .natural
        attributedText.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: NSMakeRange(0, attributedText.string.count))


        label.attributedText = attributedText
        return label
    }()
    
    lazy var weatherConditionLb:UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        
        let attributedString = NSMutableAttributedString()
        
        let imageAttachment = NSTextAttachment()
        imageAttachment.image = #imageLiteral(resourceName: "cloud")
        imageAttachment.bounds = CGRect(x: 0, y: 0, width: 80, height: 80)
        attributedString.append(NSAttributedString(attachment: imageAttachment))
        
        attributedString.append(NSAttributedString(string: "\n\(weatherCondition)", attributes: [.font:UIFont.systemFont(ofSize: 20), .foregroundColor:UIColor.customOrange]))

        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 4
        paragraphStyle.alignment = .center
        attributedString.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: NSMakeRange(0, attributedString.string.count))
        
        label.attributedText = attributedString

        return label
    }()
    
    lazy var rainLb:UILabel = {
        let label = UILabel()
        
        let attributedString = NSMutableAttributedString()
        
        let imageAttachment = NSTextAttachment()
        imageAttachment.image = #imageLiteral(resourceName: "rain")
        imageAttachment.bounds = CGRect(x: 0, y: 0, width: 15, height: 15)
        attributedString.append(NSAttributedString(attachment: imageAttachment))
        
        attributedString.append(NSAttributedString(string: "  Rainy", attributes: [.font:UIFont.systemFont(ofSize: 17), .foregroundColor:UIColor.customOrange]))
        
        label.attributedText = attributedString
        return label
    }()
    
    lazy var durationVw:UIView = {
        let view = UIView()
        
        let durationImg = UIImageView()
        durationImg.image = #imageLiteral(resourceName: "duration")
        let durationLb = UILabel()
        durationLb.text = "2h"
        durationLb.font = UIFont.systemFont(ofSize: 8)
        durationLb.textColor = .customOrange
        
        view.addConstraints(formats: ["V:|[v0(20)]|", "H:|[v0(20)]|"], view: durationImg)
        
        view.alignHorizontal(views: durationLb)
        view.alignVertical(views: durationLb)
        
        return view
    }()
    
    lazy var weatherConditionVw:UIView = {
        let view = UIView()
//        view.backgroundColor = .green
        view.addSubview(views: durationVw)
        view.addConstraints(format: "V:|-15-[v0]-1-[v1]", views: weatherConditionLb, rainLb)
        view.addConstraints(format: "H:|[v0]-20-|", views: weatherConditionLb)
        
        durationVw.alignBottomToBottomOf(of: rainLb)
        durationVw.alignStartToEndOf(of: rainLb, by: 5)
//        view.alignHorizontal(views: rainLb)
        
        return view
    }()
    
    lazy var topSv:UIStackView = {
        let stackView = UIStackView()
//        stackView.addBackground(color: .red)
        stackView.axis = .horizontal
//        stackView.alignment = .center
        stackView.spacing = 20
        stackView.addArrangedSubview(views: temperatureLb, weatherConditionVw)
        return stackView
    }()

    let weatherDetailsLb:UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        let attributedText = NSMutableAttributedString()
        attributedText.append(NSAttributedString(string: "Feels Like", attributes: [.font:UIFont.boldSystemFont(ofSize: 15), NSAttributedString.Key.foregroundColor:UIColor.customOrange]))
        
        attributedText.append(NSAttributedString(string: " 12       ", attributes: [.font:UIFont.systemFont(ofSize: 15), NSAttributedString.Key.foregroundColor:UIColor.customOrange]))
        
        attributedText.append(NSAttributedString(string: "Wind", attributes: [.font:UIFont.boldSystemFont(ofSize: 15), NSAttributedString.Key.foregroundColor:UIColor.customOrange]))
        
        attributedText.append(NSAttributedString(string: " 0km/h", attributes: [.font:UIFont.systemFont(ofSize: 15), NSAttributedString.Key.foregroundColor:UIColor.customOrange]))
        
        attributedText.append(NSAttributedString(string: "\nBarometer", attributes: [.font:UIFont.boldSystemFont(ofSize: 15), NSAttributedString.Key.foregroundColor:UIColor.customOrange]))
        
        attributedText.append(NSAttributedString(string: " 1014.00 mb       ", attributes: [.font:UIFont.systemFont(ofSize: 15), NSAttributedString.Key.foregroundColor:UIColor.customOrange]))
        
        attributedText.append(NSAttributedString(string: "Humidity", attributes: [.font:UIFont.boldSystemFont(ofSize: 15), NSAttributedString.Key.foregroundColor:UIColor.customOrange]))
        
        attributedText.append(NSAttributedString(string: " 71%", attributes: [.font:UIFont.systemFont(ofSize: 15), NSAttributedString.Key.foregroundColor:UIColor.customOrange]))
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .center
        paragraphStyle.lineSpacing = 4
        attributedText.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: NSMakeRange(0, attributedText.string.count))
        
        
        label.attributedText = attributedText
        
        return label
    }()
    
    lazy var collectioView:UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.minimumLineSpacing = 10
        let collectioView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectioView.register(Cell.self, forCellWithReuseIdentifier: "cell")
        collectioView.delegate = self
        collectioView.dataSource = self
        collectioView.backgroundColor = .white
        return collectioView
    }()
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! Cell
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 90, height: 120)
    }
}
