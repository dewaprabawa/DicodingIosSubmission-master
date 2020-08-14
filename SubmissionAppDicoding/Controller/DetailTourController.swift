//  DetailTourController.swift
//  SubmissionAppDicoding
//  Created by Dewa Prabawa on 13/06/20.
//  Copyright © 2020 Dewa Prabawa. All rights reserved.
//

import Foundation
import UIKit

class DetailTourController:UIViewController, Configurable {
   
    //MARK: Properties
    
    var destination:Destination?
    var timer = Timer()
    var counter = 0


    @IBOutlet weak var collectionView:UICollectionView!
    @IBOutlet weak var pageControl:UIPageControl!
    @IBOutlet weak var tourName:UILabel!
    @IBOutlet weak var tourLocation:UILabel!
    @IBOutlet weak var tourDescription:UILabel!
    @IBOutlet weak var tourPrice: UILabel!
    @IBOutlet weak var tourRate:UIImageView!
    @IBOutlet weak var heighConstraint: NSLayoutConstraint!
    
    
    func configure(model: Destination) {
      self.destination = model
    }
     
    
    override func viewDidLoad(){
        super.viewDidLoad()
        setupview()
        pageControllerSetups()
        DispatchQueue.main.async {
          self.timer = Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(self.autoSwipeImage), userInfo: nil, repeats: true)
        }
    }
    
    override func viewDidLayoutSubviews() {
        self.heighConstraint.constant = self.view.frame.height/2
    }

    
     //MARK: SETUPVIEW
    func setupview(){
        
        
        //MARK: CollectionView Setups
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.isPagingEnabled = true
        collectionView.register(CarouselSliderCell.nib(), forCellWithReuseIdentifier: CarouselSliderCell.identifier)
        collectionView.automaticallyAdjustsScrollIndicatorInsets = true
        collectionView.isPagingEnabled = true
        
        if let flowlayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            flowlayout.scrollDirection = .horizontal
            flowlayout.estimatedItemSize = .zero
            flowlayout.minimumLineSpacing = 0
        }
        
        
        //MARK: Populating Data
        guard let destination = destination else {return}
        tourPrice.text  = "$\(destination.price)"
        tourName.text = "\(destination.name)"
        tourLocation.text = "\(destination.location)"
        tourDescription.text = "\(destination.description)"
        tourRate.image = UIImage(named: "stars\(destination.rates)")
   
    }
    
    
    func pageControllerSetups(){
        pageControl.currentPageIndicatorTintColor = .systemGreen
        pageControl.pageIndicatorTintColor = .systemGray
        pageControl.numberOfPages = destination?.images.count ?? 0
        pageControl.currentPage = 0
    }
    
      
    @objc func autoSwipeImage(){
        if counter < destination?.images.count ?? 0 {
          let index = IndexPath.init(item: counter, section: 0)
          collectionView.scrollToItem(at: index, at: .right, animated: true)
          pageControl.currentPage = counter
          counter = counter + 1
        }else{
          counter = 0
          let index = IndexPath.init(item: counter, section: 0)
          collectionView.scrollToItem(at: index, at: .right, animated: true)
          pageControl.currentPage = counter
          counter = 1
        }
    }
    
    
}



extension DetailTourController:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
   
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return destination?.images.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:CarouselSliderCell = collectionView.dequeueReusableCell(for: indexPath)
        cell.ImageSlider.image = UIImage(named: (destination?.images[indexPath.item])!)
        return cell
        
     }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width, height: collectionView.frame.height)
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let x = targetContentOffset.pointee.x
        pageControl.currentPage = Int(x/view.frame.width)
    }
}
