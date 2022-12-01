//自動販売機のビジネスロジックの作成

//お金を構造体で定義する
struct moniesDetail {
    let moniesName: String;
    let moniesPrice: Int;
}

//お金の種類を配列で用意する
var moneise: [moniesDetail] = [
    moniesDetail(moniesName: "10円", moniesPrice: 10),
    moniesDetail(moniesName: "50円", moniesPrice: 50),
    moniesDetail(moniesName: "100円", moniesPrice: 100),
    moniesDetail(moniesName: "500円", moniesPrice: 500),
    moniesDetail(moniesName: "1000円", moniesPrice: 1000)
]

//商品の属性を定義する
struct productDetail {
    let id: Int
    let name: String
    let price: Int
    var stock: Int
}

//商品の種類を配列で定義する
var product: [productDetail] = [
    productDetail(id: 1, name: "天然水" ,price: 100, stock: 10),
    productDetail(id: 2, name: "おーいお茶" ,price: 150, stock: 10),
    productDetail(id: 3, name: "アクエリアス" ,price: 150, stock: 10),
    productDetail(id: 4, name: "コーラ" ,price: 140, stock: 12),
    productDetail(id: 5, name: "オレンジジュース" ,price: 130 , stock: 10),
    productDetail(id: 6, name: "りんごジュース" ,price: 130, stock: 8),
    productDetail(id: 7, name: "コーヒー" ,price: 180, stock: 4),
    productDetail(id: 8, name: "牛乳" ,price: 120, stock: 5),
    productDetail(id: 9, name: "レッドブル" ,price: 200, stock: 10),
    productDetail(id: 10, name: "モンスターエナジー" ,price: 200, stock: 10)
]

var totalPrice = 0 //投入した合計金額の変数
var buyProducts:[String] = [] //購入する商品を配列で定義

//お金を入れる処理
while true {
    print("お金をいれますか？1: はい, 2,いいえ")
    let actionType = readLine()!
    guard actionType == "1" else { break }
    print("何のお金をいれますか？")
    print("使用可能なお金(10円,50円,100円,500円,1000円")
    let inputMoeny = readLine()!
    //使用可能なお金か判定をする
    if isSCheckCanUseMoney(targetWord: inputMoeny) {
        let targetMoeny = moneise.first{$0.moniesName == inputMoeny}!
        print("\(targetMoeny.moniesName)を何枚いれますか？")
        let inputCount = readLine()!
        let getInputCount = Int(inputCount)!
        totalPrice += targetMoeny.moniesPrice * getInputCount
        print("合計金額は\(totalPrice)円です")
    } else {
        print("使用できないお金です")
    }
}
//商品購入の処理
while true {
    print("現在の金額は\(totalPrice)円です")
    print(" 商品を購入しますか？1: はい　２:いいえ")
    let actionType = readLine()!
    guard actionType == "1" else { break }
    print("次の商品を購入することができます。購入したい商品の番号を入力してください")
    var isCheckCanBuyProduct = false
    //購入可能な商品を一覧にする
    for value in product {
        if value.price <= totalPrice {
            isCheckCanBuyProduct = true
            print(value.id, value.name, "\(value.price)円", "在庫数: \(value.stock)")
        }
    }
    //購入可能商品がない場合はループを外れる
    guard isCheckCanBuyProduct else { break }
    //商品の購入の選択処理
    let inputNumber = readLine()!
    let targetNumber = Int(inputNumber)!
    var targetProduct = product.first{ $0.id == targetNumber }!
    print("\(targetProduct.name)を購入しました")
    //合計金額から購入金額を引く
    totalPrice -= targetProduct.price
    //購入したものリストに追加する
    buyProducts.append(targetProduct.name)
}

//購入した商品を一覧で表示
print("ーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーー")
if buyProducts.count > 0 {
    print("今回購入した商品たちです")
    for value in buyProducts {
        print(value)
    }
} else {
    print("購入した商品はありません")
}
print("\(totalPrice)円のお返しです。ありがとうございました！")
print("ーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーーー")


//使用可能な通貨か判定するメソッド
func isSCheckCanUseMoney(targetWord: String) -> Bool {
    var result = false
    let checkMoney = moneise.filter({ $0.moniesName == targetWord })
    if checkMoney.count > 0 {
        result = true
    }
    return result
}



////- 1.お金を受け取る（お金かどうか、通貨かどうかの判定） 実装完了
////  - 2.入ったお金を合計する。ディスプレイに表示。 実装完了
////  - 3.買えるものかつ在庫があるものの判定
////  - 4.購入の場合は入れられた金額から購入金額を差し引く。　完了
////  - 5.商品を1本出力する。完了
////  - 6.商品の在庫を1引くディスプレイに表示。
////  - 7.3に戻る。買えるものがない場合はお釣りが出る 完了
//
//
////バグの種類
////投入した金額が0円の場合は終わりの処理にする
