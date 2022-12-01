
import UIKit

class SlotMachine {
    

    
    init(coinCounts: Int, maxNumber: Int) {
        self.coinCounts = coinCounts
        //スロットマシーンの数字を用意
        for i in 1..<maxNumber {
            numbers.append(i)
        }
    }
    //スロットを開始するメソッド
    func startSlot(){
        while isContinueFlag {
            coinCounts -= needCoin //コインを減らす処理
            print("----残りのコイン枚数は「\(coinCounts)」です。")
            turnSlot()
        }
        finishSlot()
    }
    
    //スロットを終了するメソッド
    func finishSlot() {
        print("スロットを終了します。")
        print("獲得ポイントは\(getPoint)です。")
    }
    
    //スロットを回すメソッド
    func turnSlot() {
        var resultNumbers:[[Int]] = []
        for i in 1...slotverticalCount {
            numbers.shuffle()
            var outputNumber:[Int] = []
            for i in 1...slotverticalCount {
                outputNumber.append(numbers[i])
            }
            resultNumbers.append(outputNumber)
        }
        print("---------結果--------")
        print(resultNumbers)
        print("--------------------")
        checkNumber(resultNumbers) //スロットの結果を判定
        continueSlot(coinCounts) //スロットを続けるかを判定
    }
    //スロットを続けるか判定するメソッド
    func continueSlot(_ coinCount: Int) {
        if needCoin > coinCount { isContinueFlag = false }
    }
    
    //スロットの数字が揃ったか判定しポイントを加算するメソッド
    func checkNumber(_ checkSlotNumbers: [[Int]]) {
        for i in 0...self.slotverticalCount - 1 {
            //縦が揃っているか判定
            if checkSlotNumbers[0][i] == checkSlotNumbers[1][i], checkSlotNumbers[1][i] == checkSlotNumbers[2][i] {
                self.getPoint += checkSlotNumbers[0][i]
                print("横に\(checkSlotNumbers[0][i])がそろいました。\(checkSlotNumbers[0][i])ポイント獲得！！")
                if checkSlotNumbers[0][i] == 7 {
                    self.getPoint += 10
                    print("7がそろいました。ボーナスポイント10獲得")
                }
            }
            //斜めが揃っているか判定
            if checkSlotNumbers[0][0] == checkSlotNumbers[1][1] , checkSlotNumbers[2][2] == checkSlotNumbers[1][1] {
                self.getPoint += checkSlotNumbers[1][1]
                print("右斜め下に\(checkSlotNumbers[1][1])がそろいました。\(checkSlotNumbers[1][1])ポイント獲得!!")
                if checkSlotNumbers[1][1] == 7 {
                    self.getPoint += 10
                    print("7がそろいました。ボーナスポイント10獲得")
                }
            } else if checkSlotNumbers[0][2] == checkSlotNumbers[1][1] , checkSlotNumbers[2][0] == checkSlotNumbers[1][1] {
                self.getPoint += checkSlotNumbers[1][1]
                print("右斜め上に\(checkSlotNumbers[1][1])がそろいました。\(checkSlotNumbers[1][1])ポイント獲得!!")
                if checkSlotNumbers[1][1] == 7 {
                    self.getPoint += 10
                    print("7がそろいました。ボーナスポイント10獲得")
                }
            }
        }
        print("現在のポイント\(self.getPoint)です。")
    }
}
//スロットマシンクラスをインスタンス化
let slotMachin = SlotMachine(coinCounts: 100, maxNumber: 5)
slotMachin.startSlot()








    



//
//<<スロットマシーンの仕様>>
//- 1 コインを入れる
//- 2 コインの枚数が減る
//- 3 ランダムで数字が横に３つ表示される
//- 4 ランダムで数字が縦に3つ表示される
//- 5 横、斜めで数字が揃ったらその数字分のコインを獲得する(７が揃った場合だけ多めに獲得できる)
//- 6 コインが残っているかを判定する
//- 7 残っている場合は1-６を再度繰り返す
//- 8 スロットを終了する

