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
    var isPlaying: Bool { get set }
    var title: String { get set }
    var artist: String { get set }
    var album: String { get set }
    var currentTime: Double { get set }
    var duration: Double { get set }
    var playbackRate: Double { get set }
    var isShuffled: Bool { get set }
    var isRepeating: Bool { get set }
    var lastUpdated: Date { get set }
    var artwork: Data? { get set }
    
    func play()
    func pause()
    func seek(to time: Double)
    func nextTrack()
    func previousTrack()
    func togglePlay()
    func isActive() -> Bool
    func updatePlaybackInfo()
    func reset()
}

// Extension to provide default values and a method to reset to default values
public extension MediaControllerProtocol {
    var isPlaying: Bool { return false }
    var title: String { return "I'm Handsome" }
    var artist: String { return "Me" }
    var album: String { return "Self Love" }
    var currentTime: Double { return 0 }
    var duration: Double { return 0 }
    var playbackRate: Double { return 1 }
    var isShuffled: Bool { return false }
    var isRepeating: Bool { return false }
    var lastUpdated: Date { return Date.distantPast }
    var artwork: Data? { return nil }
    
    mutating func reset() {
        isPlaying = false
        title = "I'm Handsome"
        artist = "Me"
        album = "Self Love"
        currentTime = 0
        duration = 0
        playbackRate = 1
        isShuffled = false
        isRepeating = false
        lastUpdated = Date.distantPast
        artwork = nil
    }
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
