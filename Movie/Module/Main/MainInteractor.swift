// 
//  MainInteractor.swift
//  Movie

import Foundation
import RxSwift
import Alamofire

class MainInteractor {
    
    var api = ApiManager()
    var bag = DisposeBag()
    
    func fetchData(page: Int) -> PublishSubject<[Results]> {
        let dataSubject = PublishSubject<[Results]>()
        _ = api.requestAPI(endpoint: .movieList(page))
            .subscribe { (data: MainEntity) in
                dataSubject.onNext(data.results)
            } onError: { error in
                dataSubject.onError(error)
            }.disposed(by: bag)
        return dataSubject
    }
}
