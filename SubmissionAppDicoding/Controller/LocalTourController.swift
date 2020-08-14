//
//  LocalTourController.swift
//  SubmissionAppDicoding
//
//  Created by Dewa Prabawa on 17/06/20.
//  Copyright © 2020 Dewa Prabawa. All rights reserved.
//

import Foundation
import UIKit

class LocalTourController:UITableViewController, PushNavigationController{
   
    var local = DestinationDataSource().destinationLine[0]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupviews()
    }
    
    func setupviews(){
        self.title = "Local"
        tableView.registerReusableCell(TourCellTableViewCell.self)
        tableView.registerReusableCell(HeaderCell.self)
        tableView.separatorStyle = .none
        tableView.rowHeight = 160
        tableView.estimatedRowHeight = UITableView.automaticDimension
        
        navigationController?.navigationBar.prefersLargeTitles = true
        let largeTitleAttributes = [NSAttributedString.Key.foregroundColor:UIColor.systemGray3]
        navigationController?.navigationBar.largeTitleTextAttributes = largeTitleAttributes
    }
    
    func pushNavigationToDetail(_ model: Destination) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "DetailTourController") as? DetailTourController {
            vc.configure(model: model)
            navigationController?.present(vc, animated: true, completion: nil)
        }
       }
       
}


extension LocalTourController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return local.destinations.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:TourCellTableViewCell = tableView.dequeueReusableCell(for: indexPath)
        cell.configure(model: local.destinations[indexPath.row])
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        pushNavigationToDetail(local.destinations[indexPath.row])
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header:HeaderCell = tableView.dequeueReusableCellHeader()
        header.configure(model: local)
        return header
    }
}
