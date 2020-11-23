//
//  LoginView.swift
//  Calendar_CTR
//
//  Created by GONGGONGJOHN on 2020/11/18.
//

import SwiftUI

struct LoginView: View {
    @State private var server: String = ""
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var isLoginSuccess: Bool = false
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Now What")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                Spacer()
                VStack {
                    HStack {
                        Text("服务器地址：")
                            .font(.headline)
                        TextField("Server IP", text: $server)
                    }
                    Divider()
                    HStack {
                        Text("用户名：")
                            .font(.headline)
                        TextField("Username", text: $username)
                    }
                    Divider()
                    HStack {
                        Text("密码：")
                            .font(.headline)
                        SecureField("Password", text: $password)
                    }
                    Divider()
                }
                Spacer()
                NavigationLink(destination: PhotoAnalysisView(), isActive: self.$isLoginSuccess) {
                        Text("登陆")
                            .onTapGesture {
                                //if(login(server: self.server, username: self.username, password: self.password)){
                                    self.isLoginSuccess = true
                                //}
                            }
                            .font(.title)
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 10.0)
                            .stroke(Color.black, lineWidth: 2.0)) }
            }.padding().frame(height: 300.0)
        }
    }
}

func login(server: String, username: String, password: String) -> Bool{
    let url_string: String = server + "?username=" + username + "&password=" + password
    let url: URL = URL(string: url_string)!
    let request: URLRequest = URLRequest(url: url)
    let session: URLSession = URLSession.shared
    var result = false
    var dataTask: URLSessionDataTask = session.dataTask(with: request){ (data, response, error) in
        if(error == nil){
            var dict: Dictionary = [String: String]()
            do{
                dict = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as! Dictionary
            } catch{
                
            }
            if(dict["result"] == "successful"){
                result = true
            }
        }
    }
    return result
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
