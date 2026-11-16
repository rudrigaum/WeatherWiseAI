//
//  AppPrimaryButtonStyle.swift
//  WeatherWiseAI
//
//  Created by Rodrigo Cerqueira Reis on 16/11/26.
//

import Foundation
import SwiftUI

struct AppPrimaryButtonStyle: ButtonStyle {
    @Environment(\.isEnabled) private var isEnabled

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(AppTypography.buttonLabel)
            .foregroundStyle(AppColors.onBrandPrimary)
            .frame(maxWidth: .infinity)
            .padding(.horizontal, AppSpacing.medium)
            .padding(.vertical, AppSpacing.small)
            .frame(minHeight: 48)
            .background(
                AppColors.brandPrimary,
                in: AppShapes.control
            )
            .opacity(isEnabled ? 1 : 0.5)
            .opacity(configuration.isPressed ? 0.85 : 1)
    }
}

#Preview("Primary Button States") {
    VStack(spacing: AppSpacing.medium) {
        Button("Plan an activity") {}
            .buttonStyle(AppPrimaryButtonStyle())

        Button("Plan an activity") {}
            .buttonStyle(AppPrimaryButtonStyle())
            .disabled(true)
    }
    .padding(AppSpacing.large)
    .background(AppColors.screenBackground)
}
