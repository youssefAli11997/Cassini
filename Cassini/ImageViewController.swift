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
            //imageView.image = nil
            if view.window != nil {
                fetchImage()
            }
        }
    }
    
    @IBOutlet weak var spinner: UIActivityIndicatorView!
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
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }
 
    func fetchImage() {
        spinner.startAnimating()
        if let url = imageURL {
            DispatchQueue.global(qos: .userInitiated).async { [weak self] in
                let urlContents = try? Data(contentsOf: url)
                DispatchQueue.main.async {
                    if let imageData = urlContents, url == self?.imageURL {
                        self?.imageView.image = UIImage(data: imageData)
                        self?.spinner.stopAnimating()
                        //to load the image directly from the assets
                        //imageView.image = UIImage(named: "myImage3")!
                    }
                }
            }
        }
    }
}
