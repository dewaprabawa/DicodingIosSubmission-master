//
//  TourCellTableViewCell.swift
//  SubmissionAppDicoding
//
//  Created by Dewa Prabawa on 12/06/20.
//  Copyright © 2020 Dewa Prabawa. All rights reserved.
//

import UIKit

class TourCellTableViewCell: UITableViewCell {
    
    @IBOutlet weak var tourImage:UIImageView!
    @IBOutlet weak var tourLocation:UILabel!
    @IBOutlet weak var tourName:UILabel!
    @IBOutlet weak var tourRates:UIImageView!
    @IBOutlet weak var tourPrice:UILabel!
    @IBOutlet weak var tourDescription:UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
}


extension TourCellTableViewCell:Configurable{
    func configure(model: Destination) {
           tourImage.image = UIImage(named: model.images[0])
           tourName.text = model.name
           tourPrice.text = "$\(model.price)"
           tourRates.image = imageRates(rates: model.rates)
           tourDescription.text = model.description
           tourLocation.text = model.location
          }
          
       
       func imageRates(rates:Double) -> UIImage? {
           let stars = "stars\(rates)"
           return UIImage(named: stars)
       }
}
