//
//  ListViewModel.swift
//  MachineTestDemoProject
//
//  Created by Mahesh Kumar on 28/08/24.
//

import Foundation
import Combine

/// The view model for the list view.
///
/// `ListViewModel` manages the state of the list, including the search text and the list of items. It provides filtered items based on the search text.
class ListViewModel: ObservableObject {
    @Published var searchText = "" // The text to filter the list items
    
    /// The list of items to be displayed in the list.
    let items = [
        ListItem(title: "Apple", description: "A juicy red fruit", imageName: "image1"),
        ListItem(title: "Banana", description: "A yellow curved fruit", imageName: "image2"),
        ListItem(title: "Orange", description: "A citrus fruit", imageName: "image3"),
        ListItem(title: "Blueberry", description: "Small blue fruit", imageName: "image4"),
        ListItem(title: "Grape", description: "A small purple fruit", imageName: "image5")
    ]

    /// Computed property that returns items filtered by the search text.
    var filteredItems: [ListItem] {
        if searchText.isEmpty {
            return items
        } else {
            return items.filter { $0.title.lowercased().contains(searchText.lowercased()) }
        }
    }
}
