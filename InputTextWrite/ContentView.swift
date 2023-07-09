//
//  ContentView.swift
//  InputTextWrite
//
//  Created by 佐藤来 on 2023/07/04.
//

import SwiftUI

struct ContentView: View {
    @State var text: String = ""
    @State var textState: TextState = .read

    var body: some View {
        TextEditor(text: $text)
            .frame(width: 300, height: 200)     // フレームサイズ指定
            .border(Color.gray.opacity(textState == .edit ? 1 : 0), width: 1)
            .disabled(textState == .read)// フレーム外枠の色と太さ指定

        Button {
            textState.switchState()
        } label: {
            Text(textState.buttonLabel)
        }
    }
}

enum TextState {
    case read
    case edit
    
    var buttonLabel: String {
        return self == .read ? "編集" : "編集完了"
    }
    
    mutating func switchState() {
        if (self == .read) {
            self = .edit
        }
        else {
            self = .read
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
