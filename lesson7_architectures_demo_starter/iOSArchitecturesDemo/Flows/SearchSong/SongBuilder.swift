//
//  SongBuilder.swift
//  iOSArchitecturesDemo
//
//  Created by LACKY on 31.01.2022.
//  Copyright © 2022 ekireev. All rights reserved.
//

import Foundation
import UIKit

class SearchBuilder {
    static func build() -> (UIViewController & SongViewInput) {
        
        let interactor = SearchSongInteractor()
        let router = SearchSongRouter()
        let presenter = SearchSongPresenter(interactor: interactor, router: router)
        let viewController = SongViewController(presenter: presenter)
        router.viewController = viewController
        presenter.viewInput = viewController as! UIViewController & SongViewInput
        
        return viewController
    }
}
