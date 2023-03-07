//
//  HomeView.swift
//  ImageEditDemo
//
//  Created by Angie Kim on 3/6/23.
//

import SwiftUI



struct HomeView: View {
    @StateObject var document = Document()
   var body: some View {
      NavigationView {
          VStack(alignment: .center) {
             Text("Welcome!")
                 .font(.title)
                 .fontWeight(.bold)
                 .foregroundColor(Color.black)
              NavigationLink(destination: ContentView().environmentObject(document)) {
                  Image("image1")
                      .resizable()
                      .aspectRatio(contentMode: .fit)
                      .padding(.all, 10.0)
                      .frame(width: 300)
                  }
            Text("")
              Text("Click the image to view the image list")
                  .fontWeight(.medium)
                  .foregroundColor(Color(hue: 1.0, saturation: 0.0, brightness: 0.363))
          }
          .frame(width: nil)
         }
      }
   }



struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
