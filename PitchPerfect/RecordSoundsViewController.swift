//
//  RecordSoundsViewController.swift
//  PitchPerfect
//
//  Created by oren aksakal on 13/7/16.
//  Copyright © 2016 Oren Aksakal. All rights reserved.
//

import UIKit
import AVFoundation


class RecordSoundsViewController: UIViewController {

    
    @IBOutlet weak var recordingLabel: UILabel!
    @IBOutlet weak var recordButton: UIButton!
    @IBOutlet weak var stopRecordButton: UIButton!
    
    var audioRecorder:AVAudioRecorder!
    


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
        
        let dirPath = NSSearchPathForDirectoriesInDomains(.DocumentDirectory,.UserDomainMask, true)[0] as String
        let recordingName = "recordedVoice.wav"
        let pathArray = [dirPath, recordingName]
        let filePath = NSURL.fileURLWithPathComponents(pathArray)
        print(filePath)
        
        let session = AVAudioSession.sharedInstance()
        try! session.setCategory(AVAudioSessionCategoryPlayAndRecord)
        
        try! audioRecorder = AVAudioRecorder(URL: filePath!, settings: [:])
        audioRecorder.meteringEnabled = true
        audioRecorder.prepareToRecord()
        audioRecorder.record()
      
    }
    @IBAction func stopRecording(sender: AnyObject) {
        print("Recording Stopped")
        recordingLabel.text = "Tap to Record"
        stopRecordButton.enabled = false
        recordButton.enabled = true
        
        let audioSession = AVAudioSession.sharedInstance()
        try! audioSession.setActive(false)
    }
    
    override func viewWillAppear(animated: Bool) {
        stopRecordButton.enabled = false
                
    }}


