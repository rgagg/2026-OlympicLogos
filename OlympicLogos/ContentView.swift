//
//  ContentView.swift
//  OlympicLogos
//
//  Created by Richard Gagg on 5/2/2026.
//

import SwiftUI

struct ContentView: View {

  @State private var logoNumber: Int = 22
  
  private let logos: [String] = [
    "1924-Paris-France.jpg",
    "1932-los-angeles-usa.jpg",
    "1936-berlin-germany.png",
    "1948-london-england.jpg",
    "1952-helsinki-finland.jpg",
    "1956-melbourne-australia.jpg",
    "1960-rome-italy.jpg",
    "1964-tokyo-japan.jpg",
    "1968-mexico-city-mexico.jpg",
    "1972-munich-germany.png",
    "1976-montreal-canada.jpg",
    "1980-moscow-russia.jpg",
    "1984-los-angeles-usa.jpg",
    "1988-seoul-south-korea.jpg",
    "1992-barcelona-spain.jpg",
    "1996-atlanta-usa.jpg",
    "2000-sydney-australia.jpg",
    "2004-athens-greece.png",
    "2008-beijing-china.jpg",
    "2012-london-england.jpg",
    "2016-rio-brazil.jpg",
    "2020-tokyo-japan.jpeg",
    "2024-paris-france.png",
    "2028-los-angeles-usa.png",
    "2032-brisbane-australia"
  ]
  
  var body: some View {
    VStack {
      Text("Olympic Logos")
        .font(.largeTitle)
        .fontWeight(.black)
      
      Spacer()
      
      Image(getImageName(logoName: logos[logoNumber]))
        .resizable()
        .scaledToFit()
        .padding(.horizontal, 10)
      Spacer()
      
      Group {
        Text("\(getCity(logoName: logos[logoNumber])), \(getCountry(logoName: logos[logoNumber]))")
        Text("\(getYear(logoName: logos[logoNumber]))")
      }
      .font(.largeTitle)
      .fontWeight(.thin)
      
      HStack {
        Button { // Left button
          logoNumber -= 1
        } label: {
          Image(systemName: "chevron.left.to.line")
        }
        .disabled(logoNumber == 0)

        Spacer()
        
        Button { // Right button
          logoNumber += 1
        } label: {
          Image(systemName: "chevron.right.to.line")
        }
        .disabled(logoNumber == logos.count - 1)
        
      }
      .font(.largeTitle)
      .fontWeight(.black)
      .tint(.black)
      .padding()
    }
  }
  
  //MARK: Functions
  
  func getImageName(logoName: String) -> String {
    // 3 extensions" .png, .jpg, .jpeg
    
    var newLogoName = logoName.replacingOccurrences(of: ".png", with: "")
    newLogoName = newLogoName.replacingOccurrences(of: ".jpg", with: "")
    newLogoName = newLogoName.replacingOccurrences(of: ".jpeg", with: "")

    return newLogoName
  }

  func getYear(logoName: String) -> String {
    
    var componantsArray = logoName.components(separatedBy: "-")
    return componantsArray[0]
  }

  func getCity(logoName: String) -> String {
    
    var componantsArray = logoName.components(separatedBy: "-")
    componantsArray.removeFirst()
    componantsArray.removeLast()
    
    var city = componantsArray.joined(separator: " ")
    return city.capitalized
  }
  
  func getCountry(logoName: String) -> String {
    
    var componantsArray = logoName.components(separatedBy: "-")
    var country = getImageName(logoName: componantsArray.last ?? "")
    
    if country.lowercased() == "usa" {
      country = country.uppercased()
    } else {
      country = country.capitalized
    }
    return country
  }

}



#Preview("Light Mode") {
  ContentView()
    .preferredColorScheme(.light)
}

#Preview("Dark Mode") {
  ContentView()
    .preferredColorScheme(.dark)
}
