//
//  PicturePage2.swift
//  HW4
//
//  Created by 林湘羚 on 2020/10/27.
//

import SwiftUI

struct PicturePage2: View {
    @Binding var bgColor:Color
    @State private var name=""
    let greet=["Hi", "Hello", "你好", "안녕하십니까"]
    @State private var greetText=""
    @State private var age=10
    var body: some View {
        VStack{
            HStack{
                TextField("輸入name", text:$name)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.black)
                    )
                    .clipped()
                Button("輸入"){
                    greetText=String(Int(age))+"歲的秀賢跟"+name+"說"+greet[Int.random(in:0..<greet.count)]
                }
            }
            Text(greetText)
            Image("\(Int(age))")
                .resizable()
                .scaledToFit()
                .frame(height:200)
            //ImageView(imgName:"\(Int(age))", imgHeight:200)
                .contextMenu{
                    Button(action:{
                        let AppStr:Int=(Int(age)-10)/2+1
                        print("\(AppStr)")
                        UIApplication.shared.setAlternateIconName("\(Int(age))")
                    }){
                        Text("設為AppIcon")
                        Image(systemName:"person.fill")
                    }
                }
            //ImageView(imgName:"\(Int(age))")
                
            Stepper(value: $age, in:10...24, step:2){
                Text("選擇金秀賢的年齡: \(Int(age))")
            }
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.black)
            )
            .clipped()
        }
        .padding(5)
        .frame(height:UIScreen.main.bounds.height)
    }
}

struct PicturePage2_Previews: PreviewProvider {
    static var previews: some View {
        PicturePage2(bgColor:.constant(Color.white))
    }
}

