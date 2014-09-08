//
//  ViewController.swift
//  Tipper
//
//  Created by Syed Salman Qadri on 9/2/14.
//  Copyright (c) 2014 Yahoo Inc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var lblTip: UILabel!
    @IBOutlet weak var lblTotal: UILabel!
    @IBOutlet weak var segmented: UISegmentedControl!
    @IBOutlet weak var input: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func tap(sender: UITapGestureRecognizer) {
        view.endEditing(true);
    }

    override func viewWillAppear(animated: Bool) {
        super.viewDidAppear(animated)
        println("view will appear")
        // Do any additional setup after loading the view, typically from a nib.
        var defaults = NSUserDefaults.standardUserDefaults()
        var intValue = defaults.integerForKey("tip_default")
        segmented.selectedSegmentIndex = intValue;
    }

    func updateValues() {
        let selected = segmented.titleForSegmentAtIndex(segmented.selectedSegmentIndex)!
        var percent = selected.substringToIndex(selected.endIndex.predecessor()).toInt()!
        var amount = (input.text as NSString).doubleValue;
        var tip = Double(Int64(Double(amount) * Double(percent)))/Double(100.0);

        lblTip.text = String(format: "$%.2f", tip);
        lblTotal.text = String(format: "$%.2f", amount + tip);
    }

    @IBAction func tipChanged(sender: UISegmentedControl) {
        updateValues();
    }

    @IBAction func typed(sender: UITextField) {
        updateValues();
    }
}

