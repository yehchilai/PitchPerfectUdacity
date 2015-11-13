//
//  ViewController.swift
//  PitchPerfectUdacity
//
//  Created by Yeh-chi Lai on 11/7/15.
//  Copyright © 2015 iamhomebody. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var recordingInProgress: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func recordAudio(sender: UIButton) {
        recordingInProgress.hidden = false
        //TODO: record the user's voice
        print("in recordAudio...")
        
    }

    @IBAction func stopRecording(sender: UIButton) {
        recordingInProgress.hidden = true
    }
}

