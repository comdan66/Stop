//
//  ViewController.swift
//  Stop
//
//  Created by 吳政賢 on 2019/8/15.
//  Copyright © 2019 ioa.tw. All rights reserved.
//

import UIKit
import OAKit
import MediaPlayer
import AVFoundation


class ViewController: UIViewController {

    private let str: UILabel = UILabel()
    private var top3Y: NSLayoutConstraint! = nil
    private var tlX: NSLayoutConstraint! = nil
    private var tlY: NSLayoutConstraint! = nil
    private var trX: NSLayoutConstraint! = nil
    private var trY: NSLayoutConstraint! = nil
    private var size: CGFloat! = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = rgba(250, 245, 239, 1.00)
        
        
        let size = min(UIScreen.main.bounds.size.width, UIScreen.main.bounds.size.height) - 100
        
        let circle = UIView()
        
        circle.layer.cornerRadius = CGFloat(size / 2)
        
        circle.to(self.view).centerX().enable()
        circle.to(self.view).centerY().enable()
        circle.to(self.view).width(size).enable()
        circle.to(self.view).height(size).enable()
        circle.backgroundColor = rgba(207, 69, 92, 1.00)
        circle.shadow(1, 1, 4, rgba(0, 0, 0, 0.3))
        
        let tl = UIView()
        tl.backgroundColor = rgba(249, 210, 118, 1.00)
        tl.layer.cornerRadius = CGFloat(size / 2 / 2 / 1.5)
        tl.to(self.view).width(size / 7 * 3).enable()
        tl.to(self.view).height(size / 2 / 2).enable()
        self.tlX = tl.to(self.view).centerX(Double( (size / 2 - 10)) * sin(-45 * Double.pi / 180)).eq(circle).enable()
        self.tlY = tl.to(self.view).centerY(Double(-(size / 2 - 10)) * cos(-45 * Double.pi / 180)).eq(circle).enable()
        tl.transform = CGAffineTransform(rotationAngle: CGFloat(-45 / 180.0 * .pi))

        let tr = UIView()
        tr.backgroundColor = rgba(249, 210, 118, 1.00)
        tr.layer.cornerRadius = CGFloat(size / 2 / 2 / 1.3)
        tr.to(self.view).width(size / 7 * 3).enable()
        tr.to(self.view).height(size / 2 / 2).enable()
        self.trX = tr.to(self.view).centerX(Double( (size / 2 - 10)) * sin(45 * Double.pi / 180)).eq(circle).enable()
        self.trY = tr.to(self.view).centerY(Double(-(size / 2 - 10)) * cos(45 * Double.pi / 180)).eq(circle).enable()
        tr.transform = CGAffineTransform(rotationAngle: CGFloat(45 / 180.0 * .pi))

        self.view.bringSubviewToFront(circle)
        
        let content = UIView()
        
        content.layer.cornerRadius = CGFloat(size / 4 * 3 / 2)
        content.to(self.view).centerX().eq(circle).enable()
        content.to(self.view).centerY().eq(circle).enable()
        content.to(self.view).width(size / 4 * 3).enable()
        content.to(self.view).height(size / 4 * 3).enable()
        content.backgroundColor = rgba(67, 85, 155, 1.00)
        
        let top1 = UIView()
        top1.to(self.view).width(size / 4 - 20).enable()
        top1.to(self.view).height(20).enable()
        top1.to(self.view).centerX().eq(circle).enable()
        top1.to(self.view).centerY(-size / 2 - 32 / 2).eq(circle).enable()
        top1.backgroundColor = rgba(82, 76, 92, 1.00)

        let top2 = UIView()
        top2.layer.cornerRadius = CGFloat(32 / 2)
        top2.to(self.view).width(size / 4).enable()
        top2.to(self.view).height(32).enable()
        top2.to(self.view).centerX().eq(circle).enable()
        top2.to(self.view).centerY(-size / 2).eq(circle).enable()
        top2.backgroundColor = rgba(207, 69, 92, 1.00)
        
