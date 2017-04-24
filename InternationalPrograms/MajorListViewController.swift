//
//  MajorListViewController.swift
//  InternationalPrograms
//
//  Created by Tyler Richards on 4/2/17.
//  Copyright © 2017 Tyler Richards. All rights reserved.
//

import UIKit

class MajorListViewController: UITableViewController {
    var major = [String]()
    var majorNew: String = ""
    var desc = [String]()
    var descNew: String = ""
    
    @IBOutlet weak var majorDesc: UITextField!
    @IBOutlet weak var majorName: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        major = ["Accounting","Art","Athletic Training","Automotive Industry Management","Biology","Business Management","Chemistry","Civil Engineering Technology","Computer Information Systems","Construction Management","Economics","Engineering","English","Exercise Science, Health Promotion, and Recreation","History","Industrial Engineering","Mass Communications","Mathematics","Military Science and Leadership","Music","Nursing","Physics","Political Science","Psychology","Recreation","Social Work","Sociology","Spanish","World Language"]
        desc = [ "The goal of the Accounting minor is to provide a solid foundation in financial and managerial accounting systems.","The mission of the Department of Art is to prepare the student to be a practicing artist, to enter graduate school for further professional education or to enter the job market in art related careers." , "Athletic training is the prevention, evaluation, management and rehabilitation of injuries/illnesses to the athlete or the physically active. Completion of the CSU-Pueblo Athletic Training Program will prepare the athletic training student to challenge the Board of Certification (BOC) examination and the profession of athletic training." , "The major in automotive industry management leads to a Bachelor of Science (BS) Degree and is designed to prepare students for automotive industry management careers by providing management skills, supported by the business and technical background requisite for success in the automotive industry. The curriculum emphasizes personnel supervision, financial analysis, customer relations, warranty administration sales promotion, techniques of technical problem-solving, service management, marketing, merchandising and distribution methods used by the automotive aftermarket, automotive manufacturer and import industries." , "The Biology department offers a B.S. in Biology, and a minor in Biology. A graduate degree in chemistry is also offered." , "The major in Business Management leads to the Bachelor of Science in Business Administration (BSBA) and provides students with the theoretical and conceptual basis of business as well as application skills to assume leadership roles in industry, government and education.", "The major in chemistry leads to a bachelor of science (BS) degree. The chemistry curriculum is certified by the American Chemical Society." , "The major in civil engineering technology leads to a Bachelor of Science in Civil Engineering Technology (BSCET) Degree.  The major is designed to produce civil engineering technologists who (a) are capable of performing engineering surveys, (b) can perform standard analysis and design of elements of structures, water systems, and transportation systems, (c) are capable of conducting standard laboratory and field tests for construction materials and soils, and (d) are competent to function as construction project managers.  This program is accredited by the Technology Accreditation Commission of ABET." , "The goal of the Computer Information Systems is to provide a foundation of all computer skills, and help students narrow down their interests to emphasize in computer security, software and web application development, systems analysis and design, database design and development, or network design and administration." , "Construction Management combines the art and science of building technology with essential principles of business, management, computer technology and leadership. Construction Management involves the planning, scheduling, evaluation, and controlling of construction resources and activities, with optimization of project cost, schedule, quality, and owner’s satisfaction.", "The goal of the Economics minor is to provide students with an understanding of microeconomics and macroeconomics, income distribution, and the ability to apply such principles to current economic problems.", "The Department of Engineering at Colorado State University-Pueblo offers five engineering programs, including a minor and a graduate studies program.", "As a CSU-Pueblo English major, you will do more than read great books and write fiction and poetry. You'll learn how to think critically and to write persuasively-skills that benefit every aspect of life." , "Students completing the General Exercise Science coursework will be prepared for exercise and fitness related professional positions. This option is an excellent selection for students preparing for advance study in fields such as exercise physiology, allied health, or sport administration. Students will be eligible to sit for a variety of nationally recognized certification exams, including those offered by the American College of Sports Medicine, the American Council on Exercise, and the National Strength and Conditioning Association." , "The History undergraduate program at CSU-Pueblo offers a rigorous curriculum, emphasizing knowledge, communication, critical reasoning, research, and on-the-job experience." , "The Bachelor of Science in Industrial Engineering (BSIE) is a 4-year program that can be completed at CSU-Pueblo. As defined by the Institute of Industrial Engineers: Industrial engineering is concerned with the design, improvement and installation of integrated systems of people, materials, information, equipment, and energy. It draws upon specialized knowledge and skill in the mathematical and physical sciences, together with the principles and methods of engineering analysis and design, to specify, predict and evaluate the results to be obtained from such integrated systems." , "The Mass Communications Department and Center for New Media provides an applied major in which technological innovation finds meaning in a traditional humanities and social sciences curriculum." , "The major in mathematics leads to the degree of Bachelor of Arts (BA) or Bachelor of Science (BS). A flexible curriculum allows students to prepare for teaching careers, employment in areas such as actuarial science, computer science, engineering and statistics or graduate school." , "Army ROTC (Reserve Officers' Training Corps) is one of the best leadership courses in the country and is part of your college curriculum. During classes, leadership labs, physical training and field training exercises, you will learn firsthand what it takes to lead others, motivate groups and conduct missions as an Officer in the Army." , "Our Bachelor of Arts in Music degree provides a well-rounded education firmly rooted in the liberal arts tradition, with opportunities to specialize in Music Performance, Music Education, and/or minor in such areas as Music and Audio Production, Jazz Studies, Music Theory/Composition, or Organ Performance Studies." , "The mission of the School of Nursing is to prepare graduates for professional positions as safe, competent and caring nurses to meet the health care needs of diverse populations." , "The major in physics leads to a Bachelor of Science (BS) Degree. In addition, supporting courses and general education courses in physics and astronomy are available for students with a wide spectrum of interests, backgrounds and needs. Physics majors must consult with a program advisor as early as possible and must file a departmentally approved plan of study by the beginning of the junior year." , "The Colorado State University-Pueblo Political Science Program is intellectually diverse, methodologically rigorous, and dedicated to excellence in undergraduate instruction." , "A BA or BS in Psychology from CSU-Pueblo will provide you with a versatile degree that directly compliments your personal interests. Psychology is a field of inquiry which is called the science of behavior, and answers questions about how and why humans behave as they do." , "The Recreation Emphasis offers two concentration areas to choose from: Outdoor Leadership & Wilderness Education Recreation Management. Completion of the Recreation emphasis prepares graduates to work in positions of leadership in a variety of recreational service agencies.", " The program is committed to promoting social and economic justice through excellence, creativity, and innovation. Social Workers are dedicated to helping diverse individuals, families, groups, and communities to meet basic human needs.", "Sociology involves the study of the ways in which culture and social structure combine to shape people’s behaviors, attitudes, and beliefs. Sociologists examine the nature and dynamics of groups, organizations, institutions, subcultures, and societies.", "The goal of the Spanish minor program is to have our students achieve an intermediate degree of translingual and transcultural competency.", "Preparation in our Foreign Language Program allows students to function effectively in careers in teaching, business, the media, government, the arts, etc."]
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return major.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "majorCell", for: indexPath)
        
        cell.textLabel!.text = major[indexPath.row]
        cell.detailTextLabel!.text = desc[indexPath.row]
        return cell
    }
    @IBAction func addMajor(_ sender: Any) {
        majorNew = majorName.text!
        major.append(majorNew)
        descNew = majorDesc.text!
        desc.append(descNew)
        
        let alert = UIAlertController(title: "Success", message: "Thank you", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Click", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
 */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
