//
//  BoringNotchPluginSDK.swift
//  BoringNotchPluginSDK
//
//  Created by Alexander Greco on 2025-04-05.
//

import Foundation
import AppKit

protocol MediaControllerProtocol: ObservableObject {
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

struct PlaybackState {
    var bundleIdentifier: String
    var isPlaying: Bool = false
    var title: String = "I'm Handsome"
    var artist: String = "Me"
    var album: String = "Self Love"
    var currentTime: Double = 0
    var duration: Double = 0
    var playbackRate: Double = 1
    var isShuffled: Bool = false
    var isRepeating: Bool = false
    var lastUpdated: Date = Date.distantPast
    var artwork: Data?
}

