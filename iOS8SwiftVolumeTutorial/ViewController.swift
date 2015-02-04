//
//  ViewController.swift
//  iOS8SwiftVolumeTutorial
//
//  Created by Charles Hsu on 2/1/15.
//  Copyright (c) 2015 Loxoll. All rights reserved.
//

import UIKit
import AVFoundation
import MediaPlayer

class ViewController: UIViewController {

  var audioPlayer = AVAudioPlayer()
  
  @IBOutlet weak var volumeView: MPVolumeView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    let path = NSBundle.mainBundle().pathForResource("Amorphis - My Enemy", ofType: "mp3")
    var music = NSURL(fileURLWithPath: path!)
    
    let instance = AVAudioSession.sharedInstance()
    
    instance.setCategory(AVAudioSessionCategoryPlayback, error: nil)
    instance.setActive(true, error: nil)
    
    var error: NSError?
    audioPlayer = AVAudioPlayer(contentsOfURL: music, error: &error)
    audioPlayer.prepareToPlay()
    
    println("audioPlayer.volume = \(audioPlayer.volume)")
    
    let iPod = MPMusicPlayerController()
    
    volumeView.showsVolumeSlider = true
    volumeView.showsRouteButton = false
    
    let thumbImageNormal = UIImage(named: "SliderThumb-Normal")
    volumeView.setVolumeThumbImage(thumbImageNormal, forState: .Normal)
    
    let thumbImageHighlighted = UIImage(named: "SliderThumb-Highlighted")
    volumeView.setVolumeThumbImage(thumbImageHighlighted, forState: .Highlighted)
    
    let insets = UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
    
    let trackLeftImage = UIImage(named: "SliderTrackLeft")!
    let trackLeftResizable = trackLeftImage.resizableImageWithCapInsets(insets)
    volumeView.setMinimumVolumeSliderImage(trackLeftResizable, forState: .Normal)
    
    let trackRightImage = UIImage(named: "SliderTrackRight")!
    let trackRightResizable = trackRightImage.resizableImageWithCapInsets(insets)
    volumeView.setMaximumVolumeSliderImage(trackRightResizable, forState: .Normal)
    
    volumeView.setRouteButtonImage(thumbImageNormal, forState: .Normal)
    volumeView.setRouteButtonImage(thumbImageHighlighted, forState: .Highlighted)
    
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  @IBAction func playSound(sender: AnyObject) {
    
    NSLog("playSound")
    
    audioPlayer.play()
        
  }
  
  /*
  
  https://developer.apple.com/library/ios/documentation/MediaPlayer/Reference/MPVolumeView_Class/#//apple_ref/occ/instm/MPVolumeView/
  
  Customizing the Volume Slider
  
  maximumVolumeSliderImageForState(_:)
  minimumVolumeSliderImageForState(_:)
  setMaximumVolumeSliderImage(_:forState:)
  setMinimumVolumeSliderImage(_:forState:)
  setVolumeThumbImage(_:forState:)
  volumeSliderRectForBounds(_:)
  volumeThumbImageForState(_:)
  volumeThumbRectForBounds(_:volumeSliderRect:value:)
  
  Customizing the Route Button
  
  routeButtonImageForState(_:)
  routeButtonRectForBounds(_:)
  setRouteButtonImage(_:forState:)
  
  */

}

