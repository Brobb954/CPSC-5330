//
//  ViewController.swift
//  module4
//
//  Created by Brandon Robb on 2/9/25.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var liveClockLabel: UILabel!
    @IBOutlet weak var countdownLabel: UILabel!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var actionButton: UIButton!
    @IBOutlet weak var backgroundImageView: UIImageView!
    
    var clockTimer: Timer?
    var countdownTimer: Timer?
    var remainingSeconds: Int = 0
    var audioPlayer: AVAudioPlayer?
    var isMusicPlaying: Bool = false

    override func viewDidLoad() {
        super.viewDidLoad()
        clockTimer = Timer.scheduledTimer(timeInterval: 1.0, target: self,
                                          selector: #selector(updateLiveClock),
                                          userInfo: nil,
                                          repeats: true)
        
        updateLiveClock()
        
        actionButton.setTitle("Start Timer", for: .normal)
    }
    
    @objc func updateLiveClock() {
        let now = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "EEE, dd MMM yyyy HH:mm:ss"
        liveClockLabel.text = formatter.string(from: now)
        
        // Get the current hour.
        let calendar = Calendar.current
        let hour = calendar.component(.hour, from: now)
        
        let imageName = (hour < 12) ? "dayImage" : "nightImage"
        
        // Set text colors based on the background image.
        if imageName == "dayImage" {
            liveClockLabel.textColor = .black
            countdownLabel.textColor = .black
            actionButton.setTitleColor(.black, for: .normal)
            actionButton.tintColor = .black
            datePicker.overrideUserInterfaceStyle = .light
        } else {
            liveClockLabel.textColor = .white
            countdownLabel.textColor = .white
            actionButton.setTitleColor(.white, for: .normal)
            actionButton.tintColor = .white
            datePicker.overrideUserInterfaceStyle = .dark
        }
        
        // Update the background image directly without checking an identifier.
        if let image = UIImage(named: imageName) {
            backgroundImageView.image = image
        } else {
            print("Image \(imageName) not found!")
        }
    }


    
    @IBAction func actionButtonTapped(_ sender: UIButton) {
        if isMusicPlaying {
            stopMusic()
            actionButton.setTitle("Start Timer", for: .normal)
            datePicker.isEnabled = true
            return
        }
        
        if countdownTimer == nil {
            let interval = Int(datePicker.countDownDuration)
            if interval <= 0 { return }
            remainingSeconds = interval
            datePicker.isEnabled = false
            startCountdown()
            actionButton.setTitle("Cancel Timer", for: .normal)
            datePicker.overrideUserInterfaceStyle = .light
        } else {
            countdownTimer?.invalidate()
            countdownTimer = nil
            countdownLabel.text = "00:00:00"
            datePicker.isEnabled = true
            actionButton.setTitle("Start Timer", for: .normal)
            datePicker.overrideUserInterfaceStyle = .dark
        }
    }

    @objc func countdownTick() {
        remainingSeconds -= 1
        if remainingSeconds <= 0 {
            countdownTimer?.invalidate()
            countdownTimer = nil
            countdownLabel.text = "00:00:00"
            playMusic()
            // Make sure to update isMusicPlaying state when starting music
            isMusicPlaying = true
            actionButton.setTitle("Stop Music", for: .normal)
        } else {
            updateCountdownLabel()
        }
    }
    
    func startCountdown() {
        updateCountdownLabel()
        countdownTimer = Timer.scheduledTimer(timeInterval: 1.0,
                                              target: self,
                                              selector: #selector(countdownTick),
                                            userInfo: nil,
                                            repeats: true)
    }
    
    
    func updateCountdownLabel() {
        let hours = remainingSeconds / 3600
        let minutes = (remainingSeconds % 3600) / 60
        let seconds = remainingSeconds % 60
        countdownLabel.text = String(format: "%02d:%02d:%02d", hours, minutes, seconds)
    }
    

    func playMusic() {
        print("Attempting to play music...")
        guard let soundURL = Bundle.main.url(forResource: "soundByte", withExtension: "mp3") else {
            print("Sound file not found!")
            return }
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: soundURL)
            audioPlayer?.play()
            isMusicPlaying = true
        } catch {
            print("Error plaing sound: \(error)")
        }
    }

    func stopMusic() {
        audioPlayer?.stop()
        isMusicPlaying = false
    }
    
    deinit {
        clockTimer?.invalidate()
        countdownTimer?.invalidate()
    }
}

