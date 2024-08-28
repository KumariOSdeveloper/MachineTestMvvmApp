//
//  FloatingActionButtonView.swift
//  MachineTestDemoProject
//
//  Created by Mahesh Kumar on 28/08/24.
//

import SwiftUI

/// A SwiftUI view that displays a floating action button to calculate statistics and show a bottom sheet.
///
/// `FloatingActionButtonView` uses a button to trigger statistics calculation and displays a `BottomSheetView` with the results.
struct FloatingActionButtonView: View {
    @State private var showBottomSheet = false // State to control the visibility of the bottom sheet
    @ObservedObject var viewModel = StatisticsViewModel() // View model for managing statistics

    var body: some View {
        VStack {
            Spacer()
            HStack {
                Spacer()
                Button(action: {
                    viewModel.calculateStatistics() // Calculate statistics when button is tapped
                    showBottomSheet.toggle() // Toggle the bottom sheet
                }) {
                    ZStack {
                        Circle()
                            .fill(Color.blue)
                            .frame(width: 60, height: 60) // Size of the button

                        VStack(spacing: 4) {
                            // Done for custom 3 vertical dots
                            Circle()
                                .frame(width: 8, height: 8)
                                .foregroundColor(.white)
                            Circle()
                                .frame(width: 8, height: 8)
                                .foregroundColor(.white)
                            Circle()
                                .frame(width: 8, height: 8)
                                .foregroundColor(.white)
                        }
                    }
                }
                .sheet(isPresented: $showBottomSheet) {
                    BottomSheetView(viewModel: viewModel)
                        .presentationDetents([.medium, .large]) // Allow the bottom sheet to be medium or large
                }
                .padding()
            }
        }
    }
}

/// A SwiftUI view that displays the statistics in a bottom sheet.
///
/// `BottomSheetView` shows a list of items and the top characters with their frequencies.
struct BottomSheetView: View {
    @ObservedObject var viewModel: StatisticsViewModel // View model with the statistics data

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            // Display the list of items
            Text("List 1 (\(viewModel.items.count) items)")
                .font(.title2)
                .bold()

            ForEach(viewModel.items, id: \.self) { item in
                Text(item)
                    .font(.body)
            }

            Divider()
                .padding(.vertical)

            // Display the top 3 characters with their frequencies
            Text("Top Characters:")
                .font(.title2)
                .bold()

            // Sort characters by frequency in descending order
            let sortedCharacters = viewModel.topCharacters.sorted { $0.value > $1.value }

            ForEach(sortedCharacters.prefix(3), id: \.key) { char, count in
                HStack {
                    Text("\(String(char))") // Explicitly convert Character to String
                        .font(.headline)
                    Spacer()
                    Text("= \(count)")
                        .font(.headline)
                }
                .padding(.vertical, 2)
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(20)
        .shadow(radius: 10)
    }
}

