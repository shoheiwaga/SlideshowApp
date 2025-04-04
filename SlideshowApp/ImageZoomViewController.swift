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
    
    @objc func omake(gesture: UIPinchGestureRecognizer) {
        if let pinch = gesture.view{
            pinch.transform = CGAffineTransform(scaleX: gesture.scale, y: gesture.scale)
                pinch.transform = pinch.transform.scaledBy(x: gesture.scale, y: gesture.scale)
                gesture.scale = 1.0 // 次のジェスチャーのためにスケールをリセット
            }
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
