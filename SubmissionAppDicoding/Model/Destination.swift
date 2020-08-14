//
//  Destination.swift
//  SubmissionAppDicoding
//
//  Created by Dewa Prabawa on 12/06/20.
//  Copyright © 2020 Dewa Prabawa. All rights reserved.
//

import Foundation
import UIKit



struct Destination: Destinationable {
    
    let name: String
    let rates: Double
    let description: String
    let price: Double
    let location: String
    let images: [String]

}


struct DestinationLine {
    let name: String
    let destinations: [Destination]
}

