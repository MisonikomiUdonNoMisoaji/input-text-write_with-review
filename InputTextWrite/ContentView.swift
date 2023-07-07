//
//  ContentView.swift
//  InputTextWrite
//
//  Created by 佐藤来 on 2023/07/04.
//

import SwiftUI

struct ContentView: View {
        @State var text: String = ""
    @State var judgement: Bool = true
    @State var buttonlabel: String = "編集"

    var body: some View {
            TextEditor(text: $text)
                .frame(width: 300, height: 200)     // フレームサイズ指定
                .border(Color.gray, width: 1)
                .disabled(judgement)// フレーム外枠の色と太さ指定
        Button {
            if (judgement == true) {
                judgement = false
                buttonlabel = "編集完了"
            }
            else {
                judgement = true
                buttonlabel = "編集"
            }
            
        } label: {
            Text(buttonlabel)
        }

        }
    
    }
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
