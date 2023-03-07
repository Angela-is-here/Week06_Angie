//
//  UpdateImageView.swift
//  ImageEditDemo
//
//  Created by jht2 on 3/3/22.
//

import SwiftUI

struct UpdateImageView: View {
    var action: String // "Update" or "Add"
    var id: UUID
    
    @State var urlStr:String = ""
    @State var label:String = ""
    @State var assetName:String = ""
    @State var systemName:String = ""
    @State var altText:String = ""
    
    @State var uiImage:UIImage?
    
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var document:Document
    
    var body: some View {
        VStack {
            ZStack {
                Image(assetName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                if let uiImage {
                    Image(uiImage: uiImage)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                }
                Image(systemName: systemName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
            HStack {
                Button("Update Changes") {
                    print("UpdateImageView Update")
                    document.updateItem(id: id, urlStr: urlStr, label: label,
                        assetName: assetName,
                        systemName: systemName,
                        altText: altText
                    )
                    dismiss()
                }
                Spacer()
                Button("Delete Image") {
                    document.deleteItem(id: id)
                    dismiss();
                }
            }.padding(10)
            Form {
                TextField("Image URL", text: $urlStr)
                    .textInputAutocapitalization(.never)
                    .disableAutocorrection(true)
                TextField("Label", text: $label)
                    .textInputAutocapitalization(.never)
                    .disableAutocorrection(true)
                TextField("Asset Name", text: $assetName)
                    .textInputAutocapitalization(.never)
                    .disableAutocorrection(true)
                TextField("System Name", text: $systemName)
                    .textInputAutocapitalization(.never)
                    .disableAutocorrection(true)
                TextField("Alt Text", text: $altText)
                    .textInputAutocapitalization(.never)
                    .disableAutocorrection(true)
            }
        }
        .task {
            uiImage =  await imageFor(string: urlStr)
        }
    }
}

struct UpdateImageView_Previews: PreviewProvider {
    static var previews: some View {
        UpdateImageView(action: "action", id: UUID())
    }
}
