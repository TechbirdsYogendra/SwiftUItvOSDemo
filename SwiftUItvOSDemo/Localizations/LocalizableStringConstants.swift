//
//  LocalizableStringConstants.swift
//  SwiftUItvOSDemo
//
//  Created by Yogendra Singh on 25/09/23.
//

import Foundation

struct LocalizableStringConstants {
    static let moviesLoading = "moviesLoading"
    static let movieDetailsLoading = "movieDetailsLoading"
}

func localisedString(key: String) -> String {
    return NSLocalizedString(key, comment: "")
}
