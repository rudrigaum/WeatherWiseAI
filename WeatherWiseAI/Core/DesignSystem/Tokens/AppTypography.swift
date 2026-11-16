//
//  AppTypography.swift
//  WeatherWiseAI
//
//  Created by Rodrigo Cerqueira Reis on 15/11/26.
//

import Foundation
import SwiftUI

enum AppTypography {
    static let heroTitle: Font = .system(
        .largeTitle,
        design: .rounded,
        weight: .bold
    )

    static let screenTitle: Font = .system(
        .title,
        design: .rounded,
        weight: .bold
    )

    static let sectionTitle: Font = .system(
        .title2,
        design: .rounded,
        weight: .semibold
    )

    static let cardTitle: Font = .system(
        .headline,
        weight: .semibold
    )

    static let body: Font = .system(
        .body
    )

    static let supporting: Font = .system(
        .subheadline
    )

    static let caption: Font = .system(
        .caption
    )

    static let buttonLabel: Font = .system(
        .headline,
        weight: .semibold
    )
}
