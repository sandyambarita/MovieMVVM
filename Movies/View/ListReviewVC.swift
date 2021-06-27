//
//  ListReviewVC.swift
//  Movies
//
//  Created by Sandy Ambarita on 27/06/21.
//

import Foundation
import UIKit

class ListReviewVC: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var spinner = UIActivityIndicatorView(style: .medium)
    internal var id: Int?
    
    var page = 1
    var totalPages: Int?
    var listReviewVM = ListReviewVM()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerTableView()
        fetchMovieReview()
        spinner.frame = CGRect(x: CGFloat(0), y: CGFloat(0), width: self.tableView.bounds.width, height: CGFloat(44))
        tableView.tableFooterView = spinner
    }
    
    private func registerTableView() {
        let nib = UINib(nibName: "ListReviewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "ListReviewCell")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "goToReviewDetailFromList") {
            if let url = sender as? String {
                if let nextVC = segue.destination as? ReviewDetailVC {
                    nextVC.linkUrl = url
                }
            }
        }
    }
    
    func fetchMovieReview() {
        let queryParams: QueryParameters = [
            "page": "\(page)"
        ]
        listReviewVM.fetchMovieReview(id: id ?? 0, queryParams: queryParams!) { data in
            DispatchQueue.main.async { [weak self] in
                self?.totalPages = data?.totalPages
                self?.tableView.reloadData()
            }
        }
    }
    
    func moreFetchMovieReview() {
        let queryParams: QueryParameters = [
            "page": "\(page)"
        ]
        self.spinner.startAnimating()
        if Double((page)) < Double(totalPages!) {
            listReviewVM.fetchMovieReview(id: id ?? 0, queryParams: queryParams!) { data in
                DispatchQueue.main.async { [weak self] in
                    self?.tableView.reloadData()
                    self?.spinner.stopAnimating()
                }
            }
        } else {
            self.spinner.stopAnimating()
            self.tableView.tableFooterView = UIView()
        }
    }

}

extension ListReviewVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        listReviewVM.numberOfRowsInSection()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListReviewCell", for: indexPath) as! ListReviewCell
        cell.configureCell(data: listReviewVM.discoverAtIndex(index: indexPath.row))
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "goToReviewDetailFromList", sender: listReviewVM.listReview[indexPath.row].url)
    }
}

extension ListReviewVC: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height

        if !spinner.isAnimating && offsetY > contentHeight - scrollView.frame.size.height {
            page += 1
            self.moreFetchMovieReview()
        }
    }
}
