//
//  AppColors.swift
//  WeatherWiseAI
//
//  Created by Rodrigo Cerqueira Reis on 15/11/26.
//

import Foundation
import SwiftUI
import UIKit

enum AppColors {
    static let brandPrimary = Color(
        red: 0.0 / 255.0,
        green: 124.0 / 255.0,
        blue: 122.0 / 255.0
    )

    static let brandSecondary = Color(
        red: 21.0 / 255.0,
        green: 108.0 / 255.0,
        blue: 178.0 / 255.0
    )

    static let textPrimary = Color(
        uiColor: UIColor { traits in
            if traits.userInterfaceStyle == .dark {
                return UIColor.label.resolvedColor(with: traits)
            }

            return UIColor(
                red: 14.0 / 255.0,
                green: 27.0 / 255.0,
                blue: 61.0 / 255.0,
                alpha: 1
            )
        }
    )

    static let screenBackground = Color(
        uiColor: UIColor { traits in
            if traits.userInterfaceStyle == .dark {
                return UIColor.secondarySystemBackground.resolvedColor(
                    with: traits
                )
            }

            return UIColor(
                red: 241.0 / 255.0,
                green: 247.0 / 255.0,
                blue: 251.0 / 255.0,
                alpha: 1
            )
        }
    )

    static let onBrandPrimary = Color.white
}

private struct AppColorsPreview: View {
    var body: some View {
        VStack(
            alignment: .leading,
            spacing: AppSpacing.medium
        ) {
            Text("WeatherWise AI")
                .font(AppTypography.screenTitle)
                .foregroundStyle(AppColors.textPrimary)

            VStack(
                alignment: .leading,
                spacing: AppSpacing.xSmall
            ) {
                Text("Weather Forecast")
                    .font(AppTypography.cardTitle)
                    .foregroundStyle(AppColors.textPrimary)

                Text("Conditions for your next activity")
                    .font(AppTypography.supporting)
                    .foregroundStyle(.secondary)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(AppSpacing.medium)
            .background(
                .background,
                in: AppShapes.card
            )

            Text("White on primary")
                .font(AppTypography.buttonLabel)
                .foregroundStyle(AppColors.onBrandPrimary)
                .frame(maxWidth: .infinity)
                .padding(AppSpacing.medium)
                .background(
                    AppColors.brandPrimary,
                    in: AppShapes.control
                )
        }
        .padding(AppSpacing.large)
        .frame(
            maxWidth: .infinity,
            maxHeight: .infinity,
            alignment: .topLeading
        )
        .background(AppColors.screenBackground)
    }
}

#Preview("Light Mode") {
    AppColorsPreview()
        .preferredColorScheme(.light)
}

#Preview("Dark Mode") {
    AppColorsPreview()
        .preferredColorScheme(.dark)
}
