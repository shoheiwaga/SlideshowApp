//
//  ImageZoomViewController.swift
//  SlideshowApp
//
//  Created by PC-SYSKAI555 on 2025/04/02.
//

import UIKit

class ImageZoomViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    var image: UIImage?
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        imageView.image = image
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
