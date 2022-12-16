//
//  ViewController.swift
//  RPSGame
//
//  Created by 노민우 on 2022/12/13.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var comImageView: UIImageView!
    @IBOutlet weak var myImageView: UIImageView!
    
    @IBOutlet weak var comChoiceLabel: UILabel!
    @IBOutlet weak var myChoiceLabel: UILabel!
    
    var comChoice:Rps = Rps(rawValue: Int.random(in: 0...2))!
    var myChoice:Rps = Rps.rook
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 1) 첫번째/두번째 이미지뷰에 준비(묵) 이미지를 띄워야함.
        comImageView.image = #imageLiteral(resourceName: "ready")
        myImageView.image = UIImage(named: "ready.png")
        
        // 2) 첫번쨰/두번째 레이블에 "준비"라고 문자열을 띄워야함.
        comChoiceLabel.text = "준비"
        myChoiceLabel.text = "준비"
        
    }


    @IBAction func rpsButtonTapped(_ sender: UIButton) {
        // 가위/바위/보를 선택해서 정보를 저장해야함.
        // 쓰고자 하는 값이 확실하지 않을때 옵셔널은 if let 이나 guard let 을 쓴다.
//        guard let title = sender.currentTitle else {
//            return
//        }
        // title 이 있는것이 확실하기 때문에 ! 를 사용하여 옵셔널을 버껴줘도 된다.
        let title = sender.currentTitle!
        
        switch title {
        case "가위" :
            myChoice = Rps.scissors
        case "바위" :
            myChoice = Rps.rook
        case "보" :
            myChoice = Rps.paper
        default:
            break
        }
    }
    
    
    @IBAction func selectButtonTapped(_ sender: UIButton) {
        // 1) 컴퓨터가 랜덤 선택한 것을 이미지뷰에 표시
        // 2) 컴퓨터가 랜덤 선택한 것을 레이블에 표시
        switch comChoice{
        case Rps.rook:
            comImageView.image = #imageLiteral(resourceName: "rock")
            comChoiceLabel.text = "바위"
        case Rps.paper:
            comImageView.image = #imageLiteral(resourceName: "paper")
            comChoiceLabel.text = "보"
        case Rps.scissors:
            comImageView.image = #imageLiteral(resourceName: "scissors")
            comChoiceLabel.text = "가위"
        }
        
        // 3) 내가 선택한 것을 이미지 뷰에 표시
        // 4) 내가 선택한 것을 레이블에 표시
        
        switch myChoice{
        case Rps.rook:
            myImageView.image = #imageLiteral(resourceName: "rock")
            myChoiceLabel.text = "바위"
        case Rps.paper:
            myImageView.image = #imageLiteral(resourceName: "paper")
            myChoiceLabel.text = "보"
        case Rps.scissors:
            myImageView.image = #imageLiteral(resourceName: "scissors")
            myChoiceLabel.text = "가위"
        }
        
        // 5) 컴퓨터가 선택한 것과 내가 선택한 것을 비교해서 이겼는지 졌는지 판당하여 표시
        
        if comChoice == myChoice {
            mainLabel.text = "비겼다"
        } else if comChoice == .rook && myChoice == .paper {
            mainLabel.text = "이겼다"
        } else if comChoice == .paper && myChoice == .scissors {
            mainLabel.text = "이겼다"
        } else if comChoice == .scissors && myChoice == .rook {
            mainLabel.text = "이겼다"
        } else {
            mainLabel.text = "졌다"
        }
    }
    
    
    
    @IBAction func resetButtonTapped(_ sender: UIButton) {
        // 1) 컴퓨터가 다시 준비 이미지뷰에 표시
        // 2) 컴퓨터가 다시 준비 레이블에 표시
        comImageView.image = #imageLiteral(resourceName: "ready")
        comChoiceLabel.text = "준비"
        
        // 3) 내가 선택한한 이미지뷰에도 이미지 뷰를 표시
        // 4) 내가 선택한 레이블에도 준비 문자열 표시
        myImageView.image = #imageLiteral(resourceName: "ready")
        myChoiceLabel.text = "준비"
        
        // 5) 메인 레이블 "선택하세요" 표시
        mainLabel.text = "선택하세요"
        // 6) 컴퓨터가 다시 랜덤 가위/바위/보를 선태하고 저장
        comChoice = Rps(rawValue: Int.random(in: 0...2))!
    }
    
    
}
