//
//  ListViewCell.swift
//  MachineTestMvvmApp
//
//  Created by Mahesh Kumar on 28/08/24.
//

//
//  ListView.swift
//  MachineTestDemoProject
//
//  Created by Mahesh Kumar on 28/08/24.
//

import SwiftUI

/// A SwiftUI view that displays a list of items with a search bar.
///
/// `ListView` uses a `List` to display `ListItem` objects and a `SearchBar` to filter the items. It binds to a `ListViewModel` to get the list data and search functionality.
struct ListViewCell: View {
    @StateObject var viewModel = ListViewModel() // The view model that manages list data and search

    var body: some View {
        VStack {
            SearchBar(text: $viewModel.searchText)
                .padding(.top)

            List {
                ForEach(viewModel.filteredItems) { item in
                    HStack {
                        Image(item.imageName)
                            .resizable()
                            .frame(width: 50, height: 50)
                            .cornerRadius(8)

                        VStack(alignment: .leading) {
                            Text(item.title)
                                .font(.headline)
                            Text(item.description)
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                        
                        Spacer() // Pushes content to the left side
                    }
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading) // Aligns content to the left
                    .background(Color.green.opacity(0.1)) // Light green background
                    .cornerRadius(10)
                    .padding(.vertical, 1) // Space between cells
                }
                .listRowBackground(Color.clear) // Clears the background color of the list view
            }
            .onAppear {
                UITableView.appearance().tableHeaderView = UIView()
            }
            .listStyle(PlainListStyle()) // Optional: Use PlainListStyle to get rid of default list styling
        }
        .padding(.horizontal) // Optional: Padding for the overall list view
    }
}


