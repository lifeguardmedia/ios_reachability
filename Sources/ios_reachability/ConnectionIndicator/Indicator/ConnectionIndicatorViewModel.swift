//
//  ConnectionIndicatorViewModel.swift
//  ios_reachability
//
//  Created by Don Malte on 16.02.24.
//

import SwiftUI

class ConnectionIndicatorViewModel: ObservableObject {
    
    @Published var showBanner = false
    @Published var isConnected = true
    
    var reachability: Reachability
    
    init() {
        self.reachability = try! Reachability()

        do {
            try reachability.startNotifier()
        } catch {
            print("Unable to start notifier")
        }
        
        listenToChanges()
    }
    
    private func listenToChanges() {
        reachability.whenReachable = { reachability in
            print("## Reachable")
            self.changeIndicator(isReachable: true)
        }
        
        reachability.whenUnreachable = { _ in
            print("## Not Reachable")
            self.changeIndicator(isReachable: false)
        }
    }
    
    private func changeIndicator(isReachable: Bool) {
        if isReachable {
            DispatchQueue.main.async {
                withAnimation {
                    self.isConnected = true
                }
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                    withAnimation {
                        self.showBanner = false
                    }
                }
            }
        } else {
            DispatchQueue.main.async {
                self.isConnected = false
                
                withAnimation {
                    self.showBanner = true
                }
            }
        }
    }
    
    open func stopListening() {
        reachability.stopNotifier()
    }
}
