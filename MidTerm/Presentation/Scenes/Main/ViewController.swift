//
//  ViewController.swift
//  MidTerm
//
//  Created by Baxva Jakeli on 10.06.21.
//

import AVFoundation
import UIKit

class ViewController: UIViewController {
    
    var backgroundMusic: AVAudioPlayer?
    
    @IBOutlet weak var mainImg: UIImageView!
    @IBOutlet weak var newGameBtn: bakhvaButton!
    @IBOutlet weak var HighScoreBtn: bakhvaButton!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
            self.musicStart()
        })
        mainImg.rotate()
        changeBackgroundColors()
        
    }
        
    @IBAction func rulesBrn(_ sender: Any) {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "Rules") as! RulesViewController
        navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func newGameAct(_ sender: Any) {
        if let backgroundMusic = backgroundMusic, backgroundMusic.isPlaying {
            backgroundMusic.stop()
        }
        let transition: CATransition = CATransition()
            transition.duration = 0.4
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        transition.type = CATransitionType.fade
        self.navigationController!.view.layer.add(transition, forKey: nil)
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "Progress") as! ProgressViewController
        navigationController?.pushViewController(vc, animated: false)
    }
    
}

extension ViewController {
    func musicStart() {
        
        let musicURL = Bundle.main.path(forResource: "Who Wants To Be A Millionaire Full Theme", ofType: "mp3")
        
        do {
            try AVAudioSession.sharedInstance().setMode(.default)
            try AVAudioSession.sharedInstance().setActive(true, options: .notifyOthersOnDeactivation)
            guard let musicURL = musicURL else { return }
            backgroundMusic = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: musicURL))
            guard let backgroundMusic = backgroundMusic else {return}
            backgroundMusic.play()
        }
        catch  {
            print("error")
        }
    }
}



