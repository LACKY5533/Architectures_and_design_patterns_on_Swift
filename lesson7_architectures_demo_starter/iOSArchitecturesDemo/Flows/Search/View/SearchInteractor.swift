//
//  SearchInteractor.swift
//  iOSArchitecturesDemo
//
//  Created by LACKY on 03.02.2022.
//  Copyright © 2022 ekireev. All rights reserved.
//

import Foundation
import Alamofire

protocol SearchInteractorr {

    func requestApps(with query: String, completion: @escaping (Result<[ITunesApp]>) -> Void)
}

final class SearchInteractor: SearchInteractorr {

    private let searchService = ITunesSearchService()

    func requestApps(with query: String, completion: @escaping (Result<[ITunesApp]>) -> Void) {
        self.searchService.getApps(forQuery: query, then: completion)
    }
}
