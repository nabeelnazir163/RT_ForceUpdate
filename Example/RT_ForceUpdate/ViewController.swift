//
//  ViewController.swift
//  RT_ForceUpdate
//
//  Created by Nabeel on 12/24/2021.
//  Copyright (c) 2021 Nabeel. All rights reserved.
//

import UIKit
import RT_ForceUpdate

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        ForceUpdateManager.shared.checkIfAppVersionIsCompatible(with: "com.eternityTest")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

