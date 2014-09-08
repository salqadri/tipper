//
//  SettingsViewController.swift
//  Tipper
//
//  Created by Syed Salman Qadri on 9/4/14.
//  Copyright (c) 2014 Yahoo Inc. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var segmented: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

        var defaults = NSUserDefaults.standardUserDefaults()
        var intValue = defaults.integerForKey("tip_default")
        segmented.selectedSegmentIndex = intValue;
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func tipChanged(sender: UISegmentedControl) {
        var defaults = NSUserDefaults.standardUserDefaults()
        defaults.setInteger(sender.selectedSegmentIndex, forKey: "tip_default")
        defaults.synchronize()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
