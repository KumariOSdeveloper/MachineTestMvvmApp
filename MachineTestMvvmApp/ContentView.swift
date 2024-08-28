//
//  ContentView.swift
//  MachineTestMvvmApp
//
//  Created by Mahesh Kumar on 28/08/24.
//

import SwiftUI

/// The main content view that combines various components like a carousel, list, and a floating action button.
struct ContentView: View {
    var body: some View {
        NavigationView {
            ZStack {
                // Background Color
                Color.green.opacity(0.1) // Light green color with some opacity
                    .edgesIgnoringSafeArea(.all) // Ensures the color covers the entire screen
                
                VStack {
                    // Carousel view at the top of the screen
                    CarouselView()
                        .frame(height: 200) // Adjust height as needed

                    // List view below the carousel
                    ListViewCell()
                    
                    Spacer() // Pushes content above (carousel and list) towards the top
                }
                
                // Floating action button placed at the bottom of the screen
                VStack {
                    Spacer() // Pushes the button to the bottom of the screen
                    FloatingActionButtonView()
                        .padding(.bottom, 20) // Adjust bottom padding for spacing
                }
            }
        }
    }
}
