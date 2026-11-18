//
//  HomeView.swift
//  WeatherWiseAI
//
//  Created by Rodrigo Cerqueira Reis on 17/11/26.
//

import Foundation
import SwiftUI

struct HomeView: View {
    struct HourlyForecast: Identifiable {
        let id: String
        let time: String
        let temperature: String
        let condition: String
        let symbol: String
    }

    struct Model {
        let greeting: String
        let city: String
        let temperature: String
        let condition: String
        let feelsLike: String
        let precipitation: String
        let hourlyForecast: [HourlyForecast]
        let suggestion: String
    }

    let model: Model
    let onSelectCity: () -> Void
    let onUseCurrentLocation: () -> Void
    let onPlanWithAI: () -> Void

    @Environment(\.dynamicTypeSize)
    private var dynamicTypeSize

    @Environment(\.colorScheme)
    private var colorScheme

    @ScaledMetric(relativeTo: .largeTitle)
    private var temperatureFontSize: CGFloat = 64

    var body: some View {
        ScrollView {
            VStack(
                alignment: .leading,
                spacing: AppSpacing.medium
            ) {
                brandingSection
                locationSection
                currentWeatherSection
                hourlyForecastSection
                suggestionSection
                planningButton
            }
            .padding(.horizontal, AppSpacing.medium)
            .padding(.vertical, AppSpacing.large)
        }
        .background(AppColors.screenBackground)
    }

    private var brandingSection: some View {
        VStack(
            alignment: .leading,
            spacing: AppSpacing.medium
        ) {
            HStack(spacing: AppSpacing.xSmall) {
                Image(systemName: "cloud")
                    .font(.title2)
                    .foregroundStyle(AppColors.brandPrimary)
                    .accessibilityHidden(true)

                Text("WeatherWise AI")
                    .font(AppTypography.cardTitle)
                    .foregroundStyle(AppColors.textPrimary)
            }

            Text(model.greeting)
                .font(AppTypography.screenTitle)
                .foregroundStyle(AppColors.textPrimary)
        }
    }

    private var locationSection: some View {
        ViewThatFits(in: .horizontal) {
            locationControls
        }
    }

    private var locationControls: some View {
        HStack(spacing: AppSpacing.xSmall) {
            Button(action: onSelectCity) {
                HStack(spacing: AppSpacing.xSmall) {
                    Image(systemName: "mappin.circle.fill")
                        .accessibilityHidden(true)

                    Text(model.city)

                    Image(systemName: "chevron.down")
                        .font(.caption)
                        .accessibilityHidden(true)
                }
                .font(AppTypography.supporting)
                .foregroundStyle(AppColors.textPrimary)
            }
            .buttonStyle(.plain)
            .accessibilityLabel(
                "Selecionar cidade: \(model.city)"
            )

            Spacer(minLength: AppSpacing.xxSmall)

            Button(action: onUseCurrentLocation) {
                Label(
                    "Minha localização",
                    systemImage: "location"
                )
                .font(AppTypography.caption)
                .foregroundStyle(AppColors.textPrimary)
                .padding(.horizontal, AppSpacing.small)
                .padding(.vertical, AppSpacing.xSmall)
                .background(
                    AppColors.brandPrimary.opacity(0.12),
                    in: Capsule()
                )
            }
            .buttonStyle(.plain)
        }
    }

    private var currentWeatherSection: some View {
        VStack(
            alignment: .leading,
            spacing: AppSpacing.medium
        ) {
            HStack(alignment: .top) {
                VStack(
                    alignment: .leading,
                    spacing: AppSpacing.xxSmall
                ) {
                    Text(model.temperature)
                        .font(
                            .system(
                                size: temperatureFontSize,
                                weight: .bold,
                                design: .rounded
                            )
                        )
                        .accessibilityLabel(
                            "Temperatura: \(model.temperature)"
                        )

                    Text(model.condition)
                        .font(AppTypography.cardTitle)
                }

                Spacer(minLength: AppSpacing.xSmall)

                Image(systemName: "cloud.sun.fill")
                    .symbolRenderingMode(.palette)
                    .foregroundStyle(.yellow, .white)
                    .font(.system(size: 62))
                    .accessibilityHidden(true)
            }

            weatherMetrics
        }
        .foregroundStyle(.white)
        .padding(AppSpacing.medium)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(
            LinearGradient(
                colors: [
                    AppColors.brandSecondary,
                    AppColors.brandSecondary.opacity(0.8),
                    AppColors.brandPrimary,
                ],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            ),
            in: AppShapes.hero
        )
    }

    private var weatherMetrics: some View {
        let layout = dynamicTypeSize.isAccessibilitySize
            ? AnyLayout(
                VStackLayout(spacing: AppSpacing.xSmall)
            )
            : AnyLayout(
                HStackLayout(spacing: AppSpacing.xSmall)
            )

        return layout {
            weatherMetric(
                symbol: "thermometer",
                title: "Sensação",
                value: model.feelsLike
            )

            weatherMetric(
                symbol: "drop.fill",
                title: "Chuva",
                value: model.precipitation
            )
        }
    }

