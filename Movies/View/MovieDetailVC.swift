//
//  MovieDetailVC.swift
//  Movies
//
//  Created by Sandy Ambarita on 26/06/21.
//

import Foundation
import UIKit
import youtube_ios_player_helper
import AVKit

class MovieDetailVC: UIViewController {
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblOverview: UILabel!
    @IBOutlet weak var lblUserScore: UILabel!
    @IBOutlet weak var lblStatus: UILabel!
    @IBOutlet weak var lblRelease: UILabel!
    @IBOutlet weak var imgBackdropPath: UIImageView!
    @IBOutlet weak var imgPosterPath: UIImageView!
    @IBOutlet weak var lblAuthor: UILabel!
    @IBOutlet weak var lblContent: UILabel!
    @IBOutlet weak var imgAuthor: UIImageView!
    @IBOutlet weak var btnReadMore: UIButton!
    @IBOutlet weak var btnReadAllReview: UIButton!
    @IBOutlet weak var btnPlayVideo: UIButton!
    @IBOutlet weak var viewReview: UIView!
    @IBOutlet weak var lblTitleReview: UILabel!
    @IBOutlet weak var videoCollectionView: UICollectionView!
    
    var movieDetailVM = MovieDetailVM()
    
    internal var discoverData: DiscoverData?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCollectionView()
        setupNavigationTitle()
        fetchMovieDetail()
        fetchMovieReview()
        fetchMovieVideo()
        setupShadow()
    }
    
    private func registerCollectionView() {
        let nib = UINib(nibName: "VideoMovieCell", bundle: nil)
        videoCollectionView.register(nib, forCellWithReuseIdentifier: "VideoMovieCell")
        videoCollectionView.contentInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
    }
    
    private func setupNavigationTitle() {
        navigationItem.title = "Detail \(discoverData?.title ?? "")"
    }
    
    private func setupShadow() {
        viewReview.dropShadow(shadowColor: UIColor.lightGray, fillColor: UIColor.white, opacity: 0.5, offset: CGSize(width: 2, height: 2), radius: 4)
    }
    
    private func fetchMovieDetail() {
        movieDetailVM.fetchMovieDetail(id: discoverData?.id ?? 0) { data in
            self.lblTitle.text = data?.originalTitle
            self.lblOverview.text = data?.overview
            self.imgBackdropPath.loadFromUrl(path: data?.backdropPath ?? "", contentMode: .scaleAspectFill)
            self.imgPosterPath.loadFromUrl(path: data?.posterPath ?? "", contentMode: .scaleAspectFill)
            self.lblUserScore.text = "\(data?.voteAverage ?? 0)%"
            self.lblStatus.text = data?.status
            self.lblRelease.text = data?.releaseDate?.formatDate()
        }
    }
    
    private func fetchMovieReview() {
        let queryParams: QueryParameters = [
            "page": "1"
        ]
        movieDetailVM.fetchMovieReview(id: discoverData?.id ?? 0, queryParams: queryParams) { data in
            if data?.isEmpty ??  false {
                self.viewReview.isHidden = true
            } else {
                self.viewReview.isHidden = false
                self.lblAuthor.text = "A Review by \(data?.first?.authorDetails?.username ?? "")"
                self.lblContent.text = data?.first?.content
                self.imgAuthor.loadFromUrl(path: data?.first?.authorDetails?.avatarPath ?? "", contentMode: .scaleAspectFill)
            }
        }
        
    }
    
    private func fetchMovieVideo() {
        movieDetailVM.fetchMovieVideo(id: discoverData?.id ?? 0) { _ in
            DispatchQueue.main.async { [weak self] in
                self!.videoCollectionView.reloadData()
            }
        }
    }
    
    @IBAction func btnReadMoreOnClicked(_ sender: Any) {
        self.performSegue(withIdentifier: "goToReviewDetail", sender: self.movieDetailVM.movieReview.first?.url ?? "")
    }
    
    @IBAction func btnReadAllReviewOnClicked(_ sender: Any) {
        self.performSegue(withIdentifier: "goToListReview", sender: discoverData?.id ?? 0)
    }
    
    @IBAction func btnPlayVideoOnClicked(_ sender: Any) {
        self.performSegue(withIdentifier: "goToMovieVideo", sender: self.movieDetailVM.movieVideo.first)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "goToReviewDetail") {
            if let url = sender as? String {
                if let nextVC = segue.destination as? ReviewDetailVC {
                    nextVC.linkUrl = url
                }
            }
        } else if (segue.identifier == "goToListReview") {
            if let id = sender as? Int {
                if let nextVC = segue.destination as? ListReviewVC {
                    nextVC.id = id
                }
            }
        } else if (segue.identifier == "goToMovieVideo") {
            if let movieVideoData = sender as? MovieVideoData {
                if let nextVC = segue.destination as? YTPlayerVC {
                    nextVC.movieVideoData = movieVideoData
                }
            }
        }
    }

}

extension MovieDetailVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        movieDetailVM.numberOfRowsInSectionVideo()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "VideoMovieCell", for: indexPath) as! VideoMovieCell
        cell.configureCell(data: movieDetailVM.genreAtIndexVideo(index: indexPath.row))
        cell.backgroundImg.loadFromUrl(path: self.movieDetailVM.movieDetail?.backdropPath ?? "", contentMode: .scaleAspectFill)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 150, height: 200)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "goToMovieVideo", sender: self.movieDetailVM.movieVideo[indexPath.row])
    }
}
