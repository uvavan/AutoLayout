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
    @IBOutlet private weak var stackViewChess: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var whiteOrBlack = false
        for parity in 1...64 {
            chessBoard.append(UIView())
            chessBoard[parity - 1].backgroundColor = whiteOrBlack ? .black : .white
            if parity % 8 != 0 {
                whiteOrBlack = !whiteOrBlack
            }
        }
        for _ in 0...7 {
            stackVertical.append(UIStackView())
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        for stackV in stackVertical {
            stackV.alignment = .fill
            stackV.axis = .vertical
            stackV.distribution = .fillEqually
            //stackV.spacing = 0
           // stackV.isHidden = false
            stackViewChess.addArrangedSubview(stackV)
        }
        for (index,viewChess) in chessBoard.enumerated() {
            stackVertical[Int(index / 8)].addArrangedSubview(viewChess)
//            switch index {
//            case 0...7 :
//                stackVertical[0].addArrangedSubview(viewChess)
//            case 8...15:
//                stackVertical[1].addArrangedSubview(viewChess)
//            case 16...23:
//                stackVertical[2].addArrangedSubview(viewChess)
//            case 24...31:
//                stackVertical[3].addArrangedSubview(viewChess)
//            case 32...39:
//                stackVertical[4].addArrangedSubview(viewChess)
//            case 40...47:
//                stackVertical[5].addArrangedSubview(viewChess)
//            case 48...55:
//                stackVertical[6].addArrangedSubview(viewChess)
//            case 56...63:
//                stackVertical[7].addArrangedSubview(viewChess)
//            default:
//                break
//            }
        }
    }
    
    
}
