//
//  ViewController.swift
//  BlurZoomAnimator
//
//  Created by James Rochabrun on 11/4/18.
//  Copyright © 2018 James Rochabrun. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var slider: UISlider!
    let animator = UIViewPropertyAnimator(duration: 0.5, curve: .linear)
    let vEffectView = UIVisualEffectView(effect: nil)

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTap)))
        animator.addAnimations {
            // completed animation state
            self.imageView.transform = CGAffineTransform(scaleX: 2, y: 2)
            self.vEffectView.effect =  UIBlurEffect(style: .regular)
        }
        setUpBlur()
    }
    
    private func setUpBlur() {
        view.insertSubview(vEffectView, belowSubview: slider)
        vEffectView.frame = view.frame
    }
    
    @objc func handleTap() {
    }

    @IBAction func sliderDidChange(_ sender: UISlider) {
        animator.fractionComplete = CGFloat(slider.value)
    }    
}

