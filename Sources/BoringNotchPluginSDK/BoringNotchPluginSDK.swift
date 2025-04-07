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
    public var isPlaying: Bool = false
    public var title: String = "I'm Handsome"
    public var artist: String = "Me"
    public var album: String = "Self Love"
    public var currentTime: Double = 0
    public var duration: Double = 0
    public var playbackRate: Double = 1
    public var isShuffled: Bool = false
    public var isRepeating: Bool = false
    public var lastUpdated: Date = Date.distantPast
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

