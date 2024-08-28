//
//  CarouselView.swift
//  MachineTestDemoProject
//
//  Created by Mahesh Kumar on 28/08/24.
//

import SwiftUI

/// A SwiftUI view that displays a carousel of images.
///
/// `CarouselView` uses a `TabView` with a `PageTabViewStyle` to create a carousel effect.
/// It binds to a `CarouselViewModel` to get the current index and image data. It also displays page indicators at the bottom.
struct CarouselView: View {
    @StateObject private var viewModel = CarouselViewModel() // The view model that manages carousel data

    var body: some View {
        VStack {
            TabView(selection: $viewModel.currentIndex) {
                // Create an image view for each item in the carousel
                ForEach(viewModel.items.indices, id: \.self) { index in
                    Image(viewModel.items[index].imageName)
                        .resizable()
                        .scaledToFill()
                        .frame(width: UIScreen.main.bounds.width * 0.8, height: 200) // Adjust width and height as needed
                        .clipped() // To ensure the image does not overflow the frame
                        .cornerRadius(10) // Optional: Add rounded corners
                        .tag(index) // Tag the image with its index to synchronize with the selection
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            .frame(height: 220) // Adjust frame height to fit your content

            HStack {
                // Create page indicators
                ForEach(viewModel.items.indices, id: \.self) { index in
                    Circle()
                        .fill(viewModel.currentIndex == index ? Color.blue : Color.gray)
                        .frame(width: 10, height: 10)
                }
            }
            .padding(.horizontal, 16) // Add leading and trailing padding
            .padding(.top, 8)
        }
        .padding(.horizontal) // General padding for the entire carousel
    }
}

