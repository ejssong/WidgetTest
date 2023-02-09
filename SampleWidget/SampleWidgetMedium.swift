//
//  SampleWidgetMedium.swift
//  SampleProject
//
//  Created by ejsong on 2023/02/09.
//

import SwiftUI

struct SampleWidgetMedium: View {
    var entry: Provider.Entry
    
    var body: some View {
        ZStack{
            entry.mode == .light ? Color(.white) : Color(.black)
            
            VStack(alignment: .leading) {
                HStack() {
                    Text("Logo")
                    Spacer()
                    Text("NickName")
                        .font(Font.system(size: 12))
                        .foregroundColor(entry.mode == .light ? .black : .white)
                }
                
                Divider()
                    .padding(.top, 5)
                
                HStack() {
                    //한 화면에 하나의 URL: .widgetURL
                    //여러 URL: Link
                    Link(destination: URL(string: WidgetLink.news.rawValue)!) {
                        SampleIconView(type: WidgetLink.news, text: "뉴스", mode: entry.mode)
                    }
                    Spacer()
                    Link(destination: URL(string: WidgetLink.shopping.rawValue)!) {
                        SampleIconView(type: WidgetLink.shopping, text: "쇼핑", mode: entry.mode)
                    }
                    Spacer()
                    Link(destination: URL(string: WidgetLink.mail.rawValue)!) {
                        SampleIconView(type: WidgetLink.mail, text: "메일", mode: entry.mode)
                    }
                    Spacer()
                    Link(destination: URL(string: WidgetLink.kin.rawValue)!) {
                        SampleIconView(type: WidgetLink.kin, text: "지식IN", mode: entry.mode)
                    }
                }.padding(.top, 5)
            }
            .padding(.horizontal, 20)
        }
    }
}


struct SampleIconView: View {
    let type: WidgetLink
    let text: String
    let mode: Mode
    
    var body: some View {
        VStack(spacing: 8) {
//            switch type {
//            case .clip:
//                mode == .light ? Image("paperclip.circle") : Image("paperclip.circle.fill")
//            case .message:
//                mode == .light ? Image("message") : Image("message.fill")
//            case .my:
//                mode == .light ? Image("person") : Image("person.fill")
//            case .store:
//                mode == .light ? Image("star") : Image("star.fill")
//            }
            
            Text(text)
                .font(Font.system(size: 12))
                .foregroundColor(setColor(mode: mode))
        }
    }
    
    func setColor(mode: Mode) -> Color {
        switch mode {
        case .light:
            return .black
        case .dark:
            return .white
        case .unknown:
            return .white
        }
    }
}
