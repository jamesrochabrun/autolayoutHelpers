//
//  UVIew+Extension.swift
//  BlurZoomAnimator
//
//  Created by James Rochabrun on 11/4/18.
//  Copyright © 2018 James Rochabrun. All rights reserved.
//

import Foundation
import UIKit

protocol AutoLayout {}

extension UIView: AutoLayout {}

extension AutoLayout where Self == UIView {
    
    func anchor(top: NSLayoutYAxisAnchor?, leading: NSLayoutXAxisAnchor?, bottom: NSLayoutYAxisAnchor?, trailing: NSLayoutXAxisAnchor?, padding: UIEdgeInsets = .zero, size: CGSize = .zero) {
        
        translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top {
            topAnchor.constraint(equalTo: top, constant: padding.top).isActive = true
        }
        
        if let leading = leading {
            leadingAnchor.constraint(equalTo: leading, constant: padding.left).isActive = true
        }
        
        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: -padding.bottom).isActive = true
        }
        
        if let trailing = trailing {
            trailingAnchor.constraint(equalTo: trailing, constant: -padding.right).isActive = true
        }
        
        if size.width != 0 {
            widthAnchor.constraint(equalToConstant: size.width).isActive = true
        }
        
        if size.height != 0 {
            heightAnchor.constraint(equalToConstant: size.height).isActive = true
        }
        
    }
    
    func fillSuperview(inSafeAreas: Bool = false, padding: UIEdgeInsets = .zero) {
        
        translatesAutoresizingMaskIntoConstraints = false
        guard let superView = self.superview else { return }
        
        let topAnchor = inSafeAreas ? superView.safeAreaLayoutGuide.topAnchor : superView.topAnchor
        self.topAnchor.constraint(equalTo: topAnchor, constant: padding.top).isActive = true

        let leadingAnchor = inSafeAreas ? superView.safeAreaLayoutGuide.leadingAnchor : superView.leadingAnchor
        self.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding.left).isActive = true

        let trailingAnchor = inSafeAreas ? superView.safeAreaLayoutGuide.trailingAnchor : superView.trailingAnchor
        self.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding.right).isActive = true

        let bottomAnchor = inSafeAreas ? superView.safeAreaLayoutGuide.bottomAnchor : superView.bottomAnchor
        self.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -padding.bottom).isActive = true
    }
    
    func centerInSuperview(size: CGSize) {
        
        translatesAutoresizingMaskIntoConstraints = false
        if let superviewCenterXAnchor = superview?.centerXAnchor {
            centerXAnchor.constraint(equalTo: superviewCenterXAnchor).isActive = true
        }
        
        if let superviewCenterYAnchor = superview?.centerYAnchor {
            centerYAnchor.constraint(equalTo: superviewCenterYAnchor).isActive = true
        }
        
        widthAnchor.constraint(equalToConstant: size.width).isActive = true
        heightAnchor.constraint(equalToConstant: size.height).isActive = true
    }
    
    func anchorSize(to view: UIView, multiplier: CGFloat = 1.0) {
        
        translatesAutoresizingMaskIntoConstraints = false
        widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: multiplier).isActive = true
        heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: multiplier).isActive = true
    }
}















