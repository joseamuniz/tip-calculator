//
//  ViewController.swift
//  TipCalculator
//
//  Created by Jose Muniz on 7/25/17.
//  Copyright © 2017 Jose Muniz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipPercent: UISegmentedControl!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        tipPercent.setTitle(TipSettingsModel.toPercentString(double: TipSettingsModel.global.maxTip), forSegmentAt: 2)
        tipPercent.setTitle(TipSettingsModel.toPercentString(double: TipSettingsModel.global.medTip),
            forSegmentAt: 1)
        tipPercent.setTitle(TipSettingsModel.toPercentString(double: TipSettingsModel.global.minTip), forSegmentAt: 0)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }

    @IBAction func billAdded(_ sender: Any) {
        let bill = Double(billField.text!) ?? 0
        let tip = TipSettingsModel.parseFromPercentString(percentString:
            tipPercent.titleForSegment(at: tipPercent.selectedSegmentIndex)!)
        
        tipLabel.text = String(format: "$%.2f", (bill * tip))
        totalLabel.text = String(format: "$%.2f", (bill * (1 + tip)))
    }

}
