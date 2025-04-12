//
//  BoringNotchPluginSDK.swift
//  BoringNotchPluginSDK
//
//  Created by Alexander Greco on 2025-04-05.
//

import Foundation
import Combine

// Core media controller protocol
public protocol MediaControllerProtocol {
    var bundleIdentifier: String { get }
    var isPlaying: Bool { get }
    var title: String { get }
    var artist: String { get }
    var album: String { get }
    var currentTime: Double { get }
    var duration: Double { get }
    var playbackRate: Double { get }
    var isShuffled: Bool { get }
    var isRepeating: Bool { get }
    var lastUpdated: Date { get }
    var artwork: Data? { get }
    
    func play()
    func pause()
    func seek(to time: Double)
    func nextTrack()
    func previousTrack()
    func togglePlay()
    func isActive() -> Bool
    func updatePlaybackInfo()
}

// Plugin definition protocol
public protocol MediaControllerPlugin {
    var metadata: PluginMetadata { get }
    func createMediaController() -> any MediaControllerProtocol
}

// Plugin metadata structure
public struct PluginMetadata: Codable, Identifiable, Equatable {
    public let id: String
    public let name: String
    public let version: String
    public let author: String
    public let description: String
    public let minSDKVersion: String
    
    public init(id: String, name: String, version: String, author: String, description: String, minSDKVersion: String) {
        self.id = id
        self.name = name
        self.version = version
        self.author = author
        self.description = description
        self.minSDKVersion = minSDKVersion
    }
    
    public static func == (lhs: PluginMetadata, rhs: PluginMetadata) -> Bool {
        return lhs.id == rhs.id
    }
}

open class PluginFactory {
    
    public init() {}

    open func createMediaControllerPlugin() -> MediaControllerPlugin {
        fatalError("You have to override this method.")
    }
}
