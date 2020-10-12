//
//  ContentView.swift
//  MyProject
//
//  Created by User on 12.10.2020.
//

import SwiftUI

struct SecondRoute: View {
    var body: some View{
        NavigationView{
            Text("YOu at 2 route!")
        }.navigationBarTitle("2st Route")
    }
}

struct ContentView: View {
    
    @State var showAlert = false
    @State var alertText = ""
    @State private var inputText = ""
    @State private var currentRoute: String? = nil
    
    func ShowAlert(text: String) -> Int {
        self.alertText = text
        self.showAlert = true
        return inputText.count
    }
    
    var body: some View {
       
        NavigationView{
            VStack{
                NavigationLink(destination: SecondRoute(), tag: "Second", selection: $currentRoute) { EmptyView() }
                      
                TextField("Enter some text", text: $inputText)
                    .frame(
                        width: 300,
                        height: 100,
                        alignment: .topLeading
                    )
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                Button(
                    action: {
                        self.currentRoute = "Second"
//                        let test = self.ShowAlert(text: "Any text")
//                        print(test)
                    },
                    label: {
                        Text("Tap Me")
                            .padding(.all, 10.0)
                            .overlay(
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(Color.blue, lineWidth: 2)
                            )
                    }
                )
                
            }.alert(isPresented: $showAlert) {
                Alert(
                    title: Text("Are you sure?"),
                    message: Text(self.inputText)
                )
            }
            .navigationBarTitle("1st Route")
            
            
        }
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            Group {
                ContentView()
                ContentView()
            }
        }
    }
}
