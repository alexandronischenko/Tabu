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
    public override func prepareForInterfaceBuilder() {
        updateViewRadius()
    }
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        updateViewRadius()
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        updateViewRadius()
    }
    
    private func updateViewRadius() {
        layer.cornerRadius = cornerRadius
        layer.masksToBounds = cornerRadius > 0
    }
    
    @IBInspectable var cornerRadius: CGFloat = 0.0 {
        didSet {
            updateViewRadius()
        }
    }
    
    
}
