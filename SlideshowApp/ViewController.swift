//
//  ViewController.swift
//  SlideshowApp
//
//  Created by PC-SYSKAI555 on 2025/04/02.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nextImage: UIButton!
    @IBOutlet weak var returnImage: UIButton!
    @IBOutlet weak var playstopImage: UIButton!
    
    var timer: Timer!
    var timer_sec: Float = 0 //timerの初期化
    var images: [UIImage] = [UIImage(named: "image1.jpg")!,UIImage(named: "image2.jpg")!,UIImage(named: "image3.jpg")!] //画像の配列
    var nowImage = 0 // 配列の位置
    var playStatus = true //再生ストップのフラグ
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        //imageView.contentMode = UIView.ContentMode.scaleAspectFit
        imageView.image = images[nowImage]
    }
    
    @objc func updateTimer(_ timer: Timer){
        self.timer_sec += 2
    }
    
    @IBAction func nextImageOn(_ sender: UIButton){
        nowImage = (nowImage + 1) % images.count //配列要素が配列数で割って0なら最初に戻る
        imageView.image = images[nowImage]
    }
    
    @IBAction func returnImageOn(_ sender: UIButton){
        nowImage = (nowImage - 1 + images.count) % images.count // -1にならないように余を配列要素にする
        imageView.image = images[nowImage]
    }
    
    @IBAction func playstopImageOn(_ sender: UIButton){
        if playStatus{
            startimage()
        }else{
            stopimage()
        }
    }
    
    func startimage(){
        
        timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(nextImageOn(_: )), userInfo: nil, repeats: true)
        playStatus = false
        nextImage.isEnabled = false //進むボタン無効
        returnImage.isEnabled = false //戻る無効
        playstopImage.setTitle("停止", for: .normal) //ボタンテキスト変更
        
    }
    
    func stopimage(){
        
        playStatus = true
        nextImage.isEnabled = true //進むボタン有効
        returnImage.isEnabled = true //戻る有効
        playstopImage.setTitle("再生", for: .normal) //ボタンテキスト変更
        timer?.invalidate() //timer止める
        
  
}

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
            let imageZoomViewController = segue.destination as! ImageZoomViewController
                imageZoomViewController.image = images[nowImage]
        
    }
    
    @IBAction func unwind(_ segue: UIStoryboardSegue){
        
    }
    
}

