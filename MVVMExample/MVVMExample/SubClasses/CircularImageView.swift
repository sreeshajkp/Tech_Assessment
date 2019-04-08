//
//  CircularImageView.swift
//  MVVMExample
//
//  Created by Veena on 05/04/19.
//  Copyright © 2019 Veena. All rights reserved.
//

import Foundation
import UIKit

/// Circular Image View
@IBDesignable class CircularImageView : UIImageView {
    private var _round = false
    
    /// Colour For Border
    @IBInspectable var borderColour : UIColor = UIColor.clear {
        didSet{
            drawBorder()
        }
    }
    
    
    /// Border Width
    @IBInspectable var borderWidth : CGFloat = 0.0 {
        didSet{
            drawBorder()
        }
    }
    
    /// Decides if image view is round or normal (Square)
    @IBInspectable var round: Bool {
        set {
            _round = newValue
            makeRound()
        }
        get {
            return self._round
        }
    }
    
    override internal var frame: CGRect {
        set {
            super.frame = newValue
            makeRound()
        }
        get {
            return super.frame
        }
        
    }
    
    private func makeRound() {
        if self.round == true {
            self.clipsToBounds = true
            self.layer.cornerRadius = (self.frame.width + self.frame.height) / 4
        } else {
            self.layer.cornerRadius = 0
        }
    }
    
    private func drawBorder() {
        self.layer.borderWidth = borderWidth
        self.layer.borderColor = borderColour.cgColor
    }
    
    override func layoutSubviews() {
        makeRound()
    }
}
