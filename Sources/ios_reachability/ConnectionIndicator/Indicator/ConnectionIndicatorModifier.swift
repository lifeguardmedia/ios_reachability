//
//  ConnectionIndicatorModifier.swift
//  ios_reachability
//
//  Created by Don Malte on 17.02.24.
//

import SwiftUI

struct ConnectionIndicatorModifier: ViewModifier {
    
   @ObservedObject private var viewModel = ConnectionIndicatorViewModel()
    
    func body(content: Content) -> some View {
        ZStack {
            content
            
            if viewModel.showBanner {
                ConnectionIndicatorView(viewModel: viewModel)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
            }
        }
    }
}

public extension View {
    func connectionIndicator() -> some View {
        modifier(ConnectionIndicatorModifier())
    }
}
