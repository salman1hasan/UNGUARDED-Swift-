//
//  TempetureView.swift
//  UNGUARDED
//
//  Created by Salman Hasan on 11/14/23.
//

import SwiftUI

struct TempetureView: View {
    var weather: ResponseBody
        
        var body: some View {
           
            ZStack(alignment: .leading) {
                VStack {
                    NavigationLink(destination: WeatherView().navigationBarBackButtonHidden(true), label:{
                        Image("UNGUARDED")
                            .resizable()
                            .aspectRatio(contentMode:.fit)
                            .cornerRadius(8)
                            .frame(width: 60, height: 60)
                    })
                    VStack(alignment: .leading, spacing: 5) {
                       
                    
                        Text(weather.name)
                            .bold()
                            .font(.title)
                        
                        
                        
                        Text("Today, \(Date().formatted(.dateTime.month().day().hour().minute()))")
                            .fontWeight(.light)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Spacer()
                    
                    VStack {
                        HStack {
                            VStack(spacing: 20) {
                                Text("\(weather.weather[0].main)")
                            }
                            .frame(width: 150, alignment: .leading)
                            
                            Spacer()
                            
                            Text(weather.main.feelsLike.roundDouble() + "°")
                                .font(.system(size: 60))
                                .padding()
                        }
                        
                        Spacer()
                            .frame(height:  50)
                        
                       
            
                        Spacer()
                    }
                    .frame(maxWidth: .infinity, alignment: .trailing)
                }
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                
                VStack {
                    Spacer()
                    VStack(alignment: .leading, spacing: 20) {
                        Text("Weather now")
                            .padding(.bottom)
                        
                        HStack {
                            WeatherRow(logo: "thermometer", name: "Min temp", value: (weather.main.tempMin.roundDouble() + ("°")))
                            Spacer()
                            WeatherRow(logo: "thermometer", name: "Max temp", value: (weather.main.tempMax.roundDouble() + "°"))
                        }
                        
                        HStack {
                            WeatherRow(logo: "wind", name: "Wind speed", value: (weather.wind.speed.roundDouble() + " m/s"))
                            Spacer()
                            WeatherRow(logo: "humidity", name: "Humidity", value: "\(weather.main.humidity.roundDouble())%")
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                    .padding(.bottom, 20)
                    .foregroundColor(Color.black)
                    .background(Color(red: 0.953, green:0.678 , blue:0.212 ))
                    .cornerRadius(20, corners: [.topLeft, .topRight])
                }
            }
            .edgesIgnoringSafeArea(.bottom)
            .background(Color.black)
            .preferredColorScheme(.dark)
        }
    }
struct TempetureView_Previews: PreviewProvider{
    static var previews: some View{
        TempetureView(weather:previewWeather)
    }
}

