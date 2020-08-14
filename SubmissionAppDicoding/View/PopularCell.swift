//
//  PopularCell.swift
//  SubmissionAppDicoding
//
//  Created by Dewa Prabawa on 12/06/20.
//  Copyright © 2020 Dewa Prabawa. All rights reserved.
//
import Foundation
import UIKit

class PopularCell: UITableViewCell {
    
    private var destination = DestinationDataSource().destinationLine
    private var recomanded = DestinationDataSource().recomandedLine
    
    var allTourController:AllTourController?
    
    @IBOutlet weak var headerTitle:UILabel!
    @IBOutlet weak var headerForNumber:UILabel!
    @IBOutlet weak var collectionView:UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupviews()
    }
    
    
    func setupviews(){
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(PopularCollectionCell.nib(), forCellWithReuseIdentifier: PopularCollectionCell.identifier)
        
        if let flowlayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            flowlayout.scrollDirection = .horizontal
            flowlayout.minimumLineSpacing = 15
            flowlayout.itemSize = CGSize(width: 150, height: 150)
        }
        
        headerForNumber.text = "\(destination[0].destinations.count)"
        headerTitle.text = "\(destination[0].name) Tour"
        
    }

}



extension PopularCell:UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return recomanded.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell:PopularCollectionCell = collectionView.dequeueReusableCell(for: indexPath)
        cell.configure(model: recomanded[indexPath.row])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: 150, height: 150)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets.init(top: 0, left: 20, bottom: 0, right: 20)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        allTourController?.pushNavigationToDetail(recomanded[indexPath.row])
        
    }
}
