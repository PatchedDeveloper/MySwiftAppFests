//
//  ContentView.swift
//  feast
//
//  Created by Данила Кардашевский on 05.11.2022.
//

import SwiftUI

 var summ : Double = 0
 var summary : Double = 0
struct ContentView: View {
    @State private var entersum = ""
    @State private var people  = 0
    @State private var procent: Double = 0
    @State private var showditail = false // NewView
    
    var body: some View {
        VStack{
            Image("logo")
            .padding()
    VStack{
               Text("Введите выставленный счёт")
                    .padding()
                    .font(.title.smallCaps())
                    .lineLimit(1)
                    .foregroundColor(.white)
                TextField("Сумма",text:$entersum)
                    .padding()
                    .padding(.horizontal,30)
                    .font(.title2.bold())
                    .background(Color("textfield"))
                    .cornerRadius(5)
                    .padding(8)
                    .padding(.horizontal,12)
                    .padding(.bottom,1)
                    .foregroundColor(.white)
                 
                Text("Сколько чаевых хотите оставить?")
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                     .padding()
                     .font(.subheadline.bold())
                     .lineLimit(1)
                     .foregroundColor(.white)
                
                
        HStack{
            //0
            Button {
                
                if (procent == 0){
                    procent = 0
                }
                else{
                    procent = 0
                    procent = 0
                }
                       
                          }
                    label: {
                       Text("0%")
                       .padding()
                       .background(Color("textfield"))
                       .cornerRadius(3)
                       .padding(.horizontal,12)
                       .foregroundColor(.white)
                       }
            //10
            Button {
                if (procent == 0){
                    procent = 0.10
                }
                else{
                    procent = 0
                    procent = 0.10
                }
                          }
                    label: {
                        Text("10%")
                        .padding()
                        .background(Color("textfield"))
                        .cornerRadius(3)
                        .padding(.horizontal,12)
                        .foregroundColor(.white)
                       }
            //50
             Button {
                 if (procent == 0){
                     procent = 0.50
                 }
                 else{
                     procent = 0
                     procent = 0.50
                 }
                          }
                    label: {
                        Text("50%")
                        .padding()
                        .background(Color("textfield"))
                        .cornerRadius(3)
                        .padding(.horizontal,12)
                        .foregroundColor(.white)
                       }
            //100
            Button {
                if (procent == 0){
                    procent = 1
                }
                else{
                    procent = 0
                    procent = 1
                }
            
                
                
                          }
                    label: {
                        Text("100%")
                        .padding()
                        .background(Color("textfield"))
                        .cornerRadius(3)
                        .padding(.horizontal,12)
                        .foregroundColor(.white)
                       }
                }
        Text("Сколько вас человек?")
            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
             .padding()
             .font(.subheadline.bold())
             .lineLimit(1)
             .foregroundColor(.white)
        HStack{
            Text(String(people))
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                 .padding()
                 .font(.title)
                 .lineLimit(1)
                 .foregroundColor(.white)
            VStack{
                //+
                Button {
                        people+=1
   }
                        label: {
                           Text("+")
                           .padding()
                           .background(Color("textfield"))
                           .cornerRadius(3)
                           
                           .foregroundColor(.white)
                           }
                Button {
                    if (people>0){
                        people-=1
                    }
                           
                              }
                        label: {
                           Text("-")
                           .padding()
                           .background(Color("textfield"))
                           .cornerRadius(3)
                           .foregroundColor(.white)
                           .padding(.bottom,10)
                           }
                
            }
            
        }
        
        
        
        

            }
            .background(Color("background2"))
            .cornerRadius(20)
    
    Button {
        
        if((people != 0) && (entersum != "")){
            let entersumconvert = Double(entersum)
            let peoples = Double(people)
            let allsumm = (entersumconvert! + (entersumconvert! * procent))
            summary = (entersumconvert! * procent)
            
            summ = allsumm / peoples
            
            self.showditail.toggle()
        }
        else{
            summ = 0
            self.showditail.toggle()
        }
                  }
            label: {
               Text("Рассчитать")
               .padding()
               .background(Color("textfield"))
               .cornerRadius(3)
               .foregroundColor(.white)
               .padding(.top)
               
               }
            .sheet(isPresented: $showditail){
                DetailView()
            }
    
    
    
    
                
        }
        .frame(maxWidth: .infinity,maxHeight: .infinity)
            .ignoresSafeArea()
            .background(Color("background"))
    }
}

struct DetailView : View{
    @Environment (\.presentationMode) var presentationMode
    var body:  some  View{
        VStack{
            Image("logo")
            .padding()
            Text("Каждый из вас должен оплатить:")
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                 .padding()
                 .font(.subheadline.bold())
                 .lineLimit(1)
                 .foregroundColor(.white)
            
            Text(String(Int(summ)) + " ₽")
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                 .padding()
                 .font(.subheadline.bold())
                 .lineLimit(1)
                 .foregroundColor(.white)
            //--------------
            Text("Вы оставили чаевых:")
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                 .padding()
                 .font(.subheadline.bold())
                 .lineLimit(1)
                 .foregroundColor(.white)
            Text(String(Int(summary)) + " ₽")
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                 .padding()
                 .font(.subheadline.bold())
                 .lineLimit(1)
                 .foregroundColor(.white)
            
            
            Button {
                self.presentationMode.wrappedValue.dismiss()
            } label: {
                Text("Назад")
                    .padding()
                    .background(Color("textfield"))
                    .cornerRadius(3)
                    .foregroundColor(.white)
                    .padding(.top)
            }
            
            
            
        }
        .frame(maxWidth: .infinity,maxHeight: .infinity)
            .ignoresSafeArea()
            .background(Color("background"))
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        
    }
}
