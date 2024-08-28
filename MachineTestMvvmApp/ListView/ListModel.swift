//
//  ListModel.swift
//  MachineTestDemoProject
//
//  Created by Mahesh Kumar on 28/08/24.
//

import Foundation

/// A model representing an item in the list.

/// This struct holds the information necessary for each list item, such as the title, description, and image name.
struct ListItem: Identifiable {
    let id = UUID() // Unique identifier for each item
    let title: String // The title of the item
    let description: String // A brief description of the item
    let imageName: String // The name of the image asset associated with the item
}

