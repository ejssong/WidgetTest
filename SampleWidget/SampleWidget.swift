//
//  SampleWidget.swift
//  SampleWidget
//
//  Created by ejsong on 2023/02/09.
//

import WidgetKit
import SwiftUI
import Intents

struct Provider: IntentTimelineProvider {
    
    func mode(for config: ConfigurationIntent) -> Mode {
        switch config.Mode {
        case .dark:
            return .dark
        case .light:
            return .light
        case .unknown:
            return .light
        }
    }
    // 데이터를 불러오기 전 (getSnapshot)에 보여줄 palceHolder
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), configuration: ConfigurationIntent(), mode: Mode.light, nickName: "--")
    }
    
    // 위젯 갤러리에서 샘플 데이터 보여줄때 해당 메소드 호출
    // API 통해서 데이터 fetch하여 보여줄때 딜레이가 있는 경우 샘플 데이터 하드코딩해서 보여주는 것도 가능
    func getSnapshot(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        
        
//        WidgetManager.shared.getNickName(memNo: "", completion: { data in
//
//        })
        
        let entry = SimpleEntry(date: Date(), configuration: configuration, mode: mode(for: configuration), nickName: "닉네임")
        completion(entry)
    }
    
    // 홈화면에 있는 위젯을 언제 업데이트 시킬 것 인지 구현 하는 부분
    func getTimeline(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (Timeline<SimpleEntry>) -> ()) {
        
//        WidgetManager.shared.getNickName(memNo: "", completion: { data in
//
//        })
        let entries = [SimpleEntry(date: Date(), configuration: configuration, mode: mode(for: configuration), nickName: "닉네임")]
        let timeline = Timeline(entries: entries, policy: .never)
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let configuration: ConfigurationIntent
    let mode: Mode
    let nickName: String
}

struct SampleWidgetEntryView : View {
    @Environment(\.widgetFamily) var family: WidgetFamily
    var entry: Provider.Entry

    @ViewBuilder
    var body: some View {
        switch family {
        case .systemMedium:
            SampleWidgetMedium(entry: entry)
        default:
            SampleWidgetMedium(entry: entry)
        }
    }
}

@main
struct SampleWidget: Widget {
    let kind: String = "SampleWidget"

    var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: ConfigurationIntent.self, provider: Provider()) { entry in
            SampleWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("위젯 테스트")
        .description("위젯 테스트 입니다.")
        .supportedFamilies([.systemMedium])
    }
}

struct SampleWidget_Previews: PreviewProvider {
    static var previews: some View {
        SampleWidgetEntryView(entry: SimpleEntry(date: Date(), configuration: ConfigurationIntent(), mode: .light, nickName: "--"))
            .previewContext(WidgetPreviewContext(family: .systemMedium))
    }
}
