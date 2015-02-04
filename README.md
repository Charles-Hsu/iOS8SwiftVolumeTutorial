# iOS8SwiftVolumeTutorial

Add a UIView in storyboard, change the class from UIView to MPVolumeView

```swift
  func setupVolumeView() {
    volumeView.backgroundColor = UIColor.clearColor()
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
```

# Reference

- iOS_Apprentice_1_Getting_Started_v3.0 p.123
- [iOS Developer Library MediaPlayer Framework Reference > MPVolumeView Class Reference](https://developer.apple.com/library/ios/documentation/MediaPlayer/Reference/MPVolumeView_Class/#//apple_ref/occ/instm/MPVolumeView/)
- [How to add the MPVolumeView via Xcode Designer?](http://stackoverflow.com/questions/6020844/how-to-add-the-mpvolumeview-via-xcode-designer)