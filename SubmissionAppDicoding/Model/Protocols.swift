//
//  Protocols.swift
//  SubmissionAppDicoding
//
//  Created by Dewa Prabawa on 12/06/20.
//  Copyright © 2020 Dewa Prabawa. All rights reserved.
//

import Foundation
import UIKit

protocol Destinationable {
    var name: String {get}
    var rates: Double {get}
    var description: String {get}
    var price: Double {get}
    var location: String {get}
    var images: [String] {get}
}


protocol Configurable {
    func configure(model:Destination)
}

protocol PushNavigationController {
    func pushNavigationToDetail(_ model:Destination)
}


protocol ReusableCell {
    static var identifier:String{get}
    static func nib() -> UINib?
}


extension ReusableCell {
    static var identifier:String{
        return String(describing: self)
    }
    static func nib() -> UINib?{
        return UINib(nibName: String(describing: self), bundle: nil)
    }
}


extension UITableViewCell: ReusableCell{}

extension UICollectionViewCell:ReusableCell{}



extension UITableView{
    
    func dequeueReusableCell<T:UITableViewCell>(for indexPath:IndexPath) -> T {
        guard let cell = dequeueReusableCell(withIdentifier: T.identifier, for: indexPath) as? T else {
            fatalError()
        }
        return cell
    }
    
    
    func dequeueReusableCellHeader<T:UITableViewCell>() -> T {
          guard let cell = dequeueReusableCell(withIdentifier: T.identifier) as? T else {
              fatalError()
          }
          return cell
      }
    
    
    func registerReusableCell<T:UITableViewCell>(_:T.Type){
        if let nib = T.nib(){
            register(nib, forCellReuseIdentifier: T.identifier)
        }else{
            register(T.self, forCellReuseIdentifier: T.identifier)
        }
    }
}


extension UICollectionView{
    
    func dequeueReusableCell<T:UICollectionViewCell>(for indexPath:IndexPath) -> T {
        guard let cell = dequeueReusableCell(withReuseIdentifier: T.identifier, for: indexPath) as? T else {
              fatalError()
          }
          return cell
      }
    
    func registerReusableCell<T:UICollectionViewCell>(_:T.Type){
        if let nib = T.nib(){
            register(nib, forCellWithReuseIdentifier: T.identifier)
        }else{
            register(T.self, forCellWithReuseIdentifier: T.identifier)
        }
    }
}
