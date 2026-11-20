//
//  ContentView.swift
//  WeatherWiseAI
//
//  Created by Rodrigo Cerqueira Reis on 10/11/26.
//

import SwiftUI

struct ContentView: View {
    private enum AppTab: Hashable {
        case home
        case planner
        case forecast
    }

    private enum PendingAction: Identifiable {
        case selectCity
        case currentLocation

        var id: Self {
            self
        }

        var title: String {
            switch self {
            case .selectCity:
                "Selecionar cidade"
            case .currentLocation:
                "Minha localização"
            }
        }

        var message: String {
            switch self {
            case .selectCity:
                "A seleção manual de cidade estará disponível em breve."
            case .currentLocation:
                "A localização será solicitada somente quando esse recurso estiver disponível e você decidir utilizá-lo."
            }
        }
    }

    @State private var selectedTab: AppTab = .home
    @State private var pendingAction: PendingAction?

    var body: some View {
        TabView(selection: $selectedTab) {
            homeTab
                .tabItem {
                    Label("Início", systemImage: "house")
                }
                .tag(AppTab.home)

            ContentUnavailableView(
                "Planejador em desenvolvimento",
                systemImage: "calendar",
                description: Text(
                    "Em breve, você poderá planejar atividades e eventos com IA."
                )
            )
            .background(AppColors.screenBackground)
            .tabItem {
                Label("Planejar", systemImage: "calendar")
            }
            .tag(AppTab.planner)

            ContentUnavailableView(
                "Previsão em desenvolvimento",
                systemImage: "chart.bar",
                description: Text(
                    "Aqui você encontrará a previsão meteorológica detalhada."
                )
            )
            .background(AppColors.screenBackground)
            .tabItem {
                Label("Previsão", systemImage: "chart.bar")
            }
            .tag(AppTab.forecast)
        }
        .tint(AppColors.brandPrimary)
        .alert(item: $pendingAction) { action in
            Alert(
                title: Text(action.title),
                message: Text(action.message),
                dismissButton: .default(Text("Entendi"))
            )
        }
    }

    private var homeTab: some View {
        HomeView(
            model: demoHomeModel,
            onSelectCity: {
                pendingAction = .selectCity
            },
            onUseCurrentLocation: {
                pendingAction = .currentLocation
            },
            onPlanWithAI: {
                selectedTab = .planner
            }
        )
        .safeAreaInset(edge: .top, spacing: 0) {
            Text("Dados demonstrativos — sem previsão em tempo real")
                .font(AppTypography.caption)
                .foregroundStyle(.secondary)
                .frame(maxWidth: .infinity)
                .padding(.vertical, AppSpacing.xSmall)
                .background(AppColors.screenBackground)
        }
    }

    private var demoHomeModel: HomeView.Model {
        HomeView.Model(
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
            suggestion: "Exemplo ilustrativo: condições agradáveis para atividades ao ar livre."
        )
    }
}

#Preview("App - Light") {
    ContentView()
        .preferredColorScheme(.light)
}

#Preview("App - Dark") {
    ContentView()
        .preferredColorScheme(.dark)
}
