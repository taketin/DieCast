//
//  ViewController.swift
//  Demo
//
//  Created by Takeshita Hidenori on 2016/01/30.
//  Copyright © 2016年 taketin. All rights reserved.
//

import UIKit
import DieCast

class ViewController: UIViewController {
    @IBOutlet var diecastView1: UIView!
    @IBOutlet var diecastView2: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()

        if let diecast = DieCast(material: 1234567890) {
            diecast.height = 60
            let diecastView = diecast.press()
            diecastView1.addSubview(diecastView)
        }

        if let diecast = DieCast(material: 123456) {
            diecast.magnification = 0.3
            let diecastView = diecast.press()
            diecastView2.addSubview(diecastView)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

