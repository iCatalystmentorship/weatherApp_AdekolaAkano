//
//  Cell.swift
//  WeatherApp
//
//  Created by Dekola Ak on 13/10/2019.
//  Copyright © 2019 Dekola Ak. All rights reserved.
//

import Foundation
import UIKit

class Cell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        alignVertical(views: label)
        alignHorizontal(views: label)
        
//        addConstraints(formats: ["V:|-4-[v0]-4-|", "H:|-8-[v0]-8-|"], view: label)
    }
    
    func setColor(_ index:Int){
        if index != 0{
            label.textColor = .customOrange
            self.contentView.backgroundColor = .white
        }
        else{
            label.textColor = .white
            self.contentView.backgroundColor = .customOrange
        }
        self.contentView.layer.cornerRadius = 18
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var label:UILabel = {
        let label = UILabel()
        label.numberOfLines = 6
        
        let attributedText = NSMutableAttributedString()
        
        attributedText.append(NSAttributedString(string: "Tomorrow 22\n", attributes: [.font:UIFont.systemFont(ofSize: 9), .foregroundColor:UIColor.white]))
        
        attributedText.append(NSAttributedString(string: "57", attributes: [.font:UIFont.boldSystemFont(ofSize: 26), .foregroundColor:UIColor.white]))
        
        let degreeImgAttachment = NSTextAttachment()
        degreeImgAttachment.image = #imageLiteral(resourceName: "degree")
        degreeImgAttachment.bounds = CGRect(x: 0, y: 17, width: 8, height: 8)
        attributedText.append(NSAttributedString(attachment: degreeImgAttachment))
        
        attributedText.append(NSAttributedString(string: "43\n", attributes: [.font:UIFont.systemFont(ofSize: 13), .foregroundColor:UIColor.rgb(250, 250, 250)]))
        
        let cloudImgAttachment = NSTextAttachment()
        cloudImgAttachment.image = #imageLiteral(resourceName: "cloud")
        cloudImgAttachment.bounds = CGRect(x: 0, y: 0, width: 20, height: 20)
        attributedText.append(NSAttributedString(attachment: cloudImgAttachment))
        
        attributedText.append(NSAttributedString(string: "\nMostly Cloudy", attributes: [.font:UIFont.systemFont(ofSize: 9), .foregroundColor:UIColor.white]))
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 3
        
        attributedText.addAttribute(.paragraphStyle, value: paragraphStyle, range: NSMakeRange(0, attributedText.string.count))
        
        label.attributedText = attributedText
        return label
    }()
    
}
