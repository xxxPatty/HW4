//
//  Pronounce.swift
//  HW4
//
//  Created by 林湘羚 on 2020/10/28.
//

import SwiftUI
import AVFoundation

struct Pronounce: View {
    @Binding var bgColor:Color
    @State private var doYoyLoveMe=false
    @State private var isPlay=false
    @State private var music=true
    @State private var moveY=UIScreen.main.bounds.height-50
    @State private var moveY2=UIScreen.main.bounds.height-100
    @State private var moveY3=UIScreen.main.bounds.height-200
    @State private var selectDate=Date()
    let player=AVPlayer()
    var body: some View {
        ZStack{
            VStack{
                Toggle("告白音樂", isOn: $isPlay)
                    .onChange(of:isPlay, perform: {isPlay in
                        if isPlay{
                            player.play()
                        }
                        else{
                            player.pause()
                        }
                    })
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.black)
                    )
                    .clipped()
                DatePicker("選擇告白日子", selection: $selectDate, in:Date()..., displayedComponents:.date)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.black)
                    )
                    .clipped()
                ImageView(imgName:"pronounce", imgHeight:200)
                    .mask(
                        Image(systemName:"heart.fill")
                            .font(.system(size:190))
                    )
                Button("金秀賢喜歡我嗎？"){
                    doYoyLoveMe=true
                }
                .alert(isPresented: $doYoyLoveMe, content: {
                    let ans=[" 不適合告白。", " 是個告白的好日子，衝！", " 成功率80%，可以考慮。"].randomElement()!
                    return Alert(title: Text(selectDate, style:.date)+Text(ans))
                })
            }
            //音樂
            .onAppear{
                let fileUrl=Bundle.main.url(forResource:"(繁中字)來自星星的你 OST Part.4 孝琳 - 再見", withExtension:"mp3")!
                let playerItem=AVPlayerItem(url:fileUrl)
                        player.replaceCurrentItem(with:playerItem)
            }
            //愛心動畫
            VStack{
                Image(systemName: "heart")
                    .transition(.slide)
                    .position(x: UIScreen.main.bounds.width/2, y: moveY)
            }
            .animation(
                Animation.linear(duration: 5)
                    .repeatForever(autoreverses: false)
            )
            .onAppear{
                moveY=0
            }
            
            VStack{
                Image(systemName: "heart")
                    .transition(.slide)
                    .position(x: UIScreen.main.bounds.width/2-150, y: moveY2)
            }
            .animation(
                Animation.linear(duration: 7)
                    .repeatForever(autoreverses: false)
            )
            .onAppear{
                moveY2=0
            }
            
            VStack{
                Image(systemName: "heart")
                    .transition(.slide)
                    .position(x: UIScreen.main.bounds.width/2+150, y: moveY3)
            }
            .animation(
                Animation.linear(duration: 4)
                    .repeatForever(autoreverses: false)
            )
            .onAppear{
                moveY3=0
            }
        }
        .padding(5)
        .frame(height:UIScreen.main.bounds.height)
    }
}
 
struct Pronounce_Previews: PreviewProvider {
    static var previews: some View {
        Pronounce(bgColor:.constant(Color.white))
    }
}
