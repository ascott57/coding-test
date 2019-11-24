//
//  CircleView.swift
//  ClearScoreTest
//
//  Created by Anthony Scott on 2019/11/23.
//
//  Perhaps not the most elegant interpretation of the progress bar, but works, although it is missing the gradient.
//

import UIKit

class CircleView: UIView {
    
    private var progressLayer = CAShapeLayer()
    private var borderLayer = CAShapeLayer()

    lazy var scoreLabel: UILabel = {
        let aLabel = UILabel()

        aLabel.font = UIFont(name: "HelveticaNeue-UltraLight", size: 96.0) ?? UIFont.systemFont(ofSize: 96, weight: .light)
        aLabel.textAlignment = .center
        aLabel.translatesAutoresizingMaskIntoConstraints = false
        aLabel.textColor = .gold

        return aLabel
        
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }

    private func setupView() {
        addSubview(scoreLabel)
        
        NSLayoutConstraint.activate([
            scoreLabel.widthAnchor.constraint(equalToConstant: 200),
            scoreLabel.heightAnchor.constraint(equalToConstant: 100),
            scoreLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            scoreLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
        
        setCircularBorder()

    }
    
    private func setCircularBorder() {
        let centerX = frame.size.width/2
        let centerY = frame.size.height/2
        let outerRadius = (frame.size.width - 1.5)/2
        let innerRadius = (frame.size.width - 1.5)/2 - 10
        let startAngle = CGFloat(-0.5 * .pi)
        let endAngle = CGFloat(1.5 * .pi)
        
        layer.cornerRadius = self.frame.size.width/2
        let outerPath = UIBezierPath(arcCenter: CGPoint(x: centerX, y: centerY), radius: outerRadius, startAngle: startAngle, endAngle: endAngle, clockwise: true)
        borderLayer.path = outerPath.cgPath
        borderLayer.fillColor = UIColor.clear.cgColor
        borderLayer.strokeColor = UIColor.darkGray.cgColor
        self.borderLayer.lineWidth = 2.0
        self.borderLayer.strokeEnd = 1.0
        layer.addSublayer(borderLayer)
        
        let innerPath = UIBezierPath(arcCenter: CGPoint(x: centerX, y: centerY), radius: innerRadius, startAngle: startAngle, endAngle: endAngle, clockwise: true)
        progressLayer.path = innerPath.cgPath
        progressLayer.fillColor = UIColor.clear.cgColor
        progressLayer.strokeColor = UIColor.clear.cgColor // hide until animated
        self.progressLayer.lineWidth = 4.0
        self.progressLayer.strokeEnd = 1.0
        layer.addSublayer(progressLayer)

    }
    
    private func showAnimtedProgress(duration: TimeInterval, value: Float) {
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        
        animation.duration = duration
        animation.fromValue = 0
        animation.toValue = value
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)
        progressLayer.strokeColor = UIColor.gold.cgColor // should be gradient?
        self.progressLayer.strokeEnd = CGFloat(value)
        self.progressLayer.add(animation, forKey: "animateprogress")
        
    }
    
    public func showScore(score: Int, maxValue: Int) {
        DispatchQueue.main.async {
            self.scoreLabel.text = score > 0 ? "\(score)" : ""
            self.showAnimtedProgress(duration: 1.0, value: Float(Float(score) / Float(maxValue))) // TODO: use max
        }
    }
    
}
