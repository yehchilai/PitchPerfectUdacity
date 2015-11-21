//
//  PlaySoundViewController.swift
//  PitchPerfectUdacity
//
//  Created by Yeh-chi Lai on 11/13/15.
//  Copyright © 2015 iamhomebody. All rights reserved.
//

import UIKit
import AVFoundation

class PlaySoundViewController: UIViewController {
    
    var audioPlayer:AVAudioPlayer!
    var receivedAudio:RecordedAudio!
    var audioEngine: AVAudioEngine!
    var audioFile: AVAudioFile!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        if let filePath = NSBundle.mainBundle().pathForResource("movie_quote", ofType: "mp3"){
//            let filePathUrl = NSURL.fileURLWithPath(filePath)
//            audioPlayer = try?AVAudioPlayer(contentsOfURL: filePathUrl)
//            audioPlayer.enableRate = true
//        }else
//        {
//            print("The path is empty.")
//        }
        
        audioPlayer = try?AVAudioPlayer(contentsOfURL: receivedAudio.filePathUrl)
        audioPlayer.enableRate = true
        audioEngine = AVAudioEngine()
        audioFile = try! AVAudioFile(forReading: receivedAudio.filePathUrl)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func playSlowSound(sender: UIButton) {
        playSound(0.5)
    }

    @IBAction func playFastSound(sender: UIButton) {
        playSound(1.5)
    }
    
    @IBAction func stopSound(sender: UIButton) {
        audioPlayer.stop()
        audioEngine.stop()
        audioEngine.reset()
    }
    
    @IBAction func playChipmunkSound(sender: UIButton) {
        playSoundWithPitch(1000)
    }
    
    @IBAction func playDarthVaderSound(sender: UIButton) {
        playSoundWithPitch(-1000)
    }
    
    func playSoundWithPitch(pitch: float_t){
        audioPlayer.stop()
        audioEngine.stop()
        audioEngine.reset()
        
        let audioPlayerNode = AVAudioPlayerNode()
        audioEngine.attachNode(audioPlayerNode)
        
        let changePitchEffect = AVAudioUnitTimePitch()
        changePitchEffect.pitch = pitch
        audioEngine.attachNode(changePitchEffect)
        
        audioEngine.connect(audioPlayerNode, to: changePitchEffect, format: nil)
        audioEngine.connect(changePitchEffect, to: audioEngine.outputNode, format: nil)
        
        audioPlayerNode.scheduleFile(audioFile, atTime: nil, completionHandler: nil)
        try!audioEngine.start()
        audioPlayerNode.play()
    }
    func playSound(rate : float_t)
    {
        audioPlayer.stop()
        audioEngine.stop()
        audioEngine.reset()
        audioPlayer.rate = rate
        audioPlayer.currentTime = 0.0
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
