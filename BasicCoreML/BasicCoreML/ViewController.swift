//
//  ViewController.swift
//  BasicCoreML
//
//  Created by ALIA M NEELY on 9/29/17.
//  Copyright © 2017 Wylan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let model = GoogLeNetPlaces()
    
    @IBOutlet weak var categoryLabel: UILabel!
    @IBAction func imageTapped(_ sender: UITapGestureRecognizer) {
        let imageView = sender.view as? UIImageView
        
        if let imageToAnalyze = imageView?.image {
            if let sceneString = sceneLabel(forImage: imageToAnalyze) {
                categoryLabel.text = sceneString
            }
        }
        
        
    }
    
    func sceneLabel (forImage image : UIImage) -> String? {
        
        if let pixelBuffer = ImageProcessor.pixelBuffer(forIMage: image.cgImage!) {
            
            
            guard let scene = try? model.prediction(sceneImage: pixelBuffer) else {
                fatalError("Unexpected Error")}
            return scene.sceneLabel
            }
        return nil
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

