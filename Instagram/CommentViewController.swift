//
//  CommentViewController.swift
//  Instagram
//
//  Created by 菊池 玲花 on 2019/05/22.
//  Copyright © 2019 reika.kikuchi. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase
import SVProgressHUD

class CommentViewController: UIViewController {
   
   // var postArray: [PostData] = []
    var postData: PostData!
    var commentNumber:String!
    
    @IBOutlet weak var commentTextField: UITextField!
    
    // 送信ボタンをタップした時に呼ばれるメソッド
    @IBAction func sendButton(_ sender: Any) {
        let comment: [String:String] = ["name":Auth.auth().currentUser!.displayName!, "comments":commentTextField.text!]
        postData.comments.append(comment)
        // 辞書を作成してFirebaseに保存する
        let postRef = Database.database().reference().child(Const.PostPath).child(postData.id!)
        let comments = ["comments":postData.comments]
        postRef.updateChildValues(comments)
        
        // HUDで投稿完了を表示する
        SVProgressHUD.showSuccess(withStatus: "送信しました")
        // 閉じる
        dismiss(animated: true, completion: nil)
       
        
    }
    
    @IBAction func cancelButton(_ sender: Any) {
        // 画面を閉じる
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
}
