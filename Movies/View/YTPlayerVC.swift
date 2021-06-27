//
//  YTPlayerVC.swift
//  Movies
//
//  Created by Sandy Ambarita on 27/06/21.
//

import Foundation
import UIKit
import youtube_ios_player_helper

class YTPlayerVC: UIViewController , YTPlayerViewDelegate{
    @IBOutlet var playerView: YTPlayerView!
    
    internal var movieVideoData: MovieVideoData?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        playerView.delegate = self
        let playerVars = ["playsinline": 0]
        playerView.load(withVideoId: movieVideoData?.key ?? "", playerVars: playerVars)
    }
    
    func playerViewDidBecomeReady(_ playerView: YTPlayerView) {
        playerView.playVideo()
    }
}
