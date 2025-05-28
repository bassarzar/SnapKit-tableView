import UIKit

class TableViewController: UITableViewController {

    var players = [
        Player(name: "Morant", image: "Morant"),
        Player(name: "Jordan", image: "Jordan"),
        Player(name: "James", image: "James"),
        Player(name: "Curry", image: "Curry"),
        Player(name: "Kyrie", image: "Kyrie"),
        Player(name: "Edwards", image: "Edwards")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Players"
        tableView.register(PlayerTableViewCell.self, forCellReuseIdentifier: "Cell")
        tableView.rowHeight = 100
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addPlayer))
    }
    
    @objc func addPlayer() {
        players.append(Player(name: "New Player", image: "Avatar"))
        tableView.reloadData()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return players.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? PlayerTableViewCell else {
            return UITableViewCell()
        }
        
        let player = players[indexPath.row]
        cell.configure(with: player)
        return cell
    }


    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = ViewController()
        vc.player = players[indexPath.row]
        navigationController?.show(vc, sender: self)
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            players.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
}
