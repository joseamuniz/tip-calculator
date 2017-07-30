//
//  SettingsViewController.swift
//  TipCalculator
//
//  Created by Jose Muniz on 7/26/17.
//  Copyright © 2017 Jose Muniz. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var medTip: UITextField!
    @IBOutlet weak var maxTip: UITextField!
    @IBOutlet weak var minTip: UITextField!
    
    private static let settingsModel = TipSettingsModel.global
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        resetAllTextAreas()
        
    }
    
    @IBAction func resetAllTextAreas() {
        minTip.text = TipSettingsModel.toPercentString(double: TipSettingsModel.global.minTip)
        medTip.text = TipSettingsModel.toPercentString(double: TipSettingsModel.global.medTip)
        maxTip.text = TipSettingsModel.toPercentString(double: TipSettingsModel.global.maxTip)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func tipEdited(_ sender: Any) {
        let minTipDouble = TipSettingsModel.parseFromPercentString(percentString: minTip.text!)
        let medTipDouble = TipSettingsModel.parseFromPercentString(percentString: medTip.text!)
        let maxTipDouble = TipSettingsModel.parseFromPercentString(percentString: maxTip.text!)
        TipSettingsModel.global.setTips(minTip: minTipDouble, medTip: medTipDouble, maxTip: maxTipDouble)
    }



}
