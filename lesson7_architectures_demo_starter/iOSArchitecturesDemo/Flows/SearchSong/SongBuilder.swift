//
//  SongBuilder.swift
//  iOSArchitecturesDemo
//
//  Created by LACKY on 31.01.2022.
//  Copyright © 2022 ekireev. All rights reserved.
//

import Foundation
import UIKit

final class SongBuilder {
    
    static func build() -> (UIViewController & SongSearchViewInput) {
        let presenter = SearchSongViewController()
        let viewController = SearchSongViewController(presenter: presenter)
        presenter.viewInput = viewController
        return viewController
    }
}
