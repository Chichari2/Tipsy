//
//  ResultViewController.swift
//  Tipsy
//
//  Created by Артем Вологдин on 24.11.23.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var resultLable: UILabel!
    
    @IBOutlet weak var extraInfoToBillLabel: UILabel!
    
    var myResult = String()
    var myInfo = String()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        resultLable.text = myResult
        extraInfoToBillLabel.text = myInfo
    }
    

   

}
