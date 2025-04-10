//
//  BoringNotchPluginSDK.swift
//  BoringNotchPluginSDK
//
//  Created by Alexander Greco on 2025-04-05.
//

import Foundation
import Combine

// Core media controller protocol
public protocol MediaControllerProtocol: ObservableObject {
    var playbackStatePublisher: Published<PlaybackState>.Publisher { get }
    func play()
    func pause()
    func seek(to time: Double)
    func nextTrack()
    func previousTrack()
    func togglePlay()
    func isActive() -> Bool
    func updatePlaybackInfo()
}

//Playback state model
public struct PlaybackState {
    public var bundleIdentifier: String
    public var isPlaying: Bool
    public var title: String
    public var artist: String
    public var album: String
    public var currentTime: Double
    public var duration: Double
    public var playbackRate: Double
    public var isShuffled: Bool
    public var isRepeating: Bool
    public var lastUpdated: Date
    public var artwork: Data?
    
    public init(bundleIdentifier: String, isPlaying: Bool = false, title: String = "I'm Handsome", artist: String = "Me", album: String = "Self Love", currentTime: Double = 0, duration: Double = 0, playbackRate: Double = 1, isShuffled: Bool = false, isRepeating: Bool = false, lastUpdated: Date = Date.distantPast, artwork: Data? = nil) {
        self.bundleIdentifier = bundleIdentifier
        self.isPlaying = isPlaying
        self.title = title
        self.artist = artist
        self.album = album
        self.currentTime = currentTime
        self.duration = duration
        self.playbackRate = playbackRate
        self.isShuffled = isShuffled
        self.isRepeating = isRepeating
        self.lastUpdated = lastUpdated
        self.artwork = artwork
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
