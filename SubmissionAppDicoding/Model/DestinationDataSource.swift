//
//  DestinationDataSource.swift
//  SubmissionAppDicoding
//
//  Created by Dewa Prabawa on 12/06/20.
//  Copyright © 2020 Dewa Prabawa. All rights reserved.
//

import Foundation
import UIKit


class DestinationDataSource {
    
    private var _destinationLine:[DestinationLine] = []
    
    private var _recomandedLine:[Destination] = []
    
    init() {
        self.destinationLine = [indonesiaDestinationLine(),overseeDestinationLine()]
        self.recomandedLine = getRecomandedLine()
    }
    
    var destinationLine:[DestinationLine]{
          set{
           return _destinationLine = newValue
          }
          get{
              return _destinationLine
          }
      }
      
      var recomandedLine:[Destination]{
          set{
              return _recomandedLine = newValue
          }
          
          get{
              return _recomandedLine
          }
      }
      
    
    
     func getRecomandedLine() -> [Destination] {
        var list = [Destination]()
        for d in destinationLine {
            for t in d.destinations {
                if t.rates >= 3.5 {
                    list.append(t)
                }
            }
        }
      return list
    }
    
    
    func indonesiaDestinationLine() -> DestinationLine{
        
        var _indonesia = [Destination]()
        
        _indonesia.append(Destination(name: "Nusa Dua", rates: 3.5, description: "Nusa Dua means ‘Two Islands’ in Indonesian which is something of a misnomer as if you come here you will find two non-descript headlands, each topped with a temple. Nusa Dua is widely known as the ‘upscale’ district of Bali and many of the high end resorts are located here. There is actually a dedicated tourist area in Nusa Dua which is gated and studded with guard posts and once inside you will find beautiful manicured lawns and not a leaf out of place. In short, it is a world away from much of the rest of Bali.", price: 234.00, location:"Jimbaran, bali", images: ["nusadua0","nusadua5","nusadua1","nusadua2","nusadua3","nusadua4","nusadua6"]))
        
        _indonesia.append(Destination(name: "Ubud", rates: 4.5, description: "The town of Ubud, in the uplands of Bali, Indonesia, is known as a center for traditional crafts and dance. The surrounding Ubud District’s rainforest and terraced rice paddies, dotted with Hindu temples and shrines, are among Bali’s most famous landscapes. Ancient holy sites include the intricately carved Goa Gajah (“Elephant Cave”) and Gunung Kawi, with its rock-cut shrines.", price: 200.0, location: "Gianyar, bali", images: ["ubud0","ubud1","ubud2","ubud3","ubud4","ubud5","ubud6"]))
        
        _indonesia.append(Destination(name: "Yogjakarta", rates: 4.0, description: "Yogyakarta (often called “Jogja”) is a city on the Indonesian island of Java known for its traditional arts and cultural heritage. Its ornate 18th-century royal complex, or kraton, encompasses the still-inhabited Sultan’s Palace. Also within the kraton are numerous open-air pavilions that host classical Javanese dance shows and concerts of gamelan music, characterized by gongs, chimes and plucked string instruments.", price: 210.00, location: "Middle Java", images: ["yog0","yog1","yog2","yog3","yog4","yog5","yog6"]))
        
        _indonesia.append(Destination(name: "Laboan Baju", rates: 4.5, description: "Labuan Bajo is a fishing town located at the western end of the large island of Flores in the Nusa Tenggara region of east Indonesia. It is the capital of the West Manggarai Regency, one of the eight regencies which are the major administrative divisions of Flores.", price: 200.00, location: "West Manggarai", images: ["laboan0","laboan1","laboan2","laboan3","laboan4","laboan5","laboan6"]))
        
        _indonesia.append(Destination(name: "Raja Ampat", rates: 5.0, description: "The Raja Ampat Islands are an Indonesian archipelago off the northwest tip of Bird’s Head Peninsula in West Papua. Comprising hundreds of jungle-covered islands, Raja Ampat is known for its beaches and coral reefs rich with marine life. Ancient rock paintings and caves are on Misool Island, while the crimson bird of paradise lives on Waigeo Island. Batanta and Salawati are the archipelago’s other main islands.", price: 300.00, location: "Papua", images: ["papua0","papua1","papua2","papua3","papua4","papua5","papua6"]))
        
        _indonesia.append(Destination(name: "Ijen", rates: 3.5, description: "The Ijen volcano complex is a group of composite volcanoes located on the border between Banyuwangi Regency and Bondowoso Regency of East Java, Indonesia. It is inside a larger caldera Ijen, which is about 20 kilometres wide. The Gunung Merapi stratovolcano is the highest point of that complex.", price: 200.00, location: "Banyuangi", images: ["ijen0","ijen1","ijen2","ijen3","ijen4","ijen5"]))
        
        _indonesia.append(Destination(name: "Toraja", rates: 4.5, description: "Tana Toraja Regency is a regency of South Sulawesi Province of Indonesia, and home to the Toraja ethnic group. The local government seat is in Makale, while the center of Toraja culture is in Rantepao.", price: 300.00, location: "South Sulawesi", images: ["toraja0","toraja1","toraja2","toraja3","toraja4"]))
            
        _indonesia.append(Destination(name: "Bandung", rates: 4.5, description: "Bandung, capital of Indonesia’s West Java province, is a large city set amid volcanoes and tea plantations. It's known for colonial and art deco architecture, a lively, university-town feel and – thanks to its 768m elevation – relatively cool tropical weather. Bandung is also a shopping destination, with fashion outlets clustered along Jalan Setiabudi and Jalan Riau in the Dago district.", price: 4.5, location: "West Java", images: ["bandung0","bandung1","bandung2","bandung3","bandung4","bandung5","badung6"]))
        
        return DestinationLine(name: "Indonesia", destinations: _indonesia)
        
    }
    
    
     func overseeDestinationLine() -> DestinationLine {
        
       var _oversee = [Destination]()
        
        _oversee.append(Destination(name: "Hawaii", rates: 4.0, description: "Hawaii is a state of the United States of America located in the Pacific Ocean. It is the only U.S. state located outside North America and the only island state. The state encompasses nearly the entire Hawaiian archipelago, 137 islands spread over 1,500 miles.", price: 300.00, location: "America", images: ["hawai0","hawai1","hawai2","hawai3","hawai4","hawai5","hawai6"]))
        
        _oversee.append(Destination(name: "Italy", rates: 4.0, description: "Italy, a European country with a long Mediterranean coastline, has left a powerful mark on Western culture and cuisine. Its capital, Rome, is home to the Vatican as well as landmark art and ancient ruins. Other major cities include Florence, with Renaissance masterpieces such as Michelangelo’s David and Brunelleschi's Duomo; Venice, the city of canals; and Milan, Italy’s fashion capital.", price: 231, location: "Italia", images: ["italy0","italy1","italy2","italy3","italy4","italy5","italy6"]))
        
        _oversee.append(Destination(name: "switzerland", rates: 4.0, description: "Switzerland is a mountainous Central European country, home to numerous lakes, villages and the high peaks of the Alps. Its cities contain medieval quarters, with landmarks like capital Bern’s Zytglogge clock tower and Lucerne’s wooden chapel bridge. The country is also known for its ski resorts and hiking trails. Banking and finance are key industries, and Swiss watches and chocolate are world renowned.", price: 230.00, location: "Europe", images: ["swiss0","swiss1","swiss2","swiss3","swiss4","swiss5","swiss6"]))
        
        _oversee.append(Destination(name: "Thailand", rates: 3.0, description: "Thailand is a Southeast Asian country. It's known for tropical beaches, opulent royal palaces, ancient ruins and ornate temples displaying figures of Buddha. In Bangkok, the capital, an ultramodern cityscape rises next to quiet canalside communities and the iconic temples of Wat Arun, Wat Pho and the Emerald Buddha Temple (Wat Phra Kaew). ", price: 200.00, location: "East South Asia", images: ["thai0","tai1","tai2","tai3","tai4","tai5"]))
        
        _oversee.append(Destination(name: "Singapore" , rates: 4.0, description: "sovereign island city-state in maritime Southeast Asia. It lies about one degree of latitude (137 kilometres or 85 miles) north of the equator, off the southern tip of the Malay Peninsula, bordering the Straits of Malacca to the west, the Riau Islands to the south, and the South China Sea to the east", price: 200.00, location: "East South Asia", images: ["s0","s1","s2","s3","s4","s5","s6"]))
        
        _oversee.append(Destination(name: "Philippines", rates: 4.0, description: "The Philippines, officially the Republic of the Philippines, is an archipelagic country in Southeast Asia. Situated in the western Pacific Ocean, it consists of about 7,641 islands that are broadly categorized under three main geographical divisions from north to south: Luzon, Visayas and Mindanao.", price: 240.00, location: "East South Asia", images: ["philippine0","philippine1","philippine2","philippine3","philippine4"]))
        
        _oversee.append(Destination(name: "Malaysia", rates: 4.0, description: "Malaysia is a Southeast Asian country occupying parts of the Malay Peninsula and the island of Borneo. It's known for its beaches, rainforests and mix of Malay, Chinese, Indian and European cultural influences. ", price: 200.00, location:"East South Asia", images: ["m0","m1","m2","m3","m4","m5"]))
        
        return DestinationLine(name: "International", destinations: _oversee)
    }
    
}



extension DestinationDataSource {
    
    func numberOfSection() -> Int {
        return _destinationLine.count
    }
      
    func numberOfRowInSection(at section:Int) -> Int {
        return _destinationLine[section].destinations.count
    }

    
    func cellForRow(at indexPath:IndexPath) -> Destination {
        return _destinationLine[indexPath.section].destinations[indexPath.row]
    }

    func cellHeaderRow(at indexPath:IndexPath) -> String {
        return _destinationLine[indexPath.section].name
    }
    
}

