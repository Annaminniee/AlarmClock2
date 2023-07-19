import UIKit
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

class AlarmClock {
    var timer: Timer?
    var count = 0
    var limit = 0
    
    func start() {
        timer = Timer.scheduledTimer(
            timeInterval: 1,
            target: self,
            selector: #selector(countup),
            userInfo: nil,
            repeats: true)
    }
    
    @objc func countup() {
        count += 1
        let hour = count / 60
        let min = count % 60
        if setLimit == 0 {
            print("起床時間が設定されていません！")
            timer?.invalidate()
        } else if limit == count {
            print("朝です。起きてください！現在\(hour)時\(min)分です。")
           
            timer?.invalidate()
        } else {
            print("現在\(hour)時\(min)分です。")
        }
    }
}
let alarmClock = AlarmClock()

let setLimit = 120
alarmClock.limit = setLimit
print("起床時間は\(setLimit / 60)時に設定します。")

alarmClock.start()
print("アラームをセットします。")
