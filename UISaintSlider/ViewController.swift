//
//  ViewController.swift
//  UISaintSlider
//
//  Created by Lampros Giampouras on 05/01/2019.
//  Copyright © 2019 Lampros Giampouras. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var slider: UISaintSlider!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let thumbImage = self.slider.createThumbImage()
        
        self.slider.setThumbImage(thumbImage, for: .normal)
        self.slider.setThumbImage(thumbImage, for: .highlighted)
        self.slider.setThumbImage(thumbImage, for: .selected)
    }


}

