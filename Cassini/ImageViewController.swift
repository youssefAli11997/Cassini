//
//  ImageViewController.swift
//  Cassini
//
//  Created by Owner on 7/9/19.
//  Copyright © 2019 Owner. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController, UIScrollViewDelegate {

    var imageURL: URL? {
        didSet {
            imageView.image = nil
            if view.window != nil {
                fetchImage()
            }
        }
    }
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var scrollView: UIScrollView! {
        didSet {
            scrollView.minimumZoomScale = 1/25
            scrollView.maximumZoomScale = 1.0
            scrollView.delegate = self
        }
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if imageView.image == nil {
            fetchImage()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if imageURL == nil {
            imageURL = Bundle.main.url(forResource: "myImage3", withExtension: "jpg")
        }
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }
 
    func fetchImage() {
        if let url = imageURL {
            let urlContents = try? Data(contentsOf: url)
            if let imageData = urlContents {
                imageView.image = UIImage(data: imageData)
                //to load the image directly from the assets
                //imageView.image = UIImage(named: "myImage3")!
            }
        }
    }
}
