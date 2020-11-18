import UIKit

extension UIViewController {
    public func showAlert(title: String, message: String){
        //let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let alert = TRSaldaViewAlertController(title: "Test", message: "Message", preferredStyle: .alert)
        //alert.addAction(UIAlertAction(title: "Tamam", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
