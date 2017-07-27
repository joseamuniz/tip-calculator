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
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let defaults = UserDefaults.standard
        minTip.text = defaults.string(forKey: "minTip") ?? "0.15"
        medTip.text = defaults.string(forKey: "medTip") ?? "0.20"
        maxTip.text = defaults.string(forKey: "maxTip") ?? "0.25"
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func tipEdited(_ sender: Any) {
        let defaults = UserDefaults.standard
        defaults.set(minTip.text, forKey: "minTip")
        defaults.set(medTip.text, forKey: "medTip")
        defaults.set(maxTip.text, forKey: "maxTip")
    }



}
