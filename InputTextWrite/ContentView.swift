//
//  ContentView.swift
//  InputTextWrite
//
//  Created by 佐藤来 on 2023/07/04.
//

import SwiftUI

struct ContentView: View {
        @State var text: String = ""
    // レビュー: パッと見てなんの判定かわからない
    // レビュー: IMO enumで書いたほうが安全&スマート (judgementとbuttonlabelをenumで書く方法を教える)
    @State var judgement: Bool = true
    // レビュー: buttonLabelじゃない？
    @State var buttonlabel: String = "編集"

    var body: some View {
            // レビュー: 出題の意図しては、TextEditorとTextを条件で切り替えて欲しかった
            TextEditor(text: $text)
                .frame(width: 300, height: 200)     // フレームサイズ指定
                .border(Color.gray, width: 1)
                .disabled(judgement)// フレーム外枠の色と太さ指定
                // レビュー: modifierで装飾できてるのGOOD👍

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
            // レビュー: 状態を判定してここで分岐させたほうが可読性が高くて、完結な気がする
            Text(buttonlabel)
        }

        }
    
    }
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
