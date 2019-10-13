//
//  Extensions.swift
//  WeatherApp
//
//  Created by Dekola Ak on 12/10/2019.
//  Copyright © 2019 Dekola Ak. All rights reserved.
//

import Foundation
import UIKit

extension UIView{
    
    func addGesture(_ gesture:UITapGestureRecognizer){
        self.isUserInteractionEnabled = true
        self.addGestureRecognizer(gesture)
    }
    
    func setHeight(height:CGFloat){
        self.heightAnchor.constraint(equalToConstant: height).isActive = true
    }
    
    func setWidth(width:CGFloat){
        self.widthAnchor.constraint(equalToConstant: width).isActive = true
    }
    
    func setDimensions(height:CGFloat, width:CGFloat){
        self.heightAnchor.constraint(equalToConstant: height).isActive = true
        self.widthAnchor.constraint(equalToConstant: width).isActive = true
    }
    
    func addSubview(views : UIView...){
        for view in views {
            addSubview(view)
            view.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    func addConstraints(formats: [String], view: UIView){
        for format in formats{
            addConstraints(format: format, views: view)
        }
    }
    
    func addConstraints(formats: [String], views: UIView...){
        for format in formats{
            for view in views{
                addConstraints(format: format, views: view)
            }
        }
    }
    
    func addConstraints(format: String, views: [UIView]){
        for myView in views{
            addConstraints(format: format, views: myView)
        }
    }
    
    func addConstraints(format : String, views : UIView...){
        var myDict = [String:UIView]()
        
        for (index, view) in views.enumerated() {
            myDict["v\(index)"] = view
            self.addSubview(views: view)
        }
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: myDict))
    }
    
    func setShadow(shadowRadius: CGFloat = 3, color:UIColor = UIColor.rgb(200, 200, 200), offSet:Int = 0, opacity:Float = 10){
        self.layer.shadowColor = color.cgColor
        self.layer.shadowOpacity = opacity;
        self.layer.shadowRadius = shadowRadius;
        self.layer.shadowOffset = CGSize(width: offSet, height: offSet)
    }
    
    func alignHorizontal(views: UIView...){
        for myView in views {
            self.addSubview(views: myView)
            
//            self.addConstraint(NSLayoutConstraint(item: myView, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1.0, constant: 0.0))
            
            myView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        }
    }
    
    func alignVertical(views: UIView...){
        for myView in views {
            self.addSubview(views: myView)
            
//            self.addConstraint(NSLayoutConstraint(item: myView, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1.0, constant: 0.0))
            
            myView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true

        }
    }
    
//    func alignHorizontal(views: UIView..., to:UIView){
//        for myView in views {
//            self.addSubview(views: myView)
//            self.addConstraint(NSLayoutConstraint(item: myView, attribute: .centerX, relatedBy: .equal, toItem: to, attribute: .centerX, multiplier: 1.0, constant: 0.0))
//        }
//    }
//    
//    func alignVertical(views: UIView..., to:UIView){
//        for myView in views {
//            self.addSubview(views: myView)
//            self.addConstraint(NSLayoutConstraint(item: myView, attribute: .centerY, relatedBy: .equal, toItem: to, attribute: .centerY, multiplier: 1.0, constant: 0.0))
//        }
//    }
    
    func alignTopToParentTop(by:CGFloat=0){
        self.topAnchor.constraint(equalTo: self.superview!.topAnchor, constant: by).isActive = true
    }
    
    func alignTopToTopOf(of:UIView, by:CGFloat=0){
        self.topAnchor.constraint(equalTo: of.topAnchor, constant: by).isActive = true
    }
    
    func alignTopToBottomOf(of:UIView, by:CGFloat=0){
        self.topAnchor.constraint(equalTo: of.bottomAnchor, constant: by).isActive = true
    }
    
    func alignBottomToBottomOf(of:UIView, by:CGFloat=0){
        self.bottomAnchor.constraint(equalTo: of.bottomAnchor, constant: by).isActive = true
    }
    
    func alignBottomToParentBottom(by:CGFloat=0){
        self.bottomAnchor.constraint(equalTo: self.superview!.bottomAnchor, constant: by).isActive = true
    }
    
    func alignBottomToTopOf(of:UIView, by:CGFloat=0){
        self.bottomAnchor.constraint(equalTo: of.topAnchor, constant: by).isActive = true
    }
    
    func alignStartToStartOf(of:UIView, by:CGFloat=0){
        self.leadingAnchor.constraint(equalTo: of.leadingAnchor, constant: by).isActive = true
    }
    func alignStartToParentStart(by:CGFloat=0){
        self.leadingAnchor.constraint(equalTo: self.superview!.leadingAnchor, constant: by).isActive = true
    }
    
    func alignStartToEndOf(of:UIView, by:CGFloat=0){
        self.leadingAnchor.constraint(equalTo: of.trailingAnchor, constant: by).isActive = true
    }
    
    func alignEndToEndOf(of:UIView, by:CGFloat=0){
        self.trailingAnchor.constraint(equalTo: of.trailingAnchor, constant: by).isActive = true
    }
    
