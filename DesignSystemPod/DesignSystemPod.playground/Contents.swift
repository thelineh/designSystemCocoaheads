import UIKit
import PlaygroundSupport
import DesignSystemPod

class TagViewController : UIViewController {

    lazy var stackView: UIStackView = {
        let stackView = UIStackView(frame: .zero)
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.alignment = .center
        stackView.spacing = 8
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    override func loadView() {
        let view = UIView()
        view.backgroundColor = GlobalConfiguration.configuration.color.primaryColor

        //-- Tag

        for type in TagType.allCases {
            let tag = TagView()
            tag.configure(with: type)
            stackView.addArrangedSubview(tag)
        }

        //-- -

        view.addSubview(stackView)

        stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true

        self.view = view
    }
}
// Present the view controller in the Live View window
PlaygroundPage.current.liveView = TagViewController()
