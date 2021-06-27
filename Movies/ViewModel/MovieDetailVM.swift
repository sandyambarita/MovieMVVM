//
//  DetailMovieVM.swift
//  Movies
//
//  Created by Sandy Ambarita on 26/06/21.
//

import Foundation
import RxSwift
import RxCocoa

class DetailMovieVM {
    
    private var disposeBag = DisposeBag()
    
    var movieDetail = BehaviorRelay<MovieDetail>(value: MovieDetail())
    
    func fetchMovieDetail(queryParams: QueryParameters) {
        API.fetchMovieDetail(queryParams: queryParams).subscribe(onNext: { (response) in
            if response.results != nil {
                self.listDiscover.accept(response.results!)
            }
            
            print("responsenya = \(response)")
        }, onError: { (error) in
            print("error: \(error)")
        }).disposed(by: disposeBag)
    }
    
}
