//
//  ViewController.swift
//  Friend Phrase
//
//  Created by Thomas White on 2015-06-08.
//  Copyright (c) 2015 Thomas White. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var recordingInProgress: UILabel!
    @IBOutlet weak var stopButton: UIButton!
    @IBOutlet weak var microphone: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        //Hide stop button
        stopButton.hidden = true
        //Enable record at start
        microphone.enabled = true
    }


    @IBAction func stopRecording(sender: UIButton) {
        //TODO: stop recording
        recordingInProgress.hidden = true
    }
    
    @IBAction func recordAudio(sender: UIButton) {
        stopButton.hidden = false
        recordingInProgress.hidden = false
        microphone.enabled = false
        //TODO: record user's voice
        println("in recordAudio")
    }
}

