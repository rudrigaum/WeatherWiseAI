//
//  AppShapes.swift
//  WeatherWiseAI
//
//  Created by Rodrigo Cerqueira Reis on 15/11/26.
//

import Foundation
import SwiftUI

enum AppShapes {
    static let control = RoundedRectangle(
        cornerRadius: 12,
        style: .continuous
    )

    static let card = RoundedRectangle(
        cornerRadius: 16,
        style: .continuous
    )

    static let hero = RoundedRectangle(
        cornerRadius: 24,
        style: .continuous
    )
}