        let top3 = UIView()
        top3.layer.cornerRadius = CGFloat(3)
        top3.to(self.view).width(size / 4).enable()
        top3.to(self.view).height(20).enable()
        top3.to(self.view).centerX().eq(circle).enable()
        self.top3Y = top3.to(self.view).centerY(-size / 2 - CGFloat(32 / 2) - CGFloat(20 / 2) - CGFloat(20 / 2)).eq(circle).enable()
        top3.backgroundColor = rgba(105, 99, 117, 1.00)
        
        
        let monitor = UIView()
        monitor.layer.cornerRadius = CGFloat(3)
        monitor.backgroundColor = rgba(86, 124, 140, 1.00)
        monitor.to(self.view).centerX().eq(circle).enable()
        monitor.to(self.view).centerY().eq(circle).enable()
        monitor.to(self.view).width(size / 6 * 3).enable()
        monitor.to(self.view).height(size / 6 * 2).enable()
        
        self.str.font = .boldSystemFont(ofSize: size / 7 * 1)
        self.str.textColor = rgba(49, 56, 67, 1.00)
        self.str.text = "START"
        self.str.textAlignment = .center
        self.str.to(self.view).centerX().eq(circle).enable()
        self.str.to(self.view).centerY().eq(circle).enable()
        self.str.to(self.view).width().eq(monitor).enable()
        self.str.to(self.view).height().eq(monitor).enable()
        
        
        let bl = UIButton()
        bl.layer.cornerRadius = CGFloat(size / 4 / 3 / 2)
        bl.backgroundColor = rgba(246, 246, 246, 1.00)
        bl.to(self.view).width(size / 4 / 5 * 4).enable()
        bl.to(self.view).height(size / 4 / 3).enable()
        bl.to(self.view).centerX(Double( (size / 4 * 3 / 2 + size / 2 / 4 / 2)) * sin(225 * Double.pi / 180)).eq(circle).enable()
        bl.to(self.view).centerY(Double(-(size / 4 * 3 / 2 + size / 2 / 4 / 2)) * cos(225 * Double.pi / 180)).eq(circle).enable()
        bl.transform = CGAffineTransform(rotationAngle: CGFloat(45 / 180.0 * .pi))
        
