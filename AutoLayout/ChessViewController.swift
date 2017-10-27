//
//  ChessViewController.swift
//  AutoLayout
//
//  Created by Admin on 27.10.17.
//  Copyright © 2017 Bioprom. All rights reserved.
//

import UIKit

class ChessViewController: UIViewController {
    
    private var chessBoard: [UIView] = []
    private var stackVertical: [UIStackView] = []
    private var stackHorizontal: UIStackView!
    private var constraintChessBoardHorizontal: NSLayoutConstraint!
    private var constraintChessBoardVertical: NSLayoutConstraint!
    private var constraintLeft: NSLayoutConstraint!
    private var constraintRight: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for parity in 0...63 {
            chessBoard.append(UIView())
            chessBoard[parity].frame.size.height = (self.view.bounds.width - 40)/8
            chessBoard[parity].frame.size.width = (self.view.bounds.width - 40)/8
            chessBoard[parity].backgroundColor = parity % 2 == 0 ? .white : .black
        }
        for index in 0...7 {
            stackVertical.append(UIStackView())
            stackVertical[index].frame.size.height = self.view.bounds.width - 40
            stackVertical[index].frame.size.width = (self.view.bounds.width - 40) / 8
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        stackHorizontal = UIStackView()
        stackHorizontal.frame.size.width = self.view.bounds.width - 40
        stackHorizontal.frame.size.height = self.view.bounds.width - 40
        stackHorizontal.backgroundColor = .black
        stackHorizontal.isHidden = false
        stackHorizontal.axis = .horizontal
        stackHorizontal.alignment = .fill
        stackHorizontal.distribution = .fillEqually
        stackHorizontal.contentMode = .scaleToFill
        stackHorizontal.isBaselineRelativeArrangement = false
        for (count, viewChess) in chessBoard.enumerated() {
            var index = 0
            stackVertical[index].addSubview(viewChess)
            if count % 8 == 0 {
                index = index + 1
            }
        }
        for stackV in stackVertical {
            stackV.isHidden = false
            stackV.axis = .vertical
            stackV.alignment = .fill
            stackV.distribution = .fillEqually
            stackV.contentMode = .scaleToFill
            stackHorizontal.addSubview(stackV)
        }
        constraintChessBoardVertical = NSLayoutConstraint(item: stackHorizontal, attribute: .centerY, relatedBy: .equal, toItem: view, attribute: .centerY,multiplier: 1.0, constant: 0)
        constraintChessBoardHorizontal = NSLayoutConstraint(item: stackHorizontal, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX , multiplier: 1.0, constant: 0)
        constraintLeft = NSLayoutConstraint(item: stackHorizontal, attribute: .left, relatedBy: .equal, toItem: view, attribute: .left, multiplier: 1.0, constant: 20)
        constraintRight = NSLayoutConstraint(item: stackHorizontal, attribute: .right, relatedBy: .equal, toItem: view, attribute: .right, multiplier: 1.0, constant: 20)
        
        view.addSubview(stackHorizontal)
        view.addConstraints([constraintRight, constraintLeft, constraintChessBoardVertical, constraintChessBoardHorizontal])
    }
    
    
}
