import UIKit
import WMF

final class TalkPageHeaderView: SetupView {

    // MARK: - UI Elements

    lazy var typeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = UIFont.wmf_font(.semiboldFootnote, compatibleWithTraitCollection: traitCollection)
        label.adjustsFontForContentSizeCategory = true
        return label
    }()

    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 4
        label.font = UIFont.wmf_font(.boldTitle1, compatibleWithTraitCollection: traitCollection)
        label.adjustsFontForContentSizeCategory = true
        return label
    }()

    lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 3
        label.font = UIFont.wmf_font(.footnote)
        label.adjustsFontForContentSizeCategory = true
        return label
    }()

    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    lazy var horizontalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fill
        stackView.alignment = .top
        return stackView
    }()

    let horizontalContainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    lazy var verticalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 4
        stackView.distribution = .fill
        stackView.alignment = .top
        return stackView
    }()

    lazy var bottomSpacer: VerticalSpacerView = {
        let spacer = VerticalSpacerView.spacerWith(space: 2)
        spacer.translatesAutoresizingMaskIntoConstraints = false
        return spacer
    }()

    lazy var secondaryVerticalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 4
        stackView.distribution = .fill
        stackView.alignment = .top
        return stackView
    }()

    lazy var projectSourceContainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    lazy var projectImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    lazy var projectLanguageLabelContainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 2
        view.layer.borderWidth = 1
        return view
    }()

    lazy var projectLanguageLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        label.textAlignment = .center
        label.baselineAdjustment = .alignCenters
        label.font = UIFont.wmf_font(.mediumCaption2)
        label.adjustsFontForContentSizeCategory = true
        return label
    }()

    lazy var coffeeRollSpacer: VerticalSpacerView = {
        let view = VerticalSpacerView.spacerWith(space: 5)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    lazy var coffeeRollContainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    lazy var coffeeRollSeparator: VerticalSpacerView = {
        let view = VerticalSpacerView.spacerWith(space: 0.5)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    lazy var coffeeRollLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 2
        label.font = UIFont.wmf_font(.body)
        label.adjustsFontForContentSizeCategory = true
        return label
    }()

    lazy var coffeeRollReadMoreButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        let title = WMFLocalizedString("talk-pages-coffee-roll-read-more", value: "Read more", comment: "Title of user and article talk pages button to read more of the coffee roll.")
        button.setTitle(title, for: .normal)
        button.contentHorizontalAlignment = .trailing
        button.titleLabel?.font = UIFont.wmf_scaledSystemFont(forTextStyle: .body, weight: .medium, size: 15)
        button.titleLabel?.adjustsFontForContentSizeCategory = true
        return button
    }()

    // MARK: - Lifecycle

    override func setup() {
        // Primary data
        addSubview(verticalStackView)
        horizontalContainer.addSubview(horizontalStackView)

        verticalStackView.addArrangedSubview(horizontalContainer)
        horizontalStackView.addArrangedSubview(secondaryVerticalStackView)

        NSLayoutConstraint.activate([
            verticalStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            verticalStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            verticalStackView.topAnchor.constraint(equalTo: topAnchor, constant: 12),
            verticalStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),

            horizontalContainer.leadingAnchor.constraint(equalTo: verticalStackView.leadingAnchor),
            horizontalContainer.trailingAnchor.constraint(equalTo: verticalStackView.trailingAnchor),

            horizontalStackView.leadingAnchor.constraint(equalTo: horizontalContainer.readableContentGuide.leadingAnchor, constant: 8),
            horizontalStackView.trailingAnchor.constraint(equalTo: horizontalContainer.readableContentGuide.trailingAnchor, constant: -8),
            horizontalStackView.topAnchor.constraint(equalTo: horizontalContainer.topAnchor),
            horizontalStackView.bottomAnchor.constraint(equalTo: horizontalContainer.bottomAnchor)
        ])

        secondaryVerticalStackView.addArrangedSubview(typeLabel)
        secondaryVerticalStackView.addArrangedSubview(titleLabel)
        secondaryVerticalStackView.addArrangedSubview(descriptionLabel)

        // Article image, if available

        horizontalStackView.addArrangedSubview(imageView)

        let imageWidthConstraint = imageView.widthAnchor.constraint(equalToConstant: 98)
        let imageHeightConstraint = imageView.heightAnchor.constraint(equalToConstant: 98)
        imageWidthConstraint.priority = .required
        imageHeightConstraint.priority = .required

        NSLayoutConstraint.activate([
            imageWidthConstraint,
            imageHeightConstraint
        ])

        // User talk page source

        projectSourceContainer.addSubview(projectImageView)
        projectSourceContainer.addSubview(projectLanguageLabelContainer)
        projectLanguageLabelContainer.addSubview(projectLanguageLabel)

        NSLayoutConstraint.activate([
            projectLanguageLabelContainer.leadingAnchor.constraint(equalTo: projectLanguageLabel.leadingAnchor, constant: -3),
            projectLanguageLabelContainer.trailingAnchor.constraint(equalTo: projectLanguageLabel.trailingAnchor, constant: 3),
            projectLanguageLabelContainer.topAnchor.constraint(equalTo: projectLanguageLabel.topAnchor, constant: -5),
            projectLanguageLabelContainer.bottomAnchor.constraint(equalTo: projectLanguageLabel.bottomAnchor, constant: 5),

            projectImageView.heightAnchor.constraint(equalTo: projectLanguageLabelContainer.heightAnchor),
            projectImageView.widthAnchor.constraint(equalTo: projectImageView.widthAnchor),

            projectImageView.leadingAnchor.constraint(equalTo: projectSourceContainer.leadingAnchor),
            projectImageView.topAnchor.constraint(equalTo: projectSourceContainer.topAnchor, constant: 2),
            projectImageView.bottomAnchor.constraint(equalTo: projectSourceContainer.bottomAnchor, constant: -2),

            projectLanguageLabelContainer.leadingAnchor.constraint(equalTo: projectImageView.trailingAnchor, constant: 8),
            projectLanguageLabelContainer.topAnchor.constraint(equalTo: projectSourceContainer.topAnchor, constant: 2),
            projectLanguageLabelContainer.bottomAnchor.constraint(equalTo: projectSourceContainer.bottomAnchor, constant: -2)
        ])

        secondaryVerticalStackView.addArrangedSubview(projectSourceContainer)

        // Coffee Roll

        verticalStackView.addArrangedSubview(coffeeRollSpacer)
        verticalStackView.addArrangedSubview(coffeeRollContainer)

        coffeeRollContainer.addSubview(coffeeRollSeparator)
        coffeeRollContainer.addSubview(coffeeRollLabel)
        coffeeRollContainer.addSubview(coffeeRollReadMoreButton)

        NSLayoutConstraint.activate([
            coffeeRollSpacer.widthAnchor.constraint(equalTo: widthAnchor),

            coffeeRollSeparator.topAnchor.constraint(equalTo: coffeeRollContainer.topAnchor),
            coffeeRollSeparator.widthAnchor.constraint(equalTo: widthAnchor),

            coffeeRollContainer.leadingAnchor.constraint(equalTo: leadingAnchor),
            coffeeRollContainer.trailingAnchor.constraint(equalTo: trailingAnchor),

            coffeeRollLabel.leadingAnchor.constraint(equalTo: coffeeRollContainer.readableContentGuide.leadingAnchor, constant: 8),
            coffeeRollLabel.trailingAnchor.constraint(equalTo: coffeeRollContainer.readableContentGuide.trailingAnchor, constant: -8),
            coffeeRollLabel.topAnchor.constraint(equalTo: coffeeRollSeparator.topAnchor, constant: 12),
            coffeeRollLabel.bottomAnchor.constraint(equalTo: coffeeRollReadMoreButton.topAnchor, constant: -4),

            coffeeRollReadMoreButton.leadingAnchor.constraint(equalTo: coffeeRollContainer.readableContentGuide.leadingAnchor),
            coffeeRollReadMoreButton.trailingAnchor.constraint(equalTo: coffeeRollContainer.readableContentGuide.trailingAnchor),
            coffeeRollReadMoreButton.bottomAnchor.constraint(equalTo: coffeeRollContainer.bottomAnchor, constant: -8)
        ])

        verticalStackView.addArrangedSubview(bottomSpacer)

        NSLayoutConstraint.activate([
            bottomSpacer.widthAnchor.constraint(equalTo: verticalStackView.widthAnchor)
        ])
    }

    // MARK: - Overrides

    override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        guard !UIAccessibility.isVoiceOverRunning else {
            return super.point(inside: point, with: event)
        }

        let convertedPoint = convert(point, to: coffeeRollReadMoreButton)
        if coffeeRollReadMoreButton.point(inside: convertedPoint, with: event) {
            return true
        }

        return false
    }

    // MARK: - Public

    func configure(viewModel: TalkPageViewModel) {
        typeLabel.text = viewModel.pageType == .article ? CommonStrings.talkPageTitleArticleTalk.localizedUppercase : CommonStrings.talkPageTitleUserTalk.localizedUppercase
        titleLabel.text = viewModel.talkPageTitle
        descriptionLabel.text = viewModel.description

        if let coffeeRollText = viewModel.coffeeRollText {
            coffeeRollContainer.isHidden = false
            coffeeRollLabel.attributedText = coffeeRollText
            bottomSpacer.isHidden = true
        } else {
            coffeeRollContainer.isHidden = true
            bottomSpacer.isHidden = false            
        }

        if let leadImage = viewModel.leadImage {
            imageView.isHidden = false
            imageView.image = leadImage
        } else {
            imageView.isHidden = true
        }

        projectSourceContainer.isHidden = viewModel.pageType == .article

        if let projectSourceImage = viewModel.projectSourceImage {
            projectImageView.image = projectSourceImage
        }

        if let projectLanguage = viewModel.projectLanguage {
            projectLanguageLabel.text = projectLanguage.localizedUppercase
        }
    }

    func updateLabelFonts() {
        typeLabel.font = UIFont.wmf_font(.semiboldFootnote, compatibleWithTraitCollection: traitCollection)
        titleLabel.font = UIFont.wmf_font(.boldTitle1, compatibleWithTraitCollection: traitCollection)
        projectLanguageLabel.font = UIFont.wmf_font(.mediumCaption2, compatibleWithTraitCollection: traitCollection)
    }

}

extension TalkPageHeaderView: Themeable {

    func apply(theme: Theme) {
        typeLabel.textColor = theme.colors.secondaryText
        titleLabel.textColor = theme.colors.primaryText
        descriptionLabel.textColor = theme.colors.secondaryText

        projectImageView.tintColor = theme.colors.secondaryText
        projectLanguageLabel.textColor = theme.colors.secondaryText
        projectLanguageLabelContainer.layer.borderColor = theme.colors.secondaryText.cgColor

        // TODO: Use new Sepia `beige` for background color
        coffeeRollContainer.backgroundColor = .sepiaBase100

        coffeeRollSeparator.backgroundColor = theme.colors.tertiaryText
        coffeeRollReadMoreButton.setTitleColor(theme.colors.link, for: .normal)
    }

}