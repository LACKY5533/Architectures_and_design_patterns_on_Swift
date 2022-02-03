//
//  Search.swift
//  iOSArchitecturesDemo
//
//  Created by LACKY on 31.01.2022.
//  Copyright © 2022 ekireev. All rights reserved.
//

import Foundation
import UIKit

class Search {
    weak var viewInput: (UIViewController & SearchViewInput)?
    let interactor: SearchInteractorInput
    let router: SearchRouterInput
    private let searchService = ITunesSearchService()

    init(interactor: SearchInteractorInput, router: SearchRouterInput) {
        self.interactor = interactor
        self.router = router
    }

    private func openAppDetails(with app: ITunesApp) {
        let appDetailViewController = AppDetailViewController(app: app)
        viewInput?.navigationController?.pushViewController(appDetailViewController, animated: true)
    }
}

extension Search: SearchViewOutput {
    func viewDidSearch(with query: String) {
        viewInput?.throbber(show: true)
        interactor.requestApps(with: query) { [weak self] in
            guard let self = self else { return }
            self.viewInput?.throbber(show: false)
            result
                .withValue { apps in
                    guard !apps.isEmpty else {
                        self.viewInput?.showNoResults()
                        return
                    }
                    self.viewInput?.hideNoResults()
                    self.viewInput?.searchResults = apps
                }
                .withError { (error) in
                    self.viewInput?.showError(error: error)
                }
        }
    }

    func viewDidSelectApp(app: ITunesApp) {
        openAppDetails(with: app)
    }
}
