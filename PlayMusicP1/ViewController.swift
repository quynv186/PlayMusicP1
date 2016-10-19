//
//  ViewController.swift
//  PlayMusicP1
//
//  Created by admin on 10/19/16.
//  Copyright © 2016 admin. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var btn_Play: UIButton!
    @IBOutlet weak var sld_Volume: UISlider!
    
    var audio = AVAudioPlayer()
    var isPlay = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        audio = try! AVAudioPlayer(contentsOf: NSURL(fileURLWithPath: Bundle.main.path(forResource: "music", ofType: "mp3")!) as URL)
        
        audio.prepareToPlay()
        
    }
    
    func setThumb() {
        sld_Volume.setThumbImage(UIImage(named: "thumb.png"), for: .normal)
        sld_Volume.setThumbImage(UIImage(named: "thumbHightLight.png"), for: .highlighted)
    }

    @IBAction func action_Play(_ sender: UIButton) {
        if isPlay == false {
            audio.play()
            isPlay = true
            btn_Play.setImage(UIImage(named: "play.png"), for: .normal)
        } else {
            audio.pause()
            isPlay = false
            btn_Play.setImage(UIImage(named: "pause.png"), for: .normal)
        }
    }
    
    @IBAction func sld_Volume(_ sender: UISlider) {
        audio.volume = sld_Volume.value
        setThumb()
    }
    

}