    func alignEndToParentEnd(by:CGFloat=0){
        self.trailingAnchor.constraint(equalTo: self.superview!.trailingAnchor, constant: by).isActive = true
    }
    
    func alignEndToStartOf(of:UIView, by:CGFloat=0){
        self.trailingAnchor.constraint(equalTo: of.leadingAnchor, constant: by).isActive = true
    }
    
    func alignToCenterHorizontal(of:UIView, by:CGFloat=0){
        self.centerXAnchor.constraint(equalTo: of.centerXAnchor, constant: by).isActive = true
    }
    
    func alignToCenterVertical(of:UIView, by:CGFloat=0){
        self.centerYAnchor.constraint(equalTo: of.centerYAnchor, constant: by).isActive = true
    }
    
}

extension UITextField{
    
    func isEmailValid() -> Bool {
        // here, `try!` will always succeed because the pattern is valid
        let regex = try! NSRegularExpression(pattern: "^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$", options: .caseInsensitive)
        let valid = regex.firstMatch(in: self.text ?? "", options: [], range: NSRange(location: 0, length: self.text?.count ?? 0)) != nil
        
        if !valid {
            showError()
        }
        
        return valid
    }
    
    func isValid(lenght:Int = 1)->Bool{
        let textCount = self.text?.count ?? 0
        let valid = textCount >= lenght
        if !valid{
            showError()
        }
        return valid
    }
    
    func showError(){
        let animation: CABasicAnimation = CABasicAnimation(keyPath: "shadowColor")
        animation.fromValue = UIColor.green
        animation.toValue = UIColor.red.cgColor
        animation.duration = 0.4
        animation.autoreverses = true
        self.layer.add(animation, forKey: "")
        
        let shake: CABasicAnimation = CABasicAnimation(keyPath: "position")
        shake.duration = 0.07
        shake.repeatCount = 3
        shake.autoreverses = true
        shake.fromValue = NSValue(cgPoint: CGPoint(x: self.center.x - 10, y: self.center.y))
        shake.toValue = NSValue(cgPoint: CGPoint(x: self.center.x + 10, y: self.center.y))
        self.layer.add(shake, forKey: "position")
    }
    func setPadding(left:Bool = false, right:Bool = false, vertical:Bool = false, size:Int = 15){
        let paddingView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: size, height: 0))
        
        if left {
            self.leftView = paddingView
            self.leftViewMode = .always
        }
        if right{
            self.rightView = paddingView
            self.rightViewMode = .always
        }
        
        if vertical{
            self.heightAnchor.constraint(equalToConstant: 45).isActive = true
        }
    }
    
    func setPadding(){
        let paddingView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: 0))
        self.leftView = paddingView
        self.leftViewMode = .always
        self.rightView = paddingView
        self.rightViewMode = .always
        self.heightAnchor.constraint(equalToConstant: 45).isActive = true
    }
    
    func setIcon(_ image: UIImage) {
        let iconView = UIImageView(frame: CGRect(x: 10, y: 5, width: 20, height: 20))
        
        iconView.image = image
        
        let iconContainerView: UIView = UIView(frame: CGRect(x: 20, y: 0, width: 40, height: 30))
        
        iconContainerView.addSubview(iconView)
        leftView = iconContainerView
        leftViewMode = .always
    }
}

extension UIStackView {
    func addArrangedSubview(views:UIView...){
        for view in views{
            self.addArrangedSubview(view)
        }
    }
    
    func setPadding(dimension:CGFloat){
        self.layoutMargins = UIEdgeInsets(top: dimension, left: dimension, bottom: dimension, right: dimension)
        self.isLayoutMarginsRelativeArrangement = true
    }
    
    func setPadding(top:CGFloat, bottom:CGFloat, left:CGFloat, right:CGFloat){
        self.layoutMargins = UIEdgeInsets(top: top, left: left, bottom: bottom, right: right)
        self.isLayoutMarginsRelativeArrangement = true
    }
    
    func setCustomSpacing(dimension:CGFloat, after:UIView...) {
        for view in after{
            self.setCustomSpacing(dimension, after: view)
        }
    }
    
    func addBackground(color: UIColor) {
        let subView = UIView(frame: bounds)
        subView.backgroundColor = color
        subView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        insertSubview(subView, at: 0)
        subView.layer.cornerRadius = 10
    }
}

extension UIColor {

    static let customOrange = UIColor.rgb(245, 126, 115)

