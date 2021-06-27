//
//  OfficialGenresVC.swift
//  Movies
//
//  Created by Sandy Ambarita on 26/06/21.
//

import UIKit
import RxSwift

class OfficialGenresVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var officialGenresVM = OfficialGenresVM()
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerTableView()
        
        officialGenresVM.listGenres.bind(to: tableView.rx.items) { (tableView, row, model) in
            print(model)
            let indexPath = IndexPath(row: row, section: 0)
            let cell = tableView.dequeueReusableCell(withIdentifier: "OfficialGenreCell", for: indexPath) as! OfficialGenreCell
            cell.configureCell(data: model)
            return cell
        }.disposed(by: disposeBag)
        officialGenresVM.fetchListGenres()
    }
    
    private func registerTableView() {
        let nib = UINib(nibName: "OfficialGenreCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "OfficialGenreCell")
    }

}

