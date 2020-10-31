//
//  PicturePage1.swift
//  HW4
//
//  Created by 林湘羚 on 2020/10/27.
//

import SwiftUI

struct PicturePage1: View {
    @Binding var bgColor:Color
    @State private var showCharacter1=false
    @State private var showCharacter2=false
    @State private var showCharacter3=false
    @State private var showCharacter4=false
    @State private var showCharacter5=false
    @State private var showCharacter6=false
    var body: some View {
        VStack{
            Text("金秀賢演過的角色們")
                .font(.system(.largeTitle, design: .rounded))
            //主演過的角色列表
            List{
                Group{
                    ListButtonView(showCharacter: $showCharacter1, imgName:"2007drama1", roleName:"金修賢")
                    ListButtonView(showCharacter: $showCharacter1, imgName:"2011drama1", roleName:"宋森動")
                    ListButtonView(showCharacter: $showCharacter1, imgName:"2012drama1", roleName:"李暄")
                    ListButtonView(showCharacter: $showCharacter1, imgName:"2013drama1", roleName:"都敏俊")
                    ListButtonView(showCharacter: $showCharacter1, imgName:"2015drama1", roleName:"白承燦")
                    ListButtonView(showCharacter: $showCharacter1, imgName:"2020drama1", roleName:"文鋼太")
                }
                .background(bgColor)
                .opacity(0.8)
            }
            .frame(height:380)
        }
        .frame(height:UIScreen.main.bounds.height)
    }
}

struct PicturePage1_Previews: PreviewProvider {
    static var previews: some View {
        PicturePage1(bgColor:.constant(Color.white))
    }
}
//sheet的View
struct SecondView:View{
    @Binding var showCharacter:Bool
    @State var img:String
    @State private var scale:CGFloat=1
    @State private var brightness:Double=0
    @State private var cornerRadius:CGFloat=0
    @State private var opacity:Double=1
    @State private var grayscale:Double=0
    @State private var saturation:Double=0.5
    @State private var contrast:Double=0.5
    @State private var blur:CGFloat=0
    
    var body: some View{
        VStack{
            Image(img)
                .scaleEffect(scale)
                .brightness(brightness)
                .cornerRadius(cornerRadius)
                .opacity(opacity)
                .grayscale(grayscale)
                .saturation(saturation)
                .contrast(contrast)
                .blur(radius:blur)
            
            Form{
                Slider(value:$scale, in:0...1, minimumValueLabel:Text("大小"), maximumValueLabel:Text("")){
                    Text("")
                }
                Slider(value:$brightness, in:0...1, minimumValueLabel:Text("亮度"), maximumValueLabel:Text("")){
                    Text("")
                }
                Slider(value:$cornerRadius, in:0...20, minimumValueLabel:Text("圓角"), maximumValueLabel:Text("")){
                    Text("")
                }
                Slider(value:$opacity, in:0...1, minimumValueLabel:Text("透明度"), maximumValueLabel:Text("")){
                    Text("")
                }
                Slider(value:$grayscale, in:0...1, minimumValueLabel:Text("灰階"), maximumValueLabel:Text("")){
                    Text("")
                }
                Slider(value:$saturation, in:0...20, minimumValueLabel:Text("飽和度"), maximumValueLabel:Text("")){
                    Text("")
                }
                Slider(value:$contrast, in:0...1, minimumValueLabel:Text("對比度"), maximumValueLabel:Text("")){
                    Text("")
                }
                Slider(value:$blur, in:0...20, minimumValueLabel:Text("模糊度"), maximumValueLabel:Text("")){
                    Text("")
                }
            }
            Button("colse"){
                showCharacter=false
            }
        }
    }
}

struct SecondView_PreViews:PreviewProvider{
    static var previews: some View{
        
        SecondView(showCharacter: .constant(true), img: "sleep")
    }
}

//呈現金秀賢演過的角色們的List Row
struct ListButtonView: View {
    @Binding var showCharacter:Bool
    @State var imgName:String
    @State var roleName:String
    var body: some View {
        Button(action:{
            showCharacter=true
        }){
            HStack{
                ImageView(imgName:imgName, imgHeight:50)
                Text(roleName)
                Spacer()
            }
            .padding(.leading, 10)
        }
        .sheet(isPresented:$showCharacter){
            SecondView(showCharacter: $showCharacter, img:imgName)
        }
    }
}
