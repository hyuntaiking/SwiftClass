//
//  myclass.swift
//  hyuntai0615
//
//  Created by Hyuntai on 2017/6/15.
//  Copyright © 2017年 hyphen. All rights reserved.
//

import Foundation
class c1 {
    
}
class c2 {
    init() { // 建構式 => 1.沒有func(x) 2.沒有->return，永不回傳
        print("c2 init")
    }
}
class c3 {
    var x = 1
    var y = 1
    init() {
        
    }
}
class c4 {
    var x: Int
    var y: Int
    init() {
        x = 0
        y = 0
    }
    init(x: Int, y: Int) {
        self.x = x
        self.y = y
    }
    func m1() -> Int {
        return 123
    }
}
class Student {
    var sid: String
    var chinese: Int
    var english: Int
    var math   : Int
    init(sid: String, chinese: Int, english: Int, math: Int) {
        self.sid      = sid
        self.chinese = chinese
        self.english = english
        self.math    = math
    }
    func sum() -> Int {
        return (chinese + english + math)
    }
    func avg() -> Double {
        return Double(sum()) / 3.0
    }
    
}
class c6 {
    init() {
        print("c6:init()")
    }
    func m1() {
        print("c6.m1()")
    }
}
class c5 {
    var p1 = c6() // = 表示有初始化
    lazy var p2: c6 = c6() // 不打算馬上做，等有用到時才建構，當物件很複雜時用到
                           // 讓物件初始化效能變高，只有Swift有
    func doSomething() {
        print("c5:doSomething()")
        p2.m1()
    }
}
struct MyClass3 { // 別管我名字
    var x = 1
    var y = 1
}
struct MyClass4 {
    var v1 = MyClass3()
    var v2: MyClass3 {
        get {
            let newx = v1.x + 10
            let newy = v1.y + 20
            return MyClass3(x: newx, y: newy)
        }
        set(aClass3Obj) { // 要有參數(預設為newValue)
            v1.x = aClass3Obj.x - 10
            v1.y = aClass3Obj.y - 30
        }
    }
    var v3: MyClass3 {
        // { ... }中可以使用原先定義的屬性
        // 定義 getter & setter
        // 透過v3的getter===> xxx = v3
        // setter ==> v3 = xxx
        get {
            return MyClass3(x: 1, y: 2)
        }
        set(aVar) { // 預設為newValue
            //aVar 一定是MyClass3
        }
    }
}
class MyScore {
    var x = 0, y = 0, z = 0
    // 因x、y、z而不同
    var sum: Int {
        get {
            return x + y + z
        }
    }
    var avg: Double { // 可以有getter沒有setter
        return Double(sum) / 3.0
    }
}
class MyClass5 {
    var x: Int = 0 {
        willSet(newx) { // Swift 漂亮，iOS會常用到
            print("before: \(x) --> \(newx)")
        }
        didSet {
            print("after: \(x)") //有oldValue可用
        }
    }
    
}
struct MyStruct1111 {
    var a = 1
    mutating func f1() {
         a = 2 //為了安全，結構不給改屬性
        print(a)
        self = MyStruct1111(a: 100)
    }
}
class MyClass1111 {
    var a = 1
    func f1() {
        a = 2
        print(a)
    }
}
func myclass() {
    print("-----Object type-----")
    let obj1 = c1()
    print(type(of: obj1))
    
    let obj2 = c2()
    
    let obj3 = c3()
    print(obj3.x)
    
    let obj4 = c4(x: 3, y: 4)
    print(obj4.x)
    print(obj4.m1())
    print("----Object method-----")
    let s1 = Student(sid: "S01", chinese: 90, english: 75, math: 96)
    let s2 = Student(sid: "S02", chinese: 88, english: 97, math: 98)
    let s4 = Student(sid: "S01", chinese: 90, english: 75, math: 96)
    print(s1.sum())
    print(s1.avg())
    print(s2.sum())
    print(s2.avg())
    print("------Class are reference types-----------")
    var s3 = s1
    print(s3.sum())
    print(s3.avg())
    s1.chinese = 100
    print(s3.sum())
    print(s3.avg()) // class call by reference
    print("-----Class Identity Operators-----")
    print(s4 === s3)
    s3 = s1
    print(s1 === s3)
    print("------------")
    class Bike {
        private var speed: Double // 屬性封裝
        init(speed: Double) {
            self.speed = speed
        }
        func upSpeed() {
            speed = speed < 1 ? 1:speed*1.2
        }
        func downSpeed() {
            speed = speed < 1 ? 0:speed*0.7
        }
        func getSpeed() -> Double {
            return self.speed
        }
        func clone() -> Bike {
            return Bike(speed: speed)
        }
    }
    let b1 = Bike(speed: 0)
    print(b1.getSpeed())
    b1.upSpeed(); b1.upSpeed(); b1.upSpeed(); b1.upSpeed();
    b1.downSpeed();
    print(b1.getSpeed())
    print("------clone----")
    var b2 = b1.clone() // 複制羊，只複制當時狀況
    print(b2.getSpeed())
    print(b1 === b2)
    print("----reference---")
    var b3 = b1
    print(b1 === b3)
    print("----lazy---------")
    var b4 = c5()
    b4.doSomething()
    b4.doSomething()
    print("----Computed Property----------")
    var bb3 = MyClass3()
    bb3.x = 33; bb3.y = 44;
    
    var bb4 = MyClass4()
    print("bb4.v1.x =\(bb4.v1.x)")
    print("bb4.v1.y =\(bb4.v1.y)")
    bb4.v2 = bb3
    print("bb4.v2.x =\(bb4.v2.x)")
    print("bb4.v2.y =\(bb4.v2.y)")
    print("bb4.v1.x =\(bb4.v1.x)") // Swift漂亮的地方
    print("bb4.v1.y =\(bb4.v1.y)")
    var bb5 = bb4.v2 // bb5 is a struct(MyClass3)'
    print("bb4.v1.x =\(bb4.v1.x)")
    print("bb4.v1.y =\(bb4.v1.y)")
    print("bb5.x =\(bb5.x)")
    print("bb5.y =\(bb5.y)")
    print("----------")
    var ss1 = MyScore()
    ss1.x = 100
    ss1.y = 90
    ss1.z = 70
    print(ss1.sum)
    print(ss1.avg)
    print("-----Property Observer----------")
    var ss5 = MyClass5()
    print(ss5.x)
    ss5.x = 123
}
// 身份證字號
// 四個建構式:init() init(Bool) init(Int) init(Bool, Int) init(String)
struct AudioChannel {
    static let thresholdLevel = 10
    static var maxInputLevelForAllChannels = 0
    var currentLevel: Int = 0 {
        didSet {
            if currentLevel > AudioChannel.thresholdLevel {
                // cap the new audio level to the threshold level
                currentLevel = AudioChannel.thresholdLevel
            }
            if currentLevel > AudioChannel.maxInputLevelForAllChannels {
                // store this as the new overall maximum input level
                AudioChannel.maxInputLevelForAllChannels = currentLevel
            }
        }
    }
}
func myExercise() {
    var leftChannel = AudioChannel()
    var rightChannel = AudioChannel()
    
    leftChannel.currentLevel = 7
    print(leftChannel.currentLevel)
    // Prints "7"
    print(AudioChannel.maxInputLevelForAllChannels)
    // Prints "7
    
    rightChannel.currentLevel = 11
    print(rightChannel.currentLevel)
    // Prints "10"
    print(AudioChannel.maxInputLevelForAllChannels)
    // Prints "10
}
