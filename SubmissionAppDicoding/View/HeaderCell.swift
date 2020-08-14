//
//  PopularHeaderCell.swift
//  SubmissionAppDicoding
//
//  Created by Dewa Prabawa on 13/06/20.
//  Copyright © 2020 Dewa Prabawa. All rights reserved.
//

import UIKit

class HeaderCell: UITableViewCell {
     
    
    @IBOutlet weak var headerTitle:UILabel!
    @IBOutlet weak var headerNumber:UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configure(model:DestinationLine){
        headerTitle.text = "\(model.name) Tour"
        headerNumber.text = "\(model.destinations.count)"
        
       }

}
