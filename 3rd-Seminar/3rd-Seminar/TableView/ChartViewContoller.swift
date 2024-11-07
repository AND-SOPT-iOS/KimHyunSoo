import Foundation
import UIKit

final class ChartViewController: UIViewController {
    
    private let tableView = UITableView(frame: .zero, style: .plain)
    
    private let appList = App.sampleApps
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        setLayout()
        register()
        setDelegate()
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
        tableView.register(ChartCell.self, forCellReuseIdentifier: ChartCell.identifier)
    }
    
    private func setDelegate() {
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension ChartViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 88
    }
}

extension ChartViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return appList.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(
      withIdentifier: ChartCell.identifier,
      for: indexPath
    ) as? ChartCell else { return UITableViewCell() }
      cell.configurate(app: appList[indexPath.row])
    return cell
  }
}
