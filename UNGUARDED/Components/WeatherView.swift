//
//  WeatherView.swift
//  UNGUARDED
//
//  Created by Salman Hasan on 11/14/23.
//

import SwiftUI

struct WeatherView: View {
      @StateObject var locationManager = LocationManager()
      var weatherManager = WeatherManager()
      @State var weather: ResponseBody?
      
      var body: some View {
          VStack {
              if let location = locationManager.location {
                  if let weather = weather {
                      TempetureView(weather:weather)
                  } else {
                      LoadingView()
                          .task {
                              do {
                                  weather = try await weatherManager.getCurrentWeather(latitude: location.latitude, longitude: location.longitude)
                              } catch {
                                  print("Error getting weather: \(error)")
                              }
                          }
                  }
              } else {
                  if locationManager.isLoading {
                      LoadingView()
                  } else {
                      WelcomeView()
                          .environmentObject(locationManager)
                  }
              }
          }
          .background(Color.black)
          .preferredColorScheme(.dark)
      }
  }


struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView()
    }
}
            
