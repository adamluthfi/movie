// 
//  MainPresenter.swift
//  Movie

import Foundation
import RxSwift
import RxCocoa

class MainPresenter {
    
    private let interactor: MainInteractor
    private let router = MainRouter()
    private let disposeBag = DisposeBag()
    
    init(interactor: MainInteractor) {
        self.interactor = interactor
    }
    
    func movieList(with page: Int) -> PublishSubject<[Results]> {
        return interactor.fetchData(page: page)
    }
    
}
