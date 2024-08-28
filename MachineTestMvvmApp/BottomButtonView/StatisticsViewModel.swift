//
//  StatisticsViewModel.swift
//  MachineTestDemoProject
//
//  Created by Mahesh Kumar on 28/08/24.
//

import Foundation
import Combine

/// The view model for calculating and storing statistics.
///
/// `StatisticsViewModel` manages the data for the floating action button and bottom sheet. It includes a list of items and a method to calculate the most frequent characters.
class StatisticsViewModel: ObservableObject {
    @Published var items = ["apple", "banana", "orange", "blueberry"] // The list of items to analyze
    @Published var topCharacters: [Character: Int] = [:] // The most frequent characters and their counts

    /// Calculates the frequency of characters in the list of items and updates `topCharacters`.
    func calculateStatistics() {
        var characterCount: [Character: Int] = [:]

        for item in items {
            for char in item {
                characterCount[char, default: 0] += 1
            }
        }

        // Get the top 3 most frequent characters
        topCharacters = characterCount
            .sorted { $0.value > $1.value }
            .prefix(3)
            .reduce(into: [Character: Int]()) { $0[$1.key] = $1.value }
    }
}
