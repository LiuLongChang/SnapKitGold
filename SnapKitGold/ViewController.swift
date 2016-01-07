//
//  ViewController.swift
//  SnapKitGold
//
//  Created by langyue on 16/1/7.
//  Copyright © 2016年 langyue. All rights reserved.
//

import UIKit
import SnapKit
import Alamofire



let AppPostId : String! =  "84cb1bf82adac469e7b7d5702c27e7f9"
let AppPostKey : String! = "211c0341d4d645a32a4a653733d9f6d5"



//let CC_MD5_DIGEST_LENGTH = 16
//let CC_MD5_BLOCK_BYTES = 64
//
//extension String{
//    
//    func md5() -> String {
//        
//        let str = self.cStringUsingEncoding(NSUTF8StringEncoding)
//        let strLen = CUnsignedInt(self.lengthOfBytesUsingEncoding(NSUTF8StringEncoding))
//        let digestLen = Int(CC_MD5_DIGEST_LENGTH)
//        let result = UnsafeMutablePointer<CUnsignedChar>.alloc(digestLen)
//        CC_MD5(str!,strLen,result)
//        var hash = NSMutableString()
//        for i in 0 ..< digestLen {
//            hash.appendFormat("%02x", result[i])
//        }
//        result.dealloc(digestLen)
//        return String(format: hash as String)
//    }
//    
//    
//    
//}


class ViewController: UIViewController {
    
    
    var request : Alamofire.Request?
    
    
    var _basePostDict : Dictionary<String,AnyObject>!
    
    //var _basePostDict : NSDictionary!
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let box = UIView()
        box.backgroundColor = UIColor.grayColor()
        self.view.addSubview(box)
//        box.snp_makeConstraints { (make) -> Void in
//            make.top.equalTo(self.view).offset(20)
//            make.left.equalTo(self.view).offset(20)
//            make.bottom.equalTo(self.view).offset(-20)
//            make.right.equalTo(self.view).offset(-20)
//        }
        
     
        
//        box.snp_makeConstraints { (make) -> Void in
//            make.edges.equalTo(self.view).inset(UIEdgeInsetsMake(20, 20, 20, 20))
//        }

        
        box.snp_makeConstraints { (make) -> Void in
            make.width.height.equalTo(50)
            make.center.equalTo(self.view)
        }
        
        
        
        //http://auto360.langyue.org/api/orgSelect
        //https://httpbin.org/get
        _basePostDict = ["accessToken":"0dea916ba64d010302600439981cbdaa"]
        print("\(_basePostDict)")
        
        //
        let appScret = self.obtainAppSecret()
        
        
        //Swift网络库Alamofire和界面布局库SnapKit研习工程
        
        self.request =  Alamofire.request(.POST,"http://auto360.langyue.org/api/user/car/list",parameters:_basePostDict ,encoding: .URL,headers: ["AppSecret":appScret,"AppId":"84cb1bf82adac469e7b7d5702c27e7f9","Content-Type":"application/x-www-form-urlencoded"]).responseJSON(completionHandler: { (response) -> Void in
            
            
            
            print("\(response)")
            
        })
        
        
        
        
        
        
    }
    
    
    func obtainAppSecret() -> String{
        var appStr : NSString!
        if (_basePostDict!.count == 0 || _basePostDict == nil){
            appStr = "appId=\(AppPostId)&appKey=\(AppPostKey)"
        }else{
            
            let dict = _basePostDict as! NSDictionary
            let keys = dict.allKeys
            var parAry : [String!] = []
            
            
            
            for obj   in keys{
                let value = dict.valueForKey(obj as! String) as! String
                let para = "\(obj)=\(value)"
                parAry.append(para)
            }
            
            
            //\(paras)&
            var paras = parAry[0]
            for par in parAry {
                
                paras = "\(par)"
                
                
                
              
            }
            
            
            
            
            appStr = "\(paras)&appId=\(AppPostId)&appKey=\(AppPostKey)"
        }
        
        
        
        
        
        return appStr.MD5Digest()
        
    }
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

