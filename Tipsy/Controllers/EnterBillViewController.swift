//
//  EnterBillViewController.swift
//  Tipsy
//
//  Created by Артем Вологдин on 24.11.23.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import UIKit

class EnterBillViewController: UIViewController {

    @IBOutlet weak var billTextField: UITextField!
    var tippQuantity: Int = 0
    
    @IBOutlet weak var tippButtonOutlet: UIButton!
    
//    @IBAction func tippButton(_ sender: UIButton) {
//        let perCent = sender.currentTitle
//        sender.isSelected = false
//        if perCent == "0%"{
//            tippQuantity = 0
//            sender.isSelected = true
//        }else if perCent == "10%"{
//               sender.isSelected = true
//            tippQuantity = 10
//        }else if perCent == "20%"{
//            tippQuantity = 20
//            sender.isSelected = true
//        }
//    }
    
    @IBAction func zeroTipButton(_ sender: UIButton) {
       tippQuantity = 0
        zeroTipOutlet.isSelected = true
        tenTipOutlet.isSelected = false
        twentyTipOutlet.isSelected = false
    }
    @IBOutlet weak var zeroTipOutlet: UIButton!
    @IBAction func tenTipButton(_ sender: UIButton) {
        tippQuantity = 10
        zeroTipOutlet.isSelected = false
        tenTipOutlet.isSelected = true
        twentyTipOutlet.isSelected = false
    }
    @IBOutlet weak var tenTipOutlet: UIButton!
    
    @IBAction func twentyTipButton(_ sender: UIButton) {
        tippQuantity = 20
        zeroTipOutlet.isSelected = false
        tenTipOutlet.isSelected = false
        twentyTipOutlet.isSelected = true
    }
    @IBOutlet weak var twentyTipOutlet: UIButton!
    
    
    
    @IBOutlet weak var stepper: UIStepper!
    
    @IBOutlet weak var quantityPepleLable: UILabel!
    
    @IBAction func makeMorePeople(_ sender: UIStepper) {
        quantityPepleLable.text = "\(Int(stepper.value))"
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: (Any)?) {
    
        if segue.identifier == "goToResultVC"{
            let destination = segue.destination as! ResultViewController
            let quantityPeopleDouble = Double(quantityPepleLable.text!)!
            let quantityBillDouble = Double(billTextField.text!)!
            let resultWithoutTipp = quantityBillDouble/quantityPeopleDouble
            let resultTipp = resultWithoutTipp*Double(tippQuantity)/100.0
            let bigResult = resultWithoutTipp+resultTipp
            destination.myResult = String(format: "%.1f", bigResult)
            destination.myInfo = "Split between \(quantityPepleLable.text!) people, with \(tippQuantity)% tip."
        }
    }

    @IBAction func calculateButton(_ sender: UIButton) {
        performSegue(withIdentifier: "goToResultVC", sender: nil)
                
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tenTipOutlet.isSelected = true
    }

 

}
