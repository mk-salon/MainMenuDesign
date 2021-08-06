//
//  ContentView.swift
//  MainMenuDesign
//
//  Created by Mac on 05.08.2021.
//

import SwiftUI

struct ContentView: View {
    
    @State var index = 0
    @State var show = false
    
    var body: some View {
        
        ZStack {
            
            HStack {
                VStack(alignment: .leading, spacing: 12) {
                    Image("avatar")
                        .clipShape(Circle())
                    Text("Hello, ")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.top, 10)
                    Text("Andrii")
                        .fontWeight(.bold)
                        .font(.title)
                        .foregroundColor(.white)
                    Button(action: {
                        self.index = 0
                        
                        withAnimation {
                            self.show.toggle()
                        }
                    }) {
                        HStack(spacing: 25) {
                            Image(systemName: "bag")
                                .foregroundColor(self.index == 0 ? Color("Color1") : Color.white)
                            
                            Text("Catalogue")
                                .foregroundColor(self.index == 0 ? Color("Color1") : Color.white)
                        }
                        .padding(.vertical, 10)
                        .padding(.horizontal)
                        .background(self.index == 0 ? Color("Color1").opacity(0.2) : Color.clear)
                        .cornerRadius(10)
                    }
                    .padding(.top, 25)
                    
                    Button(action: {
                        self.index = 1
                        
                        withAnimation {
                            self.show.toggle()
                        }
                        
                    }) {
                        HStack(spacing: 25) {
                            Image(systemName: "cart")
                                .foregroundColor(self.index == 1 ? Color("Color1") : Color.white)
                            
                            Text("Basket")
                                .foregroundColor(self.index == 1 ? Color("Color1") : Color.white)
                        }
                        .padding(.vertical, 10)
                        .padding(.horizontal)
                        .background(self.index == 1 ? Color("Color1").opacity(0.2) : Color.clear)
                        .cornerRadius(10)
                    }
                    
                    Button(action: {
                        self.index = 2
                        
                        withAnimation {
                            self.show.toggle()
                        }
                    }) {
                        HStack(spacing: 25) {
                            Image(systemName: "heart")
                                .foregroundColor(self.index == 2 ? Color("Color1") : Color.white)
                            
                            Text("Favorite")
                                .foregroundColor(self.index == 2 ? Color("Color1") : Color.white)
                        }
                        .padding(.vertical, 10)
                        .padding(.horizontal)
                        .background(self.index == 2 ? Color("Color1").opacity(0.2) : Color.clear)
                        .cornerRadius(10)
                    }
                    
                    Button(action: {
                        self.index = 3
                        
                        withAnimation {
                            self.show.toggle()
                        }
                    }) {
                        HStack(spacing: 25) {
                            Image(systemName: "bag.badge.plus")
                                .foregroundColor(self.index == 3 ? Color("Color1") : Color.white)
                           
                            Text("My orders")
                                .foregroundColor(self.index == 3 ? Color("Color1") : Color.white)
                        }
                        .padding(.vertical, 10)
                        .padding(.horizontal)
                        .background(self.index == 3 ? Color("Color1").opacity(0.2) : Color.clear)
                        .cornerRadius(10)
                    }
                    
                    Divider()
                        .frame(width: 150, height: 1)
                        .background(Color.white)
                        .padding(.vertical, 30)
                    
                    Button(action: {
                        //
                    }) {
                        HStack(spacing: 25) {
                            Image(systemName: "arrowtriangle.right.circle")
                                .foregroundColor(Color.white)
                            
                            Text("Exit")
                                .foregroundColor(Color.white)
                        }
                        .padding(.vertical, 10)
                        .padding(.horizontal)
                    }
                    
                    Spacer(minLength: 0)
                    
                }
                .padding(.top, 25)
                .padding(.horizontal, 20)
                
                Spacer(minLength: 0)
            }
            .padding(.top,UIApplication.shared.windows.first?.safeAreaInsets.top)
            .padding(.bottom,UIApplication.shared.windows.first?.safeAreaInsets.bottom)
            
            VStack(spacing: 0){
                
                HStack(spacing: 15){
                    
                    Button(action: {
                        
                        withAnimation{
                            
                            self.show.toggle()
                        }
                        
                    }) {
                        
                        Image(systemName: self.show ? "xmark" : "line.horizontal.3")
                            .resizable()
                            .frame(width: self.show ? 18 : 22, height: 18)
                            .foregroundColor(Color.black.opacity(0.4))
                            
                    }
                    Text(self.index == 0 ? "Catalogue" : (self.index == 1 ? "Basket" : (self.index == 2 ? "Favorite" : "My orders")))
                        .font(.title)
                        .foregroundColor(Color.black.opacity(0.6))
                       
                    
                    Spacer(minLength: 0)
                }
                .padding(.top,UIApplication.shared.windows.first?.safeAreaInsets.top)
                .padding()
                
                GeometryReader {_ in
                    VStack {
                        if self.index == 0 {
                            Catalogue()
                        }
                        else if self.index == 1 {
                            Cart()
                        }
                        else if self.index == 2 {
                            Fav()
                        } else {
                            Orders()
                        }
                    }
                } .padding(.vertical, 300)
                .padding(.horizontal, 150)
            }
            .background(Color.white)
            .cornerRadius(self.show ? 30 : 0)
            .scaleEffect(self.show ? 0.9 : 1)
            .offset(x: self.show ? UIScreen.main.bounds.width / 2 : 0, y: self.show ? 15 : 0)
            .rotationEffect(.init(degrees: self.show ? -5 : 0))
        }
        .background(Color("Color").edgesIgnoringSafeArea(.all))
        .edgesIgnoringSafeArea(.all)
    }
}

struct Catalogue: View {
    var body: some View {
        VStack {
            Text("Catalogue")
        }
    }
}

struct Cart: View {
    var body: some View {
        VStack {
            Text("Basket")
        }
    }
}

struct Orders: View {
    var body: some View {
        VStack {
            Text("My orders")
        }
    }
}

struct Fav: View {
    var body: some View {
        VStack {
            Text("Favorite")
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
