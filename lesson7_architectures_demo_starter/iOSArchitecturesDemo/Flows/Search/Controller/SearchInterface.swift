//
//  SearchInterface.swift
//  iOSArchitecturesDemo
//
//  Created by LACKY on 31.01.2022.
//  Copyright © 2022 ekireev. All rights reserved.
//

import Foundation

protocol SearchViewInput: class {
    
    var searchResults: [ITunesApp] { get set }
    
    func EError(error: Error)
    func showNoResults()
    func NoResults()
    func throbber(show: Bool)
    
}

protocol SearchViewOutput {
    
    func viewDidSearch(with query: String)
    
    func viewDidSelectApp(_ app: ITunesApp)
    
}
