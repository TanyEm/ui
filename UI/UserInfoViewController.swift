
import UIKit

class UserInfoViewController: UIViewController {
    
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var birthdayField: UITextField!
    @IBOutlet weak var goNext: UIButton!
    @IBOutlet weak var datePicker: UITextField!
    
    let picker = UIDatePicker()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        createPicker()
    }
    
    @IBAction func moveToPhoneNumberToStartAgain(_ sender: Any) {
        performSegue(withIdentifier: "RegisterAgain", sender: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        nameField.layer.cornerRadius = 20
        let paddingName = UIView(frame: CGRect(x: 0,
                                               y: 0,
                                               width: 20,
                                               height: self.nameField.frame.height))
        nameField.leftView = paddingName
        nameField.leftViewMode = UITextField.ViewMode.always
        
        birthdayField.layer.cornerRadius = 20
        let paddingBirthday = UIView(frame: CGRect(x: 0,
                                               y: 0,
                                               width: 20,
                                               height: self.birthdayField.frame.height))
        birthdayField.leftView = paddingBirthday
        birthdayField.leftViewMode = UITextField.ViewMode.always
        
        goNext.layer.cornerRadius = 20
        
        // add image on the right side of text field
        let arrow = TextFieldArrowOnTheRightSide()
        arrow.makeArrow(field: birthdayField)
        
    }
    
    // MARK: - DatePicker and Formatter
    
    func createPicker() {
        birthdayField.inputView = picker
        picker.datePickerMode = .date
        picker.preferredDatePickerStyle = .compact
        
        picker.addTarget(self, action: #selector(datePickerChanged(date:)), for: .valueChanged)
    }
    
    @objc func datePickerChanged(date: UIDatePicker) {
        if date.isEqual(self.picker) {
            birthdayField.text = dateFormatter(str: date.date)
        } else {
            print(Error.self)
        }
    }
    
    func dateFormatter(str: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMM yyyy"
        let formattedString = dateFormatter.string(from: str)
        
        return formattedString
    }
    
}

extension UITextField {
    func setIcon(_ image: UIImage) {
        let iconView = UIImageView(frame: CGRect(x: 10, y: 5, width: 20, height: 20))
        iconView.image = image
        let iconContainerView: UIView = UIView(frame: CGRect(x: 20, y: 0, width: 30, height: 30))
        iconContainerView.addSubview(iconView)
        leftView = iconContainerView
        leftViewMode = .always
    }
}

