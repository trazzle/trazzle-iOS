//
//  TrabelRecordCreateView.swift
//  Trazzle
//
//  Created by joomin on 4/29/24.
//

import SwiftUI

struct TrabelRecordCreateView: View {
    @State private var title: String = ""
    @State private var travelRecord: String = ""
    @State private var tripDate = Date()
    
    var body: some View {
        NavigationStack {
            VStack {
                ScrollView(.vertical, showsIndicators: false) {
                    VStack {
                        Text("대한민국 south korea")
                            .padding()
                            .frame(maxWidth: .infinity, alignment: .leading)
                       
                        Image("magnet")
                        
                        Text("서울 (Seoul)")
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        
                        //여행기 타이틀
                        HStack {
                            TextField("이번 여행의 제목을 붙여주세요*", text: $title)
                                .frame(height: 52)
                                .padding(.horizontal)
                            
                            Text("0/20")
                                .padding(.horizontal)
                                .foregroundColor(.g200)
                        }.overlay(RoundedRectangle(cornerRadius: 12).stroke(Color.g100, lineWidth: 1))
                            .padding()
                        
                        VStack {
                            Color.g50
                        }.frame(height:8)
                        
                        
                        //여행기간
                        HStack {
                            Text("여행 기간")
                                .foregroundColor(.g900)
                            Text("*")
                                .foregroundColor(.indigo)
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding([.horizontal, .top])
                        
                        HStack {
                            Text("여행기간을 선택해주세요")
                                .foregroundColor(.g200)
                                .frame(height: 52)
                                .padding(.horizontal)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            
                            Image(systemName: "calendar")
                                      .font(.title3)
                                      .overlay{
                                          
                                          DatePicker(
                                            "",
                                            selection: $tripDate,
                                            in: ...Date.now,
                                            displayedComponents: [.date]
                                          )
                                          .blendMode(.destinationOver)
                                      }
                                      .padding()
                                      .foregroundColor(.g500)
                            
                        }.overlay(RoundedRectangle(cornerRadius: 12).stroke(Color.g100, lineWidth: 1))
                            .padding(.horizontal)
                            
                        
                        //여행기
                        HStack {
                            Text("여행기")
                                .foregroundColor(.g900)
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding([.horizontal, .top])
                        
                        VStack {
                            TextField("이번 여행에 대한 감상을 적어 주세요.", text: $travelRecord, axis: .vertical)
                                .frame(height: 52)
                                .padding(.horizontal)
                            
                            Text("0/280")
                                .padding()
                                .foregroundColor(.g200)
                                .frame(width: .infinity, alignment: .trailing)
                            
                        }.overlay(RoundedRectangle(cornerRadius: 12).stroke(Color.g100, lineWidth: 1))
                            .padding(.horizontal)
                        
                    }
                }
                
            }
        }.navigationBarTitle("여행 기록", displayMode: .large)
    }
}

#Preview {
    TrabelRecordCreateView()
}
