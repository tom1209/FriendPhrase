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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if var filepath = NSBundle.mainBundle().pathForResource("movie_quote", ofType:"mp3")
        {
            var filePathURL = NSURL.fileURLWithPath(filepath)
            audioPlayer = AVAudioPlayer(contentsOfURL: filePathURL, error: nil)
            audioPlayer.enableRate = true
        }
        else
        {
            println("The File Path is Empty")
        }
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
