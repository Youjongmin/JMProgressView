//
//  ViewController.swift
//  ProgressViewEx
//
//  Created by 유종민 on 2016. 9. 29..
//  Copyright © 2016년 유종민. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

 

    @IBAction func StartAction(_ sender: AnyObject) {
        
        JMprogressView.sharedInstance.showLoadingbar(self.view)
        
        self.perform(#selector(ViewController.StopAction), with: self, afterDelay: 5.0)
    }
    
    func StopAction(){
        JMprogressView.sharedInstance.stopanimation(self.view)
    }
}

