//
//  ConnectionIndicatorView.swift
//  ios_reachability
//
//  Created by Don Malte on 16.02.24.
//

import SwiftUI

struct ConnectionIndicatorView: View {
    
    @ObservedObject var viewModel: ConnectionIndicatorViewModel
    
    private let padding: CGFloat = 16
    private let cornerRadius: CGFloat = 20
    
    private var thirdWidth: CGFloat {
        UIScreen.main.bounds.size.width / 3
    }
    
    private var isIpad: Bool {
        UIDevice.current.userInterfaceIdiom == .pad
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: padding) {
            
            HStack(alignment: .top) {
                Image(systemName: viewModel.isConnected ? "wifi" : "wifi.slash")
                    .font(.title)
                .foregroundStyle(viewModel.isConnected ? .green : .red)
                
                Spacer()
                
                Button {
                    withAnimation {
                        viewModel.showBanner = false
                    }
                } label: {
                    Image(systemName: "x.circle")
                        .fontWeight(.light)
                        .foregroundStyle(Color(uiColor: .label))
                }
            }
            
            Text(viewModel.isConnected ? Strings.connectionRestored : Strings.connectionLost)
                .font(.headline)
                .multilineTextAlignment(.leading)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
        .frame(maxWidth: isIpad ? thirdWidth : .infinity)
        .padding(padding)
        .background {
            RoundedRectangle(cornerRadius: cornerRadius)
                .foregroundStyle(Color(uiColor: .systemBackground))
                .shadow(radius: cornerRadius / 2)
        }
        .padding(padding)
    }
}

#Preview {
    ConnectionIndicatorView(viewModel: .init())
}
