//
//  ContentView.swift
//  Calendar_CTR
//
//  Created by 龚敬洋 on 2020/11/18.
//

import SwiftUI

struct LoginView: View {
    var body: some View {
        VStack {
            Text("Now What")
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            Spacer()
            VStack {
                HStack {
                    Text("用户名：")
                        .font(.headline)
                    TextField("Username", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                }
                HStack {
                    Text("密码：")
                        .font(.headline)
                    SecureField("Password", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("Apple")/*@END_MENU_TOKEN@*/)
                }
            }
            Spacer()
            Button(action: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/{}/*@END_MENU_TOKEN@*/) {
                Text("登陆")
                    .font(.title)
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 10.0)
                            .stroke(Color.black, lineWidth: 2.0))
            }
        }.padding().frame(height: 300.0)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
