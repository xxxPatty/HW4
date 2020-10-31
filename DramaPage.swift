//
//  DramaPage.swift
//  HW4
//
//  Created by 林湘羚 on 2020/10/27.
//

import SwiftUI

struct DramaPage: View {
    @Binding var bgColor:Color
    @State private var selectYear=0
    //有演出的年份
    let dramaYear=[2007, 2011, 2012, 2013, 2015, 2020]
    let dramaIntro=["《泡菜奶酪微笑》（韓語：김치치즈스마일，亦翻譯作《泡菜芝士微笑》）是由韓國MBC出品的長篇家庭情景喜劇，該劇延續了《不可阻擋的High Kick》喜劇模式，利用了誇張、搞笑的方式來詮釋了看似複雜家族矛盾，婆媳關係等；由於是繼收視高的《不可阻擋的High Kick》，導致該劇在韓國首播即10.3%收視率，超過前一部，而且該劇以《泡菜奶酪微笑》的名字被中國大陸引進。","《夢想起飛Dream High》（韓語：드림하이）為韓國KBS自2011年1月3日起播出的月火迷你連續劇。由《名家》的李應福導演與《泡菜奶酪微笑》、《愛情殺手吳水晶》的朴惠蓮作家合作打造。此劇講述因為有夢想而很幸福的年輕人的故事。2011年3月1日，即電視劇播畢後的隔天播出了一個以情境劇+演唱會的形式的特輯，由原劇組演員出演。2011年3月確定製作續集《Dream High 2》。", "《擁抱太陽的月亮》（韓語：해를 품은 달），為韓國MBC自2012年1月4日播出的水木迷你連續劇。改編自作家廷銀闕（정은궐）的同名小說，由《聚光燈》、《Royal Family》導演金道勳和《階伯》、《快樂我的家》導演李成俊執導，《京城醜聞》的陳秀完作家執筆。該劇創下42.2%的最高單集收視率，52.59%的最高瞬間收視率，位居2005年以來【迷你劇】收視第一位，被韓國媒體譽為「國民電視劇」。", "《來自星星的你》（韓語：별에서 온 그대 Byeoreseo On Geudae; 英語：My Love from the Star）為韓國SBS自2013年12月18日起播出的水木迷你連續劇，由金秀賢及全智賢主演，朴智恩擔任編劇，與《風之畫師》、《樹大根深》導演張太侑聯手打造。當中全智賢是自1999年《歡樂時光》之後時隔14年復出參演電視劇。本劇以《朝鮮王朝實錄》中1609年（明朝萬曆三十七年，即光海君執政的第一年）的不明飛行物體相關紀錄，講述外星男子都敏俊（金秀賢 飾）從外太空來到400年前的朝鮮並一直生活到現代，在和身為國民頂級女演員的千頌伊（全智賢 飾）發生愛情的過程中，不同星球的兩人消除彼此之間的誤解，克服危險追尋眞愛的浪漫愛情喜劇。", "《製作人的那些事》（KBS World譯為製片師）（韓語：프로듀사，英語：The Producers）為韓國KBS自2015年5月15日起播出的KBS金土連續劇，由金秀賢、車太鉉、孔曉振及IU主演，《賢內助女王》、《順藤而上的你》、《來自星星的你》編劇朴智恩，攜手《搞笑演唱會》、《兩天一夜》導演徐秀旻，《浪漫滿屋》導演表民秀，和《我是男人》導演李東勛共同打造。由於此劇具有強大的製作團隊及知名度甚高的演員群，因此備受外界矚目。本劇除了以戲劇拍攝呈現外，更穿插綜藝節目拍攝方式製播。", "《雖然是精神病但沒關係》（韓語：사이코지만 괜찮아，英語：It's Okay to not be Okay），為韓國tvN於2020年6月20日起播出的週末連續劇，由《嫉妒的化身》、《男朋友》、《圈套》的朴信宇導演與《Jugglers》的趙容作家合作打造。本劇講述因為沉重的人生重負而拒絕愛情的精神病院男看護，和一名擁有反社會人格不懂愛的童話女作家，兩人相遇後互相撫平傷痛治癒彼此的傷痕，如童話般浪漫、超越生死的愛情故事。Netflix於6月20日起全球同步上線。"]
    
    var body: some View {
        VStack(alignment:.leading){
            //若Picker選到的年份有演出，show出該戲資訊
            if(dramaYear.contains(selectYear+2007)){
                VStack{
                    ScrollView(.horizontal){
                        let rows=[GridItem()]
                        LazyHGrid(rows:rows){
                            ForEach(1..<4){ (index) in
                                //ImageView(imgName:"\(selectYear+2007)drama\(index)", imgHeight:200)
                                Image("\(selectYear+2007)drama\(index)")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height:200)
                            }
                        }
                    }
                    TextEditor(text:.constant(dramaIntro[dramaYear.firstIndex(of:selectYear+2007)!]))
                        .padding(2)
                        .frame(height:300)
                        .background(Color.black)
                }
            }
            else{//若沒有演出，show出預設圖文
                VStack(alignment:.leading){
                    ScrollView(.horizontal){
                        let rows=[GridItem()]
                        LazyHGrid(rows:rows){
                            //ImageView(imgName:"sleep", imgHeight:200)
                            Image("sleep")
                                .resizable()
                                .scaledToFit()
                                .frame(height:200)
                            
                        }
                    }
                    TextEditor(text:.constant("沒有作品"))
                        .padding(2)
                        .frame(height:300)
                        .background(Color.black)
                }
            }
            //year picker，選年份
            VStack(alignment:.leading){
                Text("選擇年份：")
                Picker(selection:$selectYear, label:Text("選擇年份：")){
                    ForEach(2007..<2021){(index) in
                        Text(String(index))
                    }
                }
                .frame(width:200, height:100)
                .overlay(
                    RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                        .stroke(Color.black)
                )
                .clipped()
            }
        }
        .frame(height:UIScreen.main.bounds.height)
    }
}

struct DramaPage_Previews: PreviewProvider {
    static var previews: some View {
        DramaPage(bgColor:.constant(Color.white))
    }
}
