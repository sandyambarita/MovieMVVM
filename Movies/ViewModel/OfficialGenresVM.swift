//
//  OfficialGendresVM.swift
//  Movies
//
//  Created by Sandy Ambarita on 26/06/21.
//

import Foundation
import RxSwift
import RxCocoa

class OfficialGendresVM {
    
    private var disposeBag = DisposeBag()
    
    let listGendres: BehaviorRelay<Gendres> = BehaviorRelay(value: Gendres(gendres: <#[GendreData]?#>))
    
    func fetchListGendres() {
        API.fetchListGendres().subscribe(onNext: { (response) in
            if response.gendres != nil {
                self.listGendres.accept(response.gendres!)
            }
            
            print(response)
        }, onError: { (error) in
            print("error: \(error)")
        }).disposed(by: disposeBag)
    }
    
}
