//
//  AppCard.swift
//  WeatherWiseAI
//
//  Created by Rodrigo Cerqueira Reis on 16/11/26.
//

import Foundation
import SwiftUI

struct AppCard<Content: View>: View {
    private let content: Content

    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }

    var body: some View {
        content
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(AppSpacing.medium)
            .background(
                .background,
                in: AppShapes.card
            )
    }
}

#Preview("App Card") {
    VStack(spacing: AppSpacing.medium) {
        AppCard {
            VStack(
                alignment: .leading,
                spacing: AppSpacing.xSmall
            ) {
                Text("Weather Forecast")
                    .font(AppTypography.cardTitle)
                    .foregroundStyle(AppColors.textPrimary)

                Text("Weather information will appear here.")
                    .font(AppTypography.supporting)
                    .foregroundStyle(.secondary)
            }
        }

        AppCard {
            Text("Plan your next activity")
                .font(AppTypography.cardTitle)
                .foregroundStyle(AppColors.textPrimary)
        }
    }
    .padding(AppSpacing.medium)
    .background(AppColors.screenBackground)
}
