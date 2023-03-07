//
//  Model.swift
//

import Foundation

// Array of image url strings
let imageArray = [
    "https://upload.wikimedia.org/wikipedia/commons/thumb/3/3a/Cat03.jpg/440px-Cat03.jpg",
    "https://i.guim.co.uk/img/media/26392d05302e02f7bf4eb143bb84c8097d09144b/446_167_3683_2210/master/3683.jpg?width=1200&quality=85&auto=format&fit=max&s=a52bbe202f57ac0f5ff7f47166906403",
    "https://cdn.britannica.com/91/181391-050-1DA18304/cat-toes-paw-number-paws-tiger-tabby.jpg",
    "https://cdn.britannica.com/25/7125-050-67ACEC3C/Abyssinian-sorrel.jpg",
    "https://www.humanesociety.org/sites/default/files/styles/768x326/public/2020-07/kitten-510651.jpg?h=f54c7448&itok=ISdG3bxz",
    "https://c.ndtvimg.com/2020-08/h5mk7js_cat-generic_625x300_28_August_20.jpg",
    "https://www.zdnet.com/a/img/resize/22996632853fd12eeffc973ecdafa55e4439ef6c/2022/09/05/c70fdeec-fd32-4d1c-96fe-d5dfe2f63da4/img-1001.jpg?auto=webp&fit=crop&height=1200&width=1200",
    "https://ychef.files.bbci.co.uk/976x549/p07ryyyj.jpg",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSm8ErlMlPdnS5zbhJ2KL339H-cCsjrxjMl8A&usqp=CAU",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQzrv6gHQCF704jMbWGnYvWdQ6nv2YZgfK9Ig&usqp=CAU",
    "https://static.scientificamerican.com/sciam/cache/file/1E3A3E62-B3CA-434A-8C3B3ED0C982FB69_source.jpg",
]

class Document: ObservableObject {
    @Published var items:[ItemModel]
    init() {
        print("Model init")
        // items for testing
        items = [
             ItemModel(urlStr: imageArray[3], label:"cat3"),
             ItemModel(urlStr: imageArray[4], label:"cat4"),
             ItemModel(urlStr: imageArray[5], label:"cat5"),
             ItemModel(urlStr: imageArray[6], label:"cat6"),
             ItemModel(urlStr: imageArray[7], label:"cat7"),
             ItemModel(urlStr: imageArray[8], label:"cat8"),
             ItemModel(urlStr: imageArray[9], label:"cat9"),
             ItemModel(urlStr: imageArray[10], label:"cat10"),
            ItemModel(urlStr: imageArray[2], label:"cat cat cat", assetName: "red", systemName: "rectangle", altText: "plz add the alt text !"),
            ItemModel(urlStr: imageArray[1], label:"Cutey", assetName: "yellow", altText: "a cat with brown hair and green eyes is staring at a camera in front angle with its hand slightly put on white box"),
            ItemModel(urlStr: imageArray[0], label:"cat", systemName: "", altText: "chubby brown haired car staring the camera, shot in high angle"),
        ]
    }
    
    func addItem(urlStr:String, label:String, assetName:String, systemName: String, altText: String) -> ItemModel {
        let item = ItemModel(urlStr:urlStr, label:label, assetName: assetName, systemName: systemName, altText:altText)
        items.append(item)
        return item
    }
    
    func newItem() -> ItemModel {
        return addItem(urlStr: "", label: "", assetName: "", systemName: "", altText: "")
    }
    
    func updateItem(id: UUID, urlStr:String, label:String, assetName:String, systemName: String, altText: String) {
        if let index = findIndex(id) {
            items[index].urlStr = urlStr
            items[index].label = label
            items[index].assetName = assetName
            items[index].systemName = systemName
            items[index].altText = altText
        }
    }
    
    func deleteItem(id: UUID) {
        if let index = findIndex(id) {
            items.remove(at: index)
        }
    }
    
    func findIndex(_ id: UUID) -> Int? {
        return items.firstIndex { item in item.id == id }
    }
}
