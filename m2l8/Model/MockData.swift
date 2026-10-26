import Foundation

struct MockData {
    var imageContent : String
    var imageAvatar : String
    var userName : String
    var content : String
    
    static func getData() -> [MockData] {
        [
            MockData(imageContent: "img1", imageAvatar:"avatar1", userName: "User Name", content: "aksfasf f fasf sf sdf a sfas dfasd df asf asf asdf as fs"),
            MockData(imageContent: "img2", imageAvatar:"avatar2", userName: "User Name2", content: "aksfasf f fasf sf sdf a sfas dfasd df asf asf asdf as fs"),
            MockData(imageContent: "img3", imageAvatar:"avatar1", userName: "User Name3", content: "aksfasf f fasf sf sdf a sfas dfasd df asf asf asdf as fs"),
            MockData(imageContent: "img4", imageAvatar:"avatar2", userName: "User Name4", content: "aksfasf f fasf sf sdf a sfas dfasd df asf asf asdf as fs"),
            MockData(imageContent: "img5", imageAvatar:"avatar1", userName: "User Name5", content: "aksfasf f fasf sf sdf a sfas dfasd df asf asf asdf as fs"),
        ]
    }
}
