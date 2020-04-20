//
//  FilmView.swift
//  hw_11
//
//  Created by Dmitry Dementyev on 20.04.2020.
//  Copyright © 2020 Dmitry Dementyev. All rights reserved.
//

import Foundation
import SwiftUI

struct FilmView: View {
    
    @EnvironmentObject private (set) var content: FilmViewModel
    
    var body: some View {
        VStack{
            HStack{
                Text("Title")
                    .frame(width: 100, alignment: .trailing)
                Text(content.title)
                    .frame(width: 200, alignment: .leading)
            }
            HStack{
                Text("Director")
                    .frame(width: 100, alignment: .trailing)
                Text(content.director)
                    .frame(width: 200, alignment: .leading)
            }
            HStack{
                Text("Producer")
                    .frame(width: 100, alignment: .trailing)
                Text(content.producer)
                    .frame(width: 200, alignment: .leading)
            }
            HStack{
                Text("Release date")
                    .frame(width: 100, alignment: .trailing)
                Text(content.releaseDate)
                    .frame(width: 200, alignment: .leading)
            }
            HStack{
                Text("Score")
                    .frame(width: 100, alignment: .trailing)
                Text(content.rtScore)
                    .frame(width: 200, alignment: .leading)
            }
            HStack{
                Text("Description")
                    .frame(width: 100, alignment: .trailing)
                Text(content.filmDescription)
                    .frame(width: 200)
                    .lineLimit(10)
            }
        }
    }
}
