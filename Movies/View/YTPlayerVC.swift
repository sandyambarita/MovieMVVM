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
    
    internal var viedeoId: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        playerView.delegate = self
        playerView.load(withVideoId: "https://www.youtube.com/watch?v=\(viedeoId)" ?? "")
    }
    
    func playerViewDidBecomeReady(_ playerView: YTPlayerView) {
        playerView.playVideo()
    }
}
