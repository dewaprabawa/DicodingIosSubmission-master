//
//  PopularCollectionCell.swift
//  SubmissionAppDicoding
//
//  Created by Dewa Prabawa on 12/06/20.
//  Copyright © 2020 Dewa Prabawa. All rights reserved.
//

import UIKit

class PopularCollectionCell: UICollectionViewCell, Configurable {

    @IBOutlet weak var tourImage:UIImageView!
    @IBOutlet weak var tourName:UILabel!
    @IBOutlet weak var tourLocation:UILabel!
    
    func configure(model: Destination) {
        tourName.text = model.name
        tourImage.image = UIImage(named: model.images[0])
        tourLocation.text = model.location
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
