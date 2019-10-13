//
//  TestController.swift
//  WeatherApp
//
//  Created by Dekola Ak on 13/10/2019.
//  Copyright © 2019 Dekola Ak. All rights reserved.
//

import Foundation
import UIKit

class TestController: UIViewController {
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        view.addSubview(views: imageImg, textLb)
        
        imageImg.alignTopToParentTop(by: 100)
        imageImg.setDimensions(height: 10, width: 10)
    }
    
    lazy var imageImg:UIImageView = {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "degree")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var textLb:UILabel = {
        let label = UILabel()
        label.text = "Sample text"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .customOrange
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()
}
