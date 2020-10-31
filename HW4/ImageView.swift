//
//  ImageView.swift
//  HW4
//
//  Created by 林湘羚 on 2020/10/31.
//
import SwiftUI

struct ImageView: View {
    @State var imgName:String
    @State var imgHeight:CGFloat
    var body: some View {
        Image(imgName)
            .resizable()
            .scaledToFit()
            .frame(height:imgHeight)
    }
}


