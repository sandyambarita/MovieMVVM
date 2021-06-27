//
//  DiscoverMovieVC.swift
//  Movies
//
//  Created by Sandy Ambarita on 26/06/21.
//

import Foundation
import UIKit

class DiscoverMovieVC: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var discoverMovieVM = DiscoverMovieVM()
    var spinner = UIActivityIndicatorView(style: .medium)
    var page = 1
    var totalPages: Int?
    
    internal var genreData: GenreData?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationTitle()
        registerTableView()
        fetchListDiscover()
        spinner.frame = CGRect(x: CGFloat(0), y: CGFloat(0), width: self.tableView.bounds.width, height: CGFloat(44))
        tableView.tableFooterView = spinner
    }
    
    private func setupNavigationTitle() {
        navigationItem.title = "Dicover \(genreData?.name ?? "")"
    }
    
    private func fetchListDiscover() {
        let queryParams: QueryParameters = [
            "with_genres": "\(genreData?.id ?? 0)",
            "page": "\(page)"
        ]
        discoverMovieVM.fetchDiscover(queryParams: queryParams!, completion: { (data) in
            DispatchQueue.main.async { [weak self] in
                self?.totalPages = (data?.totalPages)!
                self?.tableView.reloadData()
            }
        })
    }
    
    func moreFetchListDiscover() {
        let queryParams: QueryParameters = [
            "with_genres": "\(genreData?.id ?? 0)",
            "page": "\(page)"
        ]
        self.spinner.startAnimating()
        if Double((page)) < Double(totalPages!) {
            discoverMovieVM.fetchDiscover(queryParams: queryParams!, completion: { (data) in
                DispatchQueue.main.async { [weak self] in
                    self?.tableView.reloadData()
                    self?.spinner.stopAnimating()
                }
            })
        } else {
            self.spinner.stopAnimating()
            self.tableView.tableFooterView = UIView()
        }
    }
    
    private func registerTableView() {
        let nib = UINib(nibName: "DiscoverMovieCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "DiscoverMovieCell")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "goToMovieDetail") {
            if let discoverData = sender as? DiscoverData {
                if let nextVC = segue.destination as? MovieDetailVC {
                    nextVC.discoverData = discoverData
                }
            }
        }
    }

}

extension DiscoverMovieVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        discoverMovieVM.numberOfRowsInSection()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DiscoverMovieCell", for: indexPath) as! DiscoverMovieCell
        cell.configureCell(data: discoverMovieVM.discoverAtIndex(index: indexPath.row))
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "goToMovieDetail", sender: discoverMovieVM.discoverAtIndex(index: indexPath.row))
    }
    
}

extension DiscoverMovieVC: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height

        if !spinner.isAnimating && offsetY > contentHeight - scrollView.frame.size.height {
            page += 1
            moreFetchListDiscover()
        }
    }
}

