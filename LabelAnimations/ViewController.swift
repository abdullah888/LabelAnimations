//
//  ViewController.swift
//  LabelAnimations
//
//  Created by abdullah  on 07/06/1441 AH.
//  Copyright © 1441 abdullah . All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let titleLebel = UILabel()
    let bodyLabel = UILabel()

    fileprivate func setupLabels() {
        titleLebel.font = UIFont(name: "Futura", size: 35)
        bodyLabel.font = UIFont(name: "Futura", size: 20)
        titleLebel.numberOfLines = 0
        bodyLabel.numberOfLines = 0
        titleLebel.text = "abdullah"
        bodyLabel.text = "تم عمل البرنامج بغلة SWIFT \nوموجود على حسابي في \ngithub"
    }
    
    fileprivate func setupStackView() {
        let stackView = UIStackView(arrangedSubviews: [titleLebel , bodyLabel])
        stackView.axis = .vertical
        stackView.spacing = 8
        view.addSubview(stackView)
        
        //  stackView.frame = CGRect(x: 0, y: 0, width: 200, height: 400)
        
        
        // enables autolayout
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        stackView.widthAnchor.constraint(equalTo: view.widthAnchor,constant: -100).isActive = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLabels()
        setupStackView()
        
        
        // fun animations
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTapAnimations)))
        
        
        
    }
    
    @objc fileprivate func handleTapAnimations()  {
        print("Hello")
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseOut, animations: {
            self.titleLebel.transform = CGAffineTransform(translationX: -30, y: 0)
        }) { (_) in
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                self.titleLebel.alpha = 0
                self.titleLebel.transform = self.titleLebel.transform.translatedBy(x: 0, y: -200)
            })
        }
        
        
        UIView.animate(withDuration: 0.5, delay: 0.5, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseOut, animations: {
                 self.bodyLabel.transform = CGAffineTransform(translationX: -30, y: 0)
             }) { (_) in
                 UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                     self.bodyLabel.alpha = 0
                     self.bodyLabel.transform = self.titleLebel.transform.translatedBy(x: 0, y: -200)
                 })
             }
    }


}