    private func weatherMetric(
        symbol: String,
        title: String,
        value: String
    ) -> some View {
        HStack(spacing: AppSpacing.xSmall) {
            Image(systemName: symbol)
                .font(.title3)
                .accessibilityHidden(true)

            VStack(
                alignment: .leading,
                spacing: AppSpacing.xxSmall
            ) {
                Text(title)
                    .font(AppTypography.caption)

                Text(value)
                    .font(AppTypography.cardTitle)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(AppSpacing.small)
        .background(
            .white.opacity(0.2),
            in: AppShapes.control
        )
        .accessibilityElement(children: .combine)
    }

    private var hourlyForecastSection: some View {
        AppCard {
            VStack(
                alignment: .leading,
                spacing: AppSpacing.small
            ) {
                Text("Previsão por hora")
                    .font(AppTypography.cardTitle)
                    .foregroundStyle(AppColors.textPrimary)

                ScrollView(
                    .horizontal,
                    showsIndicators: false
                ) {
                    HStack(spacing: AppSpacing.medium) {
                        ForEach(model.hourlyForecast) { forecast in
                            hourlyForecastItem(forecast)
                        }
                    }
                }
            }
        }
    }

    private func hourlyForecastItem(
        _ forecast: HourlyForecast
    ) -> some View {
        VStack(spacing: AppSpacing.xSmall) {
            Text(forecast.time)
                .font(AppTypography.caption)

            Image(systemName: forecast.symbol)
                .symbolRenderingMode(.palette)
                .foregroundStyle(
                    colorScheme == .dark
                        ? Color.white
                        : AppColors.brandSecondary,
                    Color.yellow
                )
                .font(.title2)
                .accessibilityHidden(true)

            Text(forecast.temperature)
                .font(AppTypography.cardTitle)
        }
        .foregroundStyle(AppColors.textPrimary)
        .frame(minWidth: 44)
        .accessibilityElement(children: .ignore)
        .accessibilityLabel(
            "\(forecast.time), \(forecast.condition), \(forecast.temperature)"
        )
    }

    private var suggestionSection: some View {
        HStack(
            alignment: .top,
            spacing: AppSpacing.small
        ) {
            Image(systemName: "figure.run")
                .font(.title2)
                .foregroundStyle(AppColors.brandPrimary)
                .accessibilityHidden(true)

            VStack(
                alignment: .leading,
                spacing: AppSpacing.xxSmall
            ) {
                Text("Sugestão do dia")
                    .font(AppTypography.cardTitle)

                Text(model.suggestion)
                    .font(AppTypography.supporting)
            }
            .foregroundStyle(AppColors.textPrimary)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(AppSpacing.medium)
        .background(
            AppColors.brandPrimary.opacity(0.1),
            in: AppShapes.card
        )
    }

    private var planningButton: some View {
        Button(action: onPlanWithAI) {
            Label(
                "Planejar com IA",
                systemImage: "sparkles"
            )
        }
        .buttonStyle(AppPrimaryButtonStyle())
    }
}

private extension HomeView.Model {
    static let preview = Self(
        greeting: "Bom dia!",
        city: "Salvador, BA",
        temperature: "27°",
        condition: "Parcialmente nublado",
        feelsLike: "29°",
        precipitation: "20%",
        hourlyForecast: [
            .init(
                id: "10",
                time: "10h",
                temperature: "27°",
                condition: "Parcialmente nublado",
                symbol: "cloud.sun.fill"
            ),
            .init(
                id: "11",
                time: "11h",
                temperature: "28°",
                condition: "Parcialmente nublado",
                symbol: "cloud.sun.fill"
            ),
            .init(
                id: "12",
                time: "12h",
                temperature: "28°",
                condition: "Parcialmente nublado",
                symbol: "cloud.sun.fill"
            ),
            .init(
                id: "13",
                time: "13h",
                temperature: "27°",
                condition: "Nublado",
                symbol: "cloud.fill"
            ),
            .init(
                id: "14",
                time: "14h",
                temperature: "27°",
                condition: "Nublado",
                symbol: "cloud.fill"
            ),
        ],
        suggestion: "Bom momento para atividades ao ar livre, com temperatura agradável."
    )
}

#Preview("Home - Light") {
    HomeView(
        model: .preview,
        onSelectCity: {},
        onUseCurrentLocation: {},
        onPlanWithAI: {}
    )
    .preferredColorScheme(.light)
}

#Preview("Home - Dark") {
    HomeView(
        model: .preview,
        onSelectCity: {},
        onUseCurrentLocation: {},
        onPlanWithAI: {}
    )
    .preferredColorScheme(.dark)
}
