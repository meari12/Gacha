//
//  ResultViewController.swift
//  Gacha
//
//  Created by Meri Sato on 2022/05/09.
//

import UIKit

class ResultViewController: UIViewController {
    var number: Int!
    //1番後ろの背景画像
    @IBOutlet var haikeiImageView: UIImageView!
    
    //モンスターを表示する画像
    @IBOutlet var monsterImageView: UIImageView!
    
    @IBOutlet var monsterLabel: UILabel!
    
    //モンスター画像を保存しておく配列
    var monsterArray: [UIImage]!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //０〜９の間でランダムに数字を発生させる
        let number = Int.random(in: 0..<10)
        
        //モンスターの画像を10枚追加する
        monsterArray = [UIImage(named:"monster001.png")!,
                        UIImage(named:"monster002.png")!,
                        UIImage(named:"monster003.png")!,
                        UIImage(named:"monster004.png")!,
                        UIImage(named:"monster005.png")!,
                        UIImage(named:"monster006.png")!,
                        UIImage(named:"monster007.png")!,
                        UIImage(named:"monster008.png")!,
                        UIImage(named:"monster009.png")!,
                        UIImage(named:"monster010.png")!,]
        //ランダムに選んだモンスターを表示させる
        monsterImageView.image = monsterArray[number]
        
        if (number == 0)
        {monsterLabel.text = "ねこねこん"}
        else if(number == 1)
        {monsterLabel.text = "スイミー"}
        else if(number == 2)
        {monsterLabel.text = "ヒゲ眉毛"}
        else if(number == 3)
        {monsterLabel.text = "グレタクリオネ"}
        else if(number == 4)
        {monsterLabel.text = "鎧オモイ"}
        else if(number == 5)
        {monsterLabel.text = "歩きタバコ"}
        else if(number == 6)
        {monsterLabel.text = "忍者風"}
        else if(number == 7)
        {monsterLabel.text = "クレオパトラなりかけ"}
        else if(number == 8)
        {monsterLabel.text = "ボクマレフィセント"}
        else if(number == 9)
        {monsterLabel.text = "金とりまミニツケタ"}
        
        
        if number == 9{
            //激レアモンスター
            haikeiImageView.image = UIImage(named: "bg_gold.png")
        } else if number > 6 {
            //レアモンスター
            haikeiImageView.image = UIImage(named: "bg_red.png")
        } else {
            //ノーマルモンスター
            haikeiImageView.image = UIImage(named: "bg_blue.png")
        }
        
    }
    
    @IBAction func back(){
        self.dismiss(animated: true, completion: nil)
    }
        
        //このResultViewControllerが表示される度に呼び出すメソッド
    override func viewDidAppear(_ animated: Bool){
            super.viewDidAppear(true)
        
        //アニメーションの/の中でもtransform(変形)させるキーパスを設定
        let animation = CABasicAnimation(keyPath: "transform")
        
        //アニメーション開始時の数値
        animation.fromValue = NSNumber(value: 0)
        
        //アニメーション終了時の数値（M_PIとは角度の180度）
        animation.toValue = NSNumber(value: 2 * Double.pi)
        
        animation.valueFunction = CAValueFunction(name: CAValueFunctionName.rotateZ)
        
        animation.duration = 5
        
        animation.repeatCount = Float.infinity
        
        haikeiImageView.layer.add(animation, forKey: nil)
            
        UIView.transition(with: monsterImageView, duration: 1.0, options: [.transitionCrossDissolve, .autoreverse], animations: {
        self.monsterImageView.isHidden = true
    }) { _ in
        self.monsterImageView.isHidden = false
    }
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
