//
//  ContentView.swift
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var document:Document
    
    var body: some View {
        NavigationView {
            List {
                // Display in reverse order to see new additions first
                ForEach(document.items.reversed()) { item in
                    NavigationLink(
                        destination:
                            // ItemDetail(item: item)
                        // UpdateImageView(item: item)
                        UpdateImageView(action: "Update",
                                        id: item.id,
                                        urlStr: item.urlStr,
                                        label: item.label,
                                        assetName: item.assetName,
                                        systemName: item.systemName,
                                        altText: item.altText)
                    )
                    {
                        ItemRow(item: item)
                    }
                }
            }
            .navigationTitle("Cat list")
            .navigationBarItems(
                trailing:
                    NavigationLink(
                        destination:
                            AddImageView()
                    )
                {
                    Text("Add your cat image")
                }
            )
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let model = Document()
        ContentView()
            .environmentObject(model)
    }
}
