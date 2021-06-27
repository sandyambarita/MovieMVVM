//
//  OfficialGenresVC.swift
//  Movies
//
//  Created by Sandy Ambarita on 26/06/21.
//

import UIKit

class OfficialGenresVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var officialGenresVM = OfficialGenresVM()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerTableView()
        fetchGenre()
        tableView.tableFooterView = UIView()
    }
    
    private func fetchGenre() {
        officialGenresVM.fetchListGenres(completion: { (_) in
            DispatchQueue.main.async { [weak self] in
                self!.tableView.reloadData()
            }
        })
    }
    
    private func registerTableView() {
        let nib = UINib(nibName: "OfficialGenreCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "OfficialGenreCell")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "goToDicover") {
            if let genreData = sender as? GenreData {
                if let nextVC = segue.destination as? DiscoverMovieVC {
                    nextVC.genreData = genreData
                }
            }
        }
    }

}

extension OfficialGenresVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (officialGenresVM.numberOfRowsInSection())
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "OfficialGenreCell") as! OfficialGenreCell
        cell.configureCell(data: officialGenresVM.genreAtIndex(index: indexPath.row))
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "goToDicover", sender: officialGenresVM.genreAtIndex(index: indexPath.row))
    }
    
}

