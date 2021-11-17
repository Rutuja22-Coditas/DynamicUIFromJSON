

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
   let proTableView = UITableView()
    var screen = [Screen]()

    override func viewDidLoad() {
        super.viewDidLoad()
        JsonFetch()
        view.addSubview(proTableView)
       tablePosition()
        proTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        proTableView.dataSource = self
        proTableView.delegate = self
    }
    
    func tablePosition(){
        proTableView.translatesAutoresizingMaskIntoConstraints = false
        proTableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        proTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        proTableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        proTableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    }
 
    
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        screen[0].rows.count
        
    }

     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell",for: indexPath)
        cell.textLabel?.text = screen[0].rows[indexPath.row].title
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let row = screen[0].rows[indexPath.row]
//        if let action = row.action{
//            let ac = UIAlertController(title: action.title, message: action.message,preferredStyle: .alert)
//            ac.addAction(UIAlertAction(title: "ok", style: .default))
//            present(ac, animated: true)
//        }
        
        if row.action != nil{
            let newVC = UIViewController()
            //present(ac, animated: true)
            DispatchQueue.main.async {
                self.navigationController?.pushViewController(newVC, animated: true)

            }
            //let abc = (UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 500)))
            let label = UILabel(frame: CGRect(x: 120, y: 100, width: 150, height: 100))
            label.backgroundColor = .white
            label.text = row.action?.message
            label.textAlignment = .center
            newVC.view.addSubview(label)
        }
    }
    
    
    func JsonFetch(){
        let path = Bundle.main.path(forResource: "JsonData", ofType: "json")
        let url = URL(fileURLWithPath: path!)
        do{
            let data = try Data(contentsOf: url)
            let jsonData = try JSONDecoder().decode(Application.self, from : data)
            print("jsonData",jsonData.screens)
            screen = jsonData.screens
            print(type(of: jsonData))
            
        }
        catch{
            print("error", error)
        }
    }
    
}

