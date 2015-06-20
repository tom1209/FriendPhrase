//
//  PlaySoundsViewController.swift
//  Friend Phrase
//
//  Created by Thomas White on 2015-06-11.
//  Copyright (c) 2015 Thomas White. All rights reserved.
//

import UIKit
import AVFoundation

class PlaySoundsViewController: UIViewController {
    
    var audioPlayer:AVAudioPlayer!
    var receivedAudio: RecordedAudio!
    var audioEngine: AVAudioEngine!
    var audioFile: AVAudioFile!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        /*if var filepath = NSBundle.mainBundle().pathForResource("movie_quote", ofType:"mp3")
        {
            var filePathURL = NSURL.fileURLWithPath(filepath)
        }
        else
        {
            println("The File Path is Empty")
        }*/
        
        audioPlayer = AVAudioPlayer(contentsOfURL: receivedAudio.filePathURL, error: nil)
        audioPlayer.enableRate = true
        
        audioEngine = AVAudioEngine()
        audioFile = AVAudioFile(forReading: receivedAudio.filePathURL, error: nil)
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //Play slow audio here
    @IBAction func playSlowAudio(sender: UIButton)
    {
        playAudio(0.5)
    }

    
    //Play Fast audio here
    @IBAction func playFastAudio(sender: UIButton)
    {
        playAudio(2.0)
    }
    
    
    //Stop playing Audio
    @IBAction func stopAudio(sender: UIButton)
    {
        audioPlayer.stop()
    }
    
    
    //For playing audio
    func playAudio(rate:Float)
    {
        audioPlayer.rate = rate
        audioPlayer.currentTime = 0
        audioPlayer.play()
    }


    //For Chipmunk sounds
    @IBAction func playChipmunkAudio(sender: UIButton)
    {
        playAudioWithVariablePitch(1000)
    }
    
    
    //For Vadar Sounds
    @IBAction func playVadarAudio(sender: UIButton)
    {
        playAudioWithVariablePitch(-1000)
    }
    
    
    //For audio pitch change
    func playAudioWithVariablePitch(pitch:Float)
    {
        audioPlayer.stop()
        audioEngine.stop()
        audioEngine.reset()
        
        var audioPlayerNode = AVAudioPlayerNode()
        audioEngine.attachNode(audioPlayerNode)
        
        var changePitchEffect = AVAudioUnitTimePitch()
        changePitchEffect.pitch = pitch
        audioEngine.attachNode(changePitchEffect)
        
        audioEngine.connect(audioPlayerNode, to: changePitchEffect, format: nil)
        audioEngine.connect(changePitchEffect, to: audioEngine.outputNode, format: nil)
        
        audioPlayerNode.scheduleFile(audioFile, atTime: nil, completionHandler: nil)
        audioEngine.startAndReturnError(nil)
        
        audioPlayerNode.play()
    }
    
    


}