        let br = UIButton()
        br.layer.cornerRadius = CGFloat(size / 4 / 3 / 2)
        br.backgroundColor = rgba(246, 246, 246, 1.00)
        br.to(self.view).width(size / 4 / 5 * 4).enable()
        br.to(self.view).height(size / 4 / 3).enable()
        br.to(self.view).centerX(Double( (size / 4 * 3 / 2 + size / 2 / 4 / 2)) * sin(135 * Double.pi / 180)).eq(circle).enable()
        br.to(self.view).centerY(Double(-(size / 4 * 3 / 2 + size / 2 / 4 / 2)) * cos(135 * Double.pi / 180)).eq(circle).enable()
        br.transform = CGAffineTransform(rotationAngle: CGFloat(-45 / 180.0 * .pi))
        
        
        let tlBtn = UIButton()
        tlBtn.backgroundColor = .clear
        tlBtn.layer.cornerRadius = CGFloat(size / 2 / 2 / 2)
        tlBtn.to(self.view).width(size / 7 * 3).enable()
        tlBtn.to(self.view).height(size / 2 / 2).enable()
        tlBtn.to(self.view).centerX(Double( (size / 2 - 10)) * sin(-45 * Double.pi / 180)).eq(circle).enable()
        tlBtn.to(self.view).centerY(Double(-(size / 2 - 10)) * cos(-45 * Double.pi / 180)).eq(circle).enable()
        tlBtn.transform = CGAffineTransform(rotationAngle: CGFloat(-45 / 180.0 * .pi))
        tlBtn.addTarget(self, action: #selector(clickTopLeft), for: .touchUpInside)

        let trBtn = UIButton()
        trBtn.backgroundColor = .clear
        trBtn.layer.cornerRadius = CGFloat(size / 2 / 2 / 2)
        trBtn.to(self.view).width(size / 7 * 3).enable()
        trBtn.to(self.view).height(size / 2 / 2).enable()
        trBtn.to(self.view).centerX(Double( (size / 2 - 10)) * sin(45 * Double.pi / 180)).eq(circle).enable()
        trBtn.to(self.view).centerY(Double(-(size / 2 - 10)) * cos(45 * Double.pi / 180)).eq(circle).enable()
        trBtn.transform = CGAffineTransform(rotationAngle: CGFloat(45 / 180.0 * .pi))
        trBtn.addTarget(self, action: #selector(clickTopRight), for: .touchUpInside)

        
        let t3Btn = UIButton()
        t3Btn.backgroundColor = .clear
        t3Btn.to(self.view).width(size / 4).enable()
        t3Btn.to(self.view).height(20 + 32 / 2 + 20).enable()
        t3Btn.to(self.view).centerX().eq(circle).enable()
        t3Btn.to(self.view).centerY(-size / 2 - (20 + 32 / 2 + 20) / 2).eq(circle).enable()
        t3Btn.addTarget(self, action: #selector(click), for: .touchUpInside)
        
        let cBtn = UIButton()
        cBtn.backgroundColor = .clear
        cBtn.to(self.view).centerX().eq(circle).enable()
        cBtn.to(self.view).centerY().eq(circle).enable()
        cBtn.to(self.view).width(size / 6 * 3).enable()
        cBtn.to(self.view).height(size / 6 * 2).enable()
        cBtn.addTarget(self, action: #selector(click), for: .touchUpInside)
        
        self.size = size
        
        self.view.addSubview(MPVolumeView(frame: .zero))
        NotificationCenter.default.addObserver(self, selector: #selector(click), name: NSNotification.Name(rawValue: "AVSystemController_SystemVolumeDidChangeNotification"), object: nil)
    }

    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "outputVolume" {
            self.click(sender: UIButton())
        }
    }
    
    @objc func clickTopLeft(sender: UIButton) {
        guard let size = self.size else { return }
        
        self.tlX.constant = CGFloat(Double( (size / 2 - 20)) * sin(-45 * Double.pi / 180))
        self.tlY.constant = CGFloat(Double(-(size / 2 - 20)) * cos(-45 * Double.pi / 180))
        
        UIView.animate(withDuration: 0.1) {
            self.view.layoutIfNeeded()
        }
        
        OATimer.only.delay(key: .test, timer: 0.1) {
            self.tlX.constant = CGFloat(Double( (size / 2 - 10)) * sin(-45 * Double.pi / 180))
            self.tlY.constant = CGFloat(Double(-(size / 2 - 10)) * cos(-45 * Double.pi / 180))

            UIView.animate(withDuration: 0.1) {
                self.view.layoutIfNeeded()
            }
            OATimer.cleanAll()
        }
    }

    @objc func clickTopRight(sender: UIButton) {
        guard let size = self.size else { return }
        
        self.trX.constant = CGFloat(Double( (size / 2 - 20)) * sin(45 * Double.pi / 180))
        self.trY.constant = CGFloat(Double(-(size / 2 - 20)) * cos(45 * Double.pi / 180))
        
        UIView.animate(withDuration: 0.1) {
            self.view.layoutIfNeeded()
        }
        
        OATimer.only.delay(key: .test, timer: 0.1) {
            self.trX.constant = CGFloat(Double( (size / 2 - 10)) * sin(45 * Double.pi / 180))
            self.trY.constant = CGFloat(Double(-(size / 2 - 10)) * cos(45 * Double.pi / 180))

            UIView.animate(withDuration: 0.1) {
                self.view.layoutIfNeeded()
            }
            OATimer.cleanAll()
        }
    }
    
    @objc func click(sender: UIButton) {
        guard let size = self.size else { return }

        self.top3Y.constant = -size / 2 - CGFloat(32 / 2) - CGFloat(20 / 2)
        
        UIView.animate(withDuration: 0.1) {
            self.view.layoutIfNeeded()
        }

        OATimer.only.delay(key: .test, timer: 0.1) {
            self.top3Y.constant = -size / 2 - CGFloat(32 / 2) - CGFloat(20 / 2) - CGFloat(20 / 2)

            UIView.animate(withDuration: 0.1) {
                self.view.layoutIfNeeded()
            }
            OATimer.cleanAll()
        }
  
        if str.text?.elementsEqual("START") ?? true {
            self.str.text = "STOP"
        } else {
            self.str.text = "START"
        }
    }
}

