//
//  CassiniViewController.swift
//  Cassini
//
//  Created by Owner on 7/9/19.
//  Copyright © 2019 Owner. All rights reserved.
//

import UIKit

class CassiniViewController: UIViewController {

    var images = ["cassini":"https://planetary.s3.amazonaws.com/assets/images/spacecraft/2017/20170927_cassini-enters-atmosphere.jpg",
                  "earth":"https://eoimages.gsfc.nasa.gov/images/imagerecords/144000/144898/BlackMarble_2016_01deg.jpg",
                  "saturn":"https://i.pinimg.com/originals/59/23/29/5923294822d12d29263920c386eb4e93.jpg"]
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier {
            if let urlString = images[identifier] {
                if let imageVC = segue.destination as? ImageViewController {
                    imageVC.imageURL = URL(string:  urlString)
                    imageVC.title = (sender as? UIButton)?.currentTitle
                }
            }
        }
    }

}
