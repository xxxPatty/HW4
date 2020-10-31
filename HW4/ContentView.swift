//
//  ContentView.swift
//  HW4
//
//  Created by 林湘羚 on 2020/10/26.
//

import SwiftUI

struct ContentView: View {
    @State var bgColor=Color.white
    var body: some View {
        TabView{
            HomePage(bgColor: $bgColor)
            .background(bgColor)
                .tabItem{
                    Image(systemName: "info.circle.fill")
                    Text("介紹")
                }
            DramaPage(bgColor: $bgColor)
                .background(bgColor)
                .tabItem{
                    Image(systemName: "film.fill")
                    Text("電視劇")
                }
            PicturePage1(bgColor: $bgColor)
                .background(bgColor)
                .tabItem{
                    Image(systemName: "person.crop.square.fill")
                    Text("圖片")
                }
             PicturePage2(bgColor: $bgColor)
                .background(bgColor)
                .tabItem{
                    Image(systemName: "hourglass")
                    Text("成長史")
                }
            Pronounce(bgColor: $bgColor)
                .background(bgColor)
                .tabItem{
                    Image(systemName: "heart.fill")
                    Text("告白")
                }
        }
        .background(bgColor)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


