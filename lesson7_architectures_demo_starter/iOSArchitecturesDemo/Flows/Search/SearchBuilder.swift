//
//  SearchBuilder.swift
//  iOSArchitecturesDemo
//
//  Created by LACKY on 31.01.2022.
//  Copyright © 2022 ekireev. All rights reserved.
//

import Foundation
import UIKit

final class SearchBuilder {

    static func build() -> (UIViewController & SearchViewInput) {
        let interactor = SearchInteractor()
        let router = SearchRouter()
        let presenter = SearchPresenter(interactor: interactor, router: router)
        let viewController = SearchViewController(presenter: presenter)
        router.viewController = viewController
        presenter.viewInput = viewController

        return viewController
    }
}
