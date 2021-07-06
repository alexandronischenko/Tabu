//
//  RoundedUIButton.swift
//  GameScreen
//
//  Created by Evans Owamoyo on 06.07.2021.
//

import UIKit


protocol Rounded {
    var cornerRadius: CGFloat { get set }
}

@IBDesignable public class RoundedUIButton: UIButton, Rounded {

    @IBInspectable var cornerRadius: CGFloat = 0.0 {
        didSet {
            layer.cornerRadius = cornerRadius
            layer.masksToBounds = cornerRadius > 0
        }
    }

}

@IBDesignable public class RoundedUIView: UIView, Rounded {
    @IBInspectable var cornerRadius: CGFloat = 0.0 {
        didSet {
            layer.cornerRadius = cornerRadius
            layer.masksToBounds = cornerRadius > 0
        }
    }
    
    
}
