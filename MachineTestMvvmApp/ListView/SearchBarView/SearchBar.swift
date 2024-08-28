//
//  SearchBar.swift
//  MachineTestDemoProject
//
//  Created by Mahesh Kumar on 28/08/24.
//

import SwiftUI

/// A SwiftUI view that provides a search bar for filtering items in the list.
///
/// `SearchBar` uses a `UISearchBar` from UIKit to enable search functionality in a SwiftUI view. It binds the search text to a SwiftUI `@Binding` property.
struct SearchBar: UIViewRepresentable {
    @Binding var text: String // The text to be searched

    func makeUIView(context: Context) -> UISearchBar {
        let searchBar = UISearchBar(frame: .zero)
        searchBar.delegate = context.coordinator
        searchBar.placeholder = "Search" // Add placeholder text
        searchBar.backgroundImage = UIImage() // Remove background color
        return searchBar
    }

    func updateUIView(_ uiView: UISearchBar, context: Context) {
        uiView.text = text
    }

    func makeCoordinator() -> Coordinator {
        return Coordinator(text: $text)
    }

    class Coordinator: NSObject, UISearchBarDelegate {
        @Binding var text: String

        init(text: Binding<String>) {
            _text = text
        }

        func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            text = searchText
        }
    }
}

