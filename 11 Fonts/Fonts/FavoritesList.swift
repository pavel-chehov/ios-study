//
//  FavoritesList.swift
//  Fonts
//
//  Created by Pavel Chehov on 4/17/18.
//  Copyright © 2018 Pavel Chehov. All rights reserved.
//

import Foundation

class FavoritesList {
    static let sharedFavoritesList = FavoritesList()
    private static let key = "favorites"
    
    private(set) var favorites: [String]
    
    private init() {
        let defaults = UserDefaults.standard
        let storedFavorites = defaults.object(forKey: FavoritesList.key) as? [String]
        favorites = storedFavorites ?? []
    }
    
    func addFavorite(fontName: String) {
        if !favorites.contains(fontName) {
            favorites.append(fontName)
            saveFavorites()
        }
    }
    
    func removeFavorite(fontName: String) {
        if let index = favorites.index(of: fontName) {
            favorites.remove(at: index)
            saveFavorites()
        }
    }
    
    func moveItem(from:Int, to: Int) {
        let item = favorites[from]
        favorites.remove(at: from)
        favorites.insert(item, at: to)
        saveFavorites()
    }
    
    private func saveFavorites() {
        let defaults = UserDefaults.standard
        defaults.set(favorites, forKey: FavoritesList.key)
        defaults.synchronize()
    }
}
