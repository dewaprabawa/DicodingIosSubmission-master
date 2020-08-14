//
//  AllTourController.swift
//  SubmissionAppDicoding
//
//  Created by Dewa Prabawa on 12/06/20.
//  Copyright © 2020 Dewa Prabawa. All rights reserved.
//

import Foundation
import UIKit

class AllTourController:UITableViewController, PushNavigationController {
    
    //MARK: Properties
    var tour = DestinationDataSource()
    
    override func viewDidLoad() {
            super.viewDidLoad()
            setupUITableView()
            setupNavigationStyle()
    }
}



extension AllTourController {

    func setupUITableView(){
            tableView.registerReusableCell(TourCellTableViewCell.self)
            tableView.registerReusableCell(PopularCell.self)
            tableView.register(HeaderCell.nib(), forCellReuseIdentifier: HeaderCell.identifier)
            tableView.separatorStyle = .none
            tableView.rowHeight = 160
            tableView.estimatedRowHeight = UITableView.automaticDimension
    
    }
    
    func setupNavigationStyle(){
        self.title = "Discover"
            navigationController?.navigationBar.prefersLargeTitles = true
            let largeTitleAttributes = [NSAttributedString.Key.foregroundColor:UIColor.systemGray3]
            navigationController?.navigationBar.largeTitleTextAttributes = largeTitleAttributes
            navigationController?.navigationBar.barTintColor = .white
            self.navigationItem.rightBarButtonItem?.tintColor = .systemGray3
    }
    
    
    func pushNavigationToDetail(_ model:Destination){
        if let vc = storyboard?.instantiateViewController(withIdentifier: "DetailTourController") as? DetailTourController {
            vc.configure(model: model)
            navigationController?.present(vc, animated: true, completion: nil)
        }
    }
    
    
   @objc func pushNavigationToAbout(){
      let vc = AboutViewController()
      navigationController?.pushViewController(vc, animated: true)
    
    }

}






extension AllTourController{
    
     //MARK: Cell
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        tour.numberOfSection()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tour.numberOfRowInSection(at: section)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell:TourCellTableViewCell = tableView.dequeueReusableCell(for: indexPath)
            cell.configure(model: tour.cellForRow(at: indexPath))
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let destination = tour.cellForRow(at: indexPath)
        pushNavigationToDetail(destination)
    }
    

    //MARK: Header
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        
        switch section {
        case 0:
            let header:PopularCell = tableView.dequeueReusableCellHeader()
            header.allTourController = self
            return header
        default:
            let header:HeaderCell = tableView.dequeueReusableCellHeader()
            header.configure(model: tour.destinationLine[1])
            return header
        }
    
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return section == 0 ? 230 : 30
    }
    
}


