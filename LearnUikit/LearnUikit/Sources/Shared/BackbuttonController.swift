import UIKit

extension UIViewController {
    func setCustomBackButton() {
        let backButton = UIBarButtonItem(image: UIImage(systemName: "chevron.left"), style: .plain, target: self, action: #selector(backButtonTapped))
        navigationItem.leftBarButtonItem = backButton
        backButton.tintColor = .black
    }

    @objc func backButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
}