    static func rgb(_ red: CGFloat, _ green: CGFloat, _ blue: CGFloat, _ alpha: CGFloat = 1) -> UIColor {
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: alpha)
    }

    convenience init?(hex: String) {
        var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        hexSanitized = hexSanitized.replacingOccurrences(of: "#", with: "")
        
        var rgb: UInt32 = 0
        
        var r: CGFloat = 0.0
        var g: CGFloat = 0.0
        var b: CGFloat = 0.0
        var a: CGFloat = 1.0
        
        let length = hexSanitized.count
        
        guard Scanner(string: hexSanitized).scanHexInt32(&rgb) else { return nil }
        
        if length == 6 {
            r = CGFloat((rgb & 0xFF0000) >> 16) / 255.0
            g = CGFloat((rgb & 0x00FF00) >> 8) / 255.0
            b = CGFloat(rgb & 0x0000FF) / 255.0
            
        } else if length == 8 {
            r = CGFloat((rgb & 0xFF000000) >> 24) / 255.0
            g = CGFloat((rgb & 0x00FF0000) >> 16) / 255.0
            b = CGFloat((rgb & 0x0000FF00) >> 8) / 255.0
            a = CGFloat(rgb & 0x000000FF) / 255.0
            
        } else {
            return nil
        }
        
        self.init(red: r, green: g, blue: b, alpha: a)
    }
    
    // MARK: - Computed Properties
    
    var toHex: String? {
        return toHex()
    }
    
    // MARK: - From UIColor to String
    
    func toHex(alpha: Bool = false) -> String? {
        guard let components = cgColor.components, components.count >= 3 else {
            return nil
        }
        
        let r = Float(components[0])
        let g = Float(components[1])
        let b = Float(components[2])
        var a = Float(1.0)
        
        if components.count >= 4 {
            a = Float(components[3])
        }
        
        if alpha {
            return String(format: "%02lX%02lX%02lX%02lX", lroundf(r * 255), lroundf(g * 255), lroundf(b * 255), lroundf(a * 255))
        } else {
            return String(format: "%02lX%02lX%02lX", lroundf(r * 255), lroundf(g * 255), lroundf(b * 255))
        }
    }
    
}

extension UIButton {
    private func imageWithColor(color: UIColor) -> UIImage? {
        let rect = CGRect(x: 0.0, y: 0.0, width: 1.0, height: 1.0)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        
        context?.setFillColor(color.cgColor)
        context?.fill(rect)
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return image
    }
    
    func setBackgroundColor(_ color: UIColor, for state: UIControl.State) {
        self.setBackgroundImage(imageWithColor(color: color), for: state)
    }
}

extension UIScrollView{
    
    func addStackView(stackView:UIStackView){
        stackView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        
        // Set the width of the stack view to the width of the scroll view for vertical scrolling
        stackView.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        //        formSv.heightAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
    }
}

extension UILabel{
    func setText(text:String, isCompulsory:Bool = false){
        let attributedText = NSMutableAttributedString()
        
        if isCompulsory{
            attributedText.append(NSAttributedString(string: "*  ", attributes: [NSAttributedString.Key.foregroundColor: UIColor.red]))
        }
        
        attributedText.append(NSAttributedString(string: text, attributes: nil))
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 4
        
        attributedText.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: NSMakeRange(0, attributedText.string.count))
        
        self.attributedText = attributedText
    }
}

extension UIImageView{
    //    func setPadding(left:Bool = false, right:Bool = false, vertical:Bool = false, size:Int = 15){
    //        let paddingView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: size, height: 0))
    //
    //        if left {
    //            self.leftView = paddingView
    //            self.leftViewMode = .always
    //        }
    //        if right{
    //            self.rightView = paddingView
    //            self.rightViewMode = .always
    //        }
    //
    //        if vertical{
    //            self.heightAnchor.constraint(equalToConstant: 45).isActive = true
    //        }
    //    }
}
extension UIImageView {
    
    func setCornerRadius(radius:CGFloat){
        self.layer.cornerRadius = radius
        self.clipsToBounds = true
    }
    
    func applyshadowWithCorner(containerView : UIView, cornerRadious : CGFloat){
        containerView.clipsToBounds = false
        containerView.layer.shadowColor = UIColor.black.cgColor
        containerView.layer.shadowOpacity = 1
        containerView.layer.shadowOffset = CGSize.zero
        containerView.layer.shadowRadius = 10
        containerView.layer.cornerRadius = cornerRadious
        containerView.layer.shadowPath = UIBezierPath(roundedRect: containerView.bounds, cornerRadius: cornerRadious).cgPath
        self.clipsToBounds = true
        self.layer.cornerRadius = cornerRadious
    }
}

extension Date {
    func string(format: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.string(from: self)
    }
}

extension String {
    func toBase64() -> String? {
        return Data(self.utf8).base64EncodedString()
    }
    
    func fromBase64() -> String? {
        let b64 = self
            .replacingOccurrences(of: "-", with: "+")
            .replacingOccurrences(of: "_", with: "/")
        guard let data = Data(base64Encoded: b64, options: .ignoreUnknownCharacters) else{
            return nil
        }
        return String(data: data, encoding: String.Encoding.utf8)
    }
}

extension Int {
    func withCommas() -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = NumberFormatter.Style.decimal
        return numberFormatter.string(from: NSNumber(value:self))!
    }
}

extension Float {
    func withCommas() -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = NumberFormatter.Style.decimal
        return numberFormatter.string(from: NSNumber(value:self))!
    }
}
