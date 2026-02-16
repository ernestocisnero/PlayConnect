//
//  LoopingPlayerView.swift
//  PlayConnect
//
//  Created by Ernesto Cisnero on 2/14/26.
//


import SwiftUI
import AVKit

struct LoopingPlayerView: UIViewRepresentable {
    var videoName: String
    var videoType: String
    
    func makeUIView(context: Context) -> UIView {
        return PlayerUIView(frame: .zero, videoName: videoName, videoType: videoType)
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {}
    
    static func dismantleUIView(_ uiView: UIView, coordinator: ()) {
        (uiView as? PlayerUIView)?.player?.pause()
    }
}

class PlayerUIView: UIView {
    var player: AVPlayer?
    var playerLayer: AVPlayerLayer?
    private var observer: NSObjectProtocol?
    
    init(frame: CGRect, videoName: String, videoType: String) {
        super.init(frame: frame)
        
        guard let url = Bundle.main.url(forResource: videoName, withExtension: videoType) else {
            print("Video file not found: \(videoName).\(videoType)")
            return
        }
        
        player = AVPlayer(url: url)
        guard let player = player else { return }
        
        playerLayer = AVPlayerLayer(player: player)
        guard let playerLayer = playerLayer else { return }
        
        playerLayer.videoGravity = .resizeAspectFill
        layer.addSublayer(playerLayer)
        
        observer = NotificationCenter.default.addObserver(
            forName: .AVPlayerItemDidPlayToEndTime,
            object: player.currentItem,
            queue: .main
        ) { [weak self] _ in
            self?.player?.seek(to: .zero)
            self?.player?.play()
        }
        
        player.play()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        if let observer = observer {
            NotificationCenter.default.removeObserver(observer)
        }
        player?.pause()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        playerLayer?.frame = bounds
    }
}

