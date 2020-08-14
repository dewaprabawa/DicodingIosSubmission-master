//
//  AboutViewController.swift
//  SubmissionAppDicoding
//
//  Created by Dewa Prabawa on 16/06/20.
//  Copyright © 2020 Dewa Prabawa. All rights reserved.
//

import Foundation
import UIKit

class AboutViewController:UIViewController{
    
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var container: UIView!
    
    
    override func viewDidLoad(){
        super.viewDidLoad()
        setupviews()
    }
    
        func setupviews(){
        profileImage.layer.cornerRadius = 65
        container.layer.cornerRadius = 20
        container.layer.shadowColor = UIColor.gray.cgColor
        container.layer.shadowRadius = 2
        container.layer.shadowOpacity = 2
        container.layer.shadowOffset = CGSize(width: 2, height: 3)
    }
}
