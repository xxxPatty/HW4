//
//  HomePage.swift
//  HW4
//
//  Created by 林湘羚 on 2020/10/27.
//

import SwiftUI

struct HomePage: View {
    @Binding var bgColor:Color
    //主演過的戲
    let dramas=["泡菜乳酪微笑", "夢想起飛DreamHigh", "擁抱太陽的月亮", "來自星星的你", "製作人", "雖然是神經病但沒關係"]
    @State private var isExpanded=false
    var body: some View {
        VStack{
            //選背景色
            ColorPicker("選擇背景顏色", selection:$bgColor)
            Text("金秀賢")
                .font(.system(.largeTitle, design: .rounded))
            //金秀賢介紹
            TextEditor(text:.constant("金秀賢（韓語：김수현，1988年2月16日－），韓國男演員、歌手，身高180公分。名字含意為「出類拔萃之『秀』，明智聰慧之『賢』」。金秀賢因名字較女性化，所以在小學時期時，幫自己取了一個綽號叫秀MAN，名字常被音譯為「金秀炫」。2007年在韓國兵務廳進行的體檢中，因心臟問題獲准作為公益勤務要員完成兵役。金秀賢不斷進行健康管理後，在2012年覆檢時獲現役判定。後以現役士兵的身份於2017年10月23日入伍於京畿道坡州的1師團新兵教育隊進行5週的基礎軍事訓練，後被分配至1師團搜索大隊服役。2018年8月提早1個月晉升為上等兵，及2019年2月1日提早2個月晉升為兵長，並考獲特級戰士資格。金秀賢已於2019年7月1日退伍。"))
                .accentColor(.clear)
                .frame(height:300)
                .padding(2)
                .background(bgColor)
                .opacity(0.8)
            DisclosureGroup(
                isExpanded: $isExpanded,
                content:{
                    VStack(alignment: .leading){
                        ForEach(dramas.indices){ (index) in
                            Text(dramas[index])
                        }
                    }
                },
                label:{
                    Label("主演電視劇", systemImage:"person.fill")
                }
            )
            .padding()
        }
        .frame(height:UIScreen.main.bounds.height)
    }
}

struct HomePage_Previews: PreviewProvider {
    static var previews: some View {
        HomePage(bgColor:.constant(Color.white))
    }
}
