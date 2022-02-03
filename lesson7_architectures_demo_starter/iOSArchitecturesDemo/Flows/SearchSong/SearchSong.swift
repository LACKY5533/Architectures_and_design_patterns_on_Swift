//
//  SearchSong.swift
//  iOSArchitecturesDemo
//
//  Created by LACKY on 31.01.2022.
//  Copyright © 2022 ekireev. All rights reserved.
//

import Foundation
import UIKit

final class SearchSong {
    
    private let searchService = ITunesSearchService()
    
    weak var viewInput: (UIViewController & SongViewInput)?
    
    let interactor: SearchSongInteractorInput
    let router: SearchSongRouterInput
    
    private func requestSong(with query: String) {
        self.searchService.getSongs(forQuery: query) { [weak self] result in
            guard let self = self else { return }
            self.viewInput?.throbber(show: false)
            result
                .withValue { songs in
                    guard !songs.isEmpty else {
                        self.viewInput?.showNoResults()
                        return
                    }
                    self.viewInput?.hideNoResults()
                    self.viewInput?.searchResults = songs
                }
                .withError {
                    self.viewInput?.showError(error: $0)
                }
        }
    }
    
    private func openSongDetails(with song: ITunesSong) {
        let songDetaillViewController = SongDetailViewController(song: song)
        self.viewInput?.navigationController?.pushViewController(songDetaillViewController, animated: true)
    }
    
}

extension SearchSong: SongViewOutput {
    func viewDidSearch(with query: String) {
        viewInput?.throbber(show: true)
        interactor.requestSongs(with: query) { [weak self] in
            guard let self = self else { return }
            self.viewInput?.throbber(show: false)
            result
                .withValue { songs in
                    guard !songs.isEmpty else {
                        self.viewInput?.showNoResults()
                        return
                    }
                    self.viewInput?.hideNoResults()
                    self.viewInput?.searchResults = songs
                }
                .withError { (error) in
                    self.viewInput?.showError(error: error)
                }
        }
    }
    
    func viewDidSelectSong(song: ITunesSong) {
        openSongDetails(with: song)
    }
}
