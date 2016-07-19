//
//  ViewController.swift
//  PitchPerfect
//
//  Created by oren aksakal on 13/7/16.
//  Copyright © 2016 Oren Aksakal. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var recordingLabel: UILabel!
    @IBOutlet weak var recordButton: UIButton!
    @IBOutlet weak var stopRecordButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func recordAudio(sender: AnyObject) {
        print("Button Pressed")
        recordingLabel.text = "Recording.."
        stopRecordButton.enabled = true
        recordButton.enabled = false
      
    }
    @IBAction func stopRecording(sender: AnyObject) {
        print("Recording Stopped")
        recordingLabel.text = "Tap to Record"
        stopRecordButton.enabled = false
        recordButton.enabled = true
    }
    
    override func viewWillAppear(animated: Bool) {
        stopRecordButton.enabled = false
                
    }}


