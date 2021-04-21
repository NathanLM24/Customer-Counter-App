//
//  SettingsView.swift
//  Store Customer Counter
//
//  Created by Nathan Beckett on 19/04/2021.
//

import SwiftUI

struct SettingsView: View {
    @Binding var appData: AppData
    @Environment(\.presentationMode) var presentation
    var body: some View {
        VStack{
            Picker(selection: $appData.data.newLimit,
                   label: Text("Set a maximum number of customers"),
                   content: {
                    ForEach(0..<1000) { number in
                        Text("\(number)")
                    }
                   })
            Button(action: {
                appData.data.newLimit = appData.data.limit
                print(appData.data.newLimit)
                print(appData.data.limit)
                self.presentation.wrappedValue.dismiss()
            }, label: {
                Text("Set limit")
            })
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView(appData: .constant(AppData()))
    }
}
