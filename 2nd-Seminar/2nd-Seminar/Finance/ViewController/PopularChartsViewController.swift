import UIKit

import SnapKit

protocol TableCellDelegate: AnyObject {
    func didTapCell(index: Int)
}

class PopularChartsViewController: UIViewController {
    
    private let tableView = UITableView(frame: .zero, style: .plain).then {
        $0.backgroundColor = .black
        
    }

    private let appList = PopularChartsApp.popularApps
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setLayout()
        register()
        setDelegate()
        
        //네비바 설정
        self.navigationController?.navigationBar.titleTextAttributes = [
            .foregroundColor: UIColor.white,
            .font: UIFont.boldSystemFont(ofSize: 18)
        ]
        self.navigationItem.title = "인기차트"
        view.backgroundColor = .black
        let backBarButtonItem = UIBarButtonItem(title: "금융", style: .plain, target: self, action: nil)
        self.navigationItem.backBarButtonItem = backBarButtonItem
        
    }
    
    
    private func setUI() {
        self.view.addSubview(tableView)
    }
    
    private func setLayout() {
        tableView.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
    }
    
    private func register() {
        tableView.register(PopularChartsTableCell.self, forCellReuseIdentifier: PopularChartsTableCell.identifier)
    }
    
    private func setDelegate() {
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension PopularChartsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 88
    }
}

extension PopularChartsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return appList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      guard let cell = tableView.dequeueReusableCell(
        withIdentifier: PopularChartsTableCell.identifier,
        for: indexPath
      ) as? PopularChartsTableCell else { return UITableViewCell() }
        cell.delegate = self
        cell.configurate(app: appList[indexPath.row], index: indexPath.row)
      return cell
    }
  }

extension PopularChartsViewController: TableCellDelegate {
    func didTapCell(index: Int) {
        if (appList[index].title == "토스") {
            let nextViewController = TossController()
            navigationController?.pushViewController(nextViewController, animated: true)
        }
    }
}
