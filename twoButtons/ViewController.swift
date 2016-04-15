//
//  ViewController.swift
//  twoButtons
//
//  Created by Kurt on 11.04.16.
//  Copyright © 2016 Kurt. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
// Outlets
    @IBOutlet weak var RedPill: UIImageView!
    @IBOutlet weak var BluePill: UIImageView!
    @IBOutlet weak var RedButton: UIButton!
    @IBOutlet weak var BlueButton: UIButton!
    @IBOutlet weak var RestartButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // Actions
    
    @IBAction func restartButtonPressed(sender: AnyObject)
    {
        restoreScreen()
    }
    @IBAction func TakeBlue(sender: AnyObject) {
        BluePill.hidden = true
        BlueButton.hidden = true
        RestartButton.hidden = false
        checkScreenStatus()
    }

    @IBAction func TakeRed(sender: AnyObject) {
        RedPill.hidden = true
        RedButton.hidden = true
        RestartButton.hidden = false
        checkScreenStatus()
    }
    // Check to see if both pills are hidden
    func checkScreenStatus()
    {
        if(RedPill.hidden == true) && (BluePill.hidden == true)
        {
    //GCD Grand Central Dispatch
    let numberOfSeconds : Double = 2
    
    let time = dispatch_time(DISPATCH_TIME_NOW, Int64(numberOfSeconds * Double(NSEC_PER_SEC)))
    
    dispatch_after(time, dispatch_get_main_queue())
    {
    self.restoreScreen()
    }
    }
    }
// Restore Screen to Default look
    func restoreScreen()
{
        BluePill.hidden = false
        RedPill.hidden = false
        RedButton.hidden = false
        BlueButton.hidden = false
        RestartButton.hidden = true
}
}
