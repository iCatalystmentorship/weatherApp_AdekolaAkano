//
//  ViewController.swift
//  WeatherApp
//
//  Created by Dekola Ak on 10/10/2019.
//  Copyright © 2019 Dekola Ak. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = UIColor.white
    }


}

