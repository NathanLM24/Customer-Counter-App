//
//  ContentView.swift
//  Store Customer Counter
//
//  Created by Nathan Beckett on 17/04/2021.
//

import SwiftUI

class Haptics {
    static let instance = Haptics()
    
    func notification(type: UINotificationFeedbackGenerator.FeedbackType) {
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(type)
    }
    
    func impact(style: UIImpactFeedbackGenerator.FeedbackStyle) {
        let generator = UIImpactFeedbackGenerator(style: style)
        generator.impactOccurred()
    }
}


struct ContentView: View {
    @ObservedObject var appData: AppData
    @State private var isPresented = false
    var body: some View {
        ZStack {
            if appData.data.count >= appData.data.limit{
                Color.deepRed.ignoresSafeArea()
            }
            VStack{
                    HStack{
                        Button(action: {
                            self.isPresented.toggle()
                        }, label: {
                            Image(systemName: "gearshape")
                                .resizable()
                                .frame(width: 30, height: 30)
                                .padding()
                                .background(Color.gray)
                                .foregroundColor(.white)
                                .cornerRadius(50)
                        })
                        .padding()
                        .sheet(isPresented: $isPresented, content: {
                            SettingsView(appData: .constant(AppData()))
                        })
                        Spacer()
                        Button(action: {
                            self.appData.data.count = 0
                            Haptics.instance.notification(type: .error)
                            Haptics.instance.impact(style: .heavy)
                        }, label: {
                            Image(systemName: "arrow.clockwise.circle")
                                .resizable()
                                .frame(width: 30, height: 30)
                                .padding()
                                .background(Color.orange)
                                .foregroundColor(.white)
                                .cornerRadius(50)
                        }).padding()
                    }.padding()
                    Spacer()
                Text("\(appData.data.count)")
                        .foregroundColor(.primary)
                        .font(.system(size: 150))
                    Spacer()
                    HStack {
                        Button(action: {
                            self.appData.data.count = appData.data.count - 1
                            Haptics.instance.notification(type: .success)
                            Haptics.instance.impact(style: .rigid)
                        }, label: {
                            Image(systemName: "minus.circle")
                                .resizable()
                                .frame(width: 150, height: 150)
                                .padding()
                                .background(Color.red)
                                .foregroundColor(.white)
                                .cornerRadius(50)
                        })
                        Spacer()
                        Button(action: {
                            self.appData.data.count = appData.data.count + 1
                            Haptics.instance.notification(type: .success)
                            Haptics.instance.impact(style: .rigid)
                        }, label: {
                            Image(systemName: "plus.circle")
                                .resizable()
                                .frame(width: 150, height: 150)
                                .padding()
                                .background(Color.green)
                                .foregroundColor(.white)
                                .cornerRadius(50)
                        })
                    }
                    .padding()
            }
        }
        }
    }


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(appData: AppData())
    }
}
