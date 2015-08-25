//
//  ViewController.swift
//  Tiply
//
//  Created by Matt Rucker on 8/24/15.
//  Copyright (c) 2015 tumblr. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    let tipPercentages = [0.18, 0.2, 0.22]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        billField.text = ""
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        var defaults = NSUserDefaults.standardUserDefaults()
        tipControl.selectedSegmentIndex = defaults.integerForKey("default_user_percentage")
        updateFields()
    }

    @IBAction func onEditingChanged(sender: AnyObject) {
        updateFields()
    }

    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
    
    func updateFields() {
        var tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        
        var billAmount = (billField.text as NSString).doubleValue
        var tip = billAmount * tipPercentage
        var total = billAmount + tip
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }
}

