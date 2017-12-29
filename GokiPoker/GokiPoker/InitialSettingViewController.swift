//
//  InitialSettingViewController.swift
//  GokiPoker
//
//  Created by 竹野祐輔 on 2017/12/26.
//  Copyright © 2017年 竹野祐輔. All rights reserved.
//

import UIKit

//MARK: - Main
class InitialSettingViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource{

    
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var onPickerLabel: UILabel!
    @IBOutlet weak var belowPickerLabel: UILabel!
    
    @IBOutlet weak var nameInputView0: TestCustomView!
    @IBOutlet weak var nameInputView1: TestCustomView!
    @IBOutlet weak var nameInputView2: TestCustomView!
    @IBOutlet weak var nameInputView3: TestCustomView!
    @IBOutlet weak var nameInputView4: TestCustomView!
    @IBOutlet weak var nameInputView5: TestCustomView!
    
    let numOfPlayer: [[Int]] = [[2,3,4,5,6]]
    var inputNanmeViews: [TestCustomView] = []
    var now: Int = 2
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        onPickerLabel.text = "プレイ人数を選択してください"
        belowPickerLabel.text = "人でプレイ!!"
        inputNanmeViews = [nameInputView0, nameInputView1, nameInputView2, nameInputView3, nameInputView4, nameInputView5]
        
        var i = 1
        for view in inputNanmeViews{
            if(i > 2){
                view.alpha = 0
            }
            view.leftLabel.text = "Player" + i.description + ": "
            view.textView.placeholder = "Input your name"
            i += 1
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

////MARK: - UI TableView
//    /// セルの個数を指定するデリゲートメソッド（必須）
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return now
//    }
//
//    /// セルに値を設定するデータソースメソッド（必須）
//    internal func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell: TestTableViewCell = tableView.dequeueReusableCell(withIdentifier: "TestCustomCell", for: indexPath as IndexPath) as! TestTableViewCell
//        // セルに表示する値を設定する
//        cell.testCustomView.leftLabel.text = "Player" + indexPath.row.description + ": "
//        return cell
//    }
//
//    /// セルが選択された時に呼ばれるデリゲートメソッド
//    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {}
//
//
//
//MARK: - UIPickerView
    //コンポーネントの個数を返すメソッド
    @IBOutlet weak var numOfPlayersPicker: UIPickerView!
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return numOfPlayer.count
    }

    //コンポーネントに含まれるデータの個数を返すメソッド
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return numOfPlayer[component].count
    }

    //データを返すメソッド
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return numOfPlayer[component][row].description
    }

    //データ選択時の呼び出しメソッド
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        showOrHideNameInputView(component: component, row: row)
    }
    
    func showOrHideNameInputView(component: Int, row: Int){
        for i in 0 ..< numOfPlayer[component][row]{
            inputNanmeViews[i].alpha = 1
        }
        for i in numOfPlayer[component][row] ..< inputNanmeViews.count{
            inputNanmeViews[i].alpha = 0
        }
    }
}
