//
//  MenuOption.swift
//  Molhem1
//
//  Created by Arwamohammed07 on 24/10/1444 AH.
//
import Foundation
import Combine

import AVFoundation

// MARK: - Refined

struct MenuOptionRefine: Identifiable, Hashable {
    let id = UUID().uuidString
    let option: String
}
extension MenuOptionRefine {
    static let testSingleMenu: MenuOptionRefine = MenuOptionRefine(option: NSLocalizedString ("Project", comment: ""))
    static let testAllMenu: [MenuOptionRefine] = [
        MenuOptionRefine(option: NSLocalizedString ("Professional", comment: "")),
        MenuOptionRefine(option: NSLocalizedString ("Casual", comment: ""))
//        ,
//        MenuOptionRefine(option: "Investment"),
//        MenuOptionRefine(option: "Sports"),
//        MenuOptionRefine(option: "Hospitality")
    ]
    func speakOption() {
            let speechSynthesizer = AVSpeechSynthesizer()
            let speechUtterance = AVSpeechUtterance(string: option)
            speechUtterance.rate = 0.5 // Adjust the speech rate as desired
            speechSynthesizer.speak(speechUtterance)
        }
//    let singleMenu = MenuOptionRefine.testSingleMenu
//    singleMenu.speakOption() // Speak the "Project" menu option
//
//    let allMenu = MenuOptionRefine.testAllMenu
//    for menuOption in allMenu {
//        menuOption.speakOption() // Speak each menu option in the array
//    }
}

// MARK: - Generate


struct MenuOptionReCreate: Identifiable, Hashable {
    let id = UUID().uuidString
    let option: String
}
extension MenuOptionReCreate {
    static let testSingleMenu: MenuOptionReCreate = MenuOptionReCreate(option: NSLocalizedString ("Project", comment: ""))
    static let testAllMenu: [MenuOptionReCreate] = [
        MenuOptionReCreate(option: NSLocalizedString ("Happy", comment: "")),
        MenuOptionReCreate(option: NSLocalizedString ("Professional", comment: "")),
        MenuOptionReCreate(option: NSLocalizedString ("Casual", comment: ""))

    ]
    func speakOption() {
            let speechSynthesizer = AVSpeechSynthesizer()
            let speechUtterance = AVSpeechUtterance(string: option)
            speechUtterance.rate = 0.5 // Adjust the speech rate as desired
            speechSynthesizer.speak(speechUtterance)
        }
}

// MARK: - Generate

struct MenuOptionGenerate1: Identifiable, Hashable {
    let id = UUID().uuidString
    let option: String
}
extension MenuOptionGenerate1 {
    static let testSingleMenu: MenuOptionGenerate1 = MenuOptionGenerate1(option: NSLocalizedString ("I want", comment: ""))
    static let testAllMenu: [MenuOptionGenerate1] = [
        MenuOptionGenerate1(option: NSLocalizedString ("Idea", comment: "")),
        MenuOptionGenerate1(option: NSLocalizedString ("Name", comment: "")),
        MenuOptionGenerate1(option: NSLocalizedString ("Plan", comment: ""))

    ]
    func speakOption() {
            let speechSynthesizer = AVSpeechSynthesizer()
            let speechUtterance = AVSpeechUtterance(string: option)
            speechUtterance.rate = 0.5 // Adjust the speech rate as desired
            speechSynthesizer.speak(speechUtterance)
        }
}


struct MenuOptionGenerate2: Identifiable, Hashable {
    let id = UUID().uuidString
    let option: String
}
extension MenuOptionGenerate2 {
    static let testSingleMenu: MenuOptionGenerate2 = MenuOptionGenerate2(option: NSLocalizedString ("For", comment: ""))
    static let testAllMenu: [MenuOptionGenerate2] = [
        MenuOptionGenerate2(option: NSLocalizedString ("App", comment: "")),
        MenuOptionGenerate2(option: NSLocalizedString ("Book", comment: "")),
        MenuOptionGenerate2(option: NSLocalizedString ("Business", comment: "")),
        MenuOptionGenerate2(option: NSLocalizedString ("Website", comment: "")),
        MenuOptionGenerate2(option: NSLocalizedString ("Place", comment: "")),
        MenuOptionGenerate2(option: NSLocalizedString ("Social Media Post", comment: "")),
        MenuOptionGenerate2(option: NSLocalizedString ("Research Paper", comment: ""))
    ]
    func speakOption() {
            let speechSynthesizer = AVSpeechSynthesizer()
            let speechUtterance = AVSpeechUtterance(string: option)
            speechUtterance.rate = 0.5 // Adjust the speech rate as desired
            speechSynthesizer.speak(speechUtterance)
        }
}


struct MenuOptionbusiness: Identifiable, Hashable {
    let id = UUID().uuidString
    let option: String
}
extension MenuOptionbusiness {
    static let testSingleMenu: MenuOptionbusiness = MenuOptionbusiness(option: NSLocalizedString ("For", comment: ""))
    static let testAllMenu: [MenuOptionbusiness] = [
        MenuOptionbusiness(option: NSLocalizedString ("Historical Landmarks", comment: "")),
        MenuOptionbusiness(option: NSLocalizedString ("Local Festivals and Events", comment: "")),
        MenuOptionbusiness(option: NSLocalizedString ("Famous Personalities", comment: "")),
        MenuOptionbusiness(option: NSLocalizedString ("Local Cuisine and Food Culture", comment: "")),
        MenuOptionbusiness(option: NSLocalizedString ("Urban Development", comment: ""))
   
    ]
    func speakOption() {
            let speechSynthesizer = AVSpeechSynthesizer()
            let speechUtterance = AVSpeechUtterance(string: option)
            speechUtterance.rate = 0.5 // Adjust the speech rate as desired
            speechSynthesizer.speak(speechUtterance)
        }
}



// MARK: - 2030

struct MenuOptionRedSea: Identifiable, Hashable {
    let id = UUID().uuidString
    let option: String
}
extension MenuOptionRedSea {
    static let testSingleMenu: MenuOptionRedSea = MenuOptionRedSea(option: NSLocalizedString ("Project", comment: ""))
    static let testAllMenu: [MenuOptionRedSea] = [
        MenuOptionRedSea(option: NSLocalizedString ("Happy", comment: "")),
        MenuOptionRedSea(option: NSLocalizedString ("Sad", comment: "")),
        MenuOptionRedSea(option: NSLocalizedString ("Investment", comment: "")),
        MenuOptionRedSea(option: NSLocalizedString ("Sports", comment: "")),
        MenuOptionRedSea(option: NSLocalizedString ("Hospitality", comment: ""))
    ]
    func speakOption() {
            let speechSynthesizer = AVSpeechSynthesizer()
            let speechUtterance = AVSpeechUtterance(string: option)
            speechUtterance.rate = 0.5 // Adjust the speech rate as desired
            speechSynthesizer.speak(speechUtterance)
        }
}

struct MenuOptionDiriyahGate: Identifiable, Hashable {
    let id = UUID().uuidString
    let option: String
}
extension MenuOptionDiriyahGate {
    static let testSingleMenu: MenuOptionDiriyahGate = MenuOptionDiriyahGate(option: NSLocalizedString ("Project", comment: ""))
    static let testAllMenu: [MenuOptionDiriyahGate] = [
        MenuOptionDiriyahGate(option: NSLocalizedString ("MenuOptionDiriyahGate", comment: "")),
        MenuOptionDiriyahGate(option: NSLocalizedString ("Sad", comment: "")),
        MenuOptionDiriyahGate(option: NSLocalizedString ("Investment", comment: "")),
        MenuOptionDiriyahGate(option: NSLocalizedString ("Sports", comment: "")),
        MenuOptionDiriyahGate(option: NSLocalizedString ("Hospitality", comment: ""))
    ]
    func speakOption() {
            let speechSynthesizer = AVSpeechSynthesizer()
            let speechUtterance = AVSpeechUtterance(string: option)
            speechUtterance.rate = 0.5 // Adjust the speech rate as desired
            speechSynthesizer.speak(speechUtterance)
        }
}

struct MenuOptionGreenRiyadh: Identifiable, Hashable {
    let id = UUID().uuidString
    let option: String
}
extension MenuOptionGreenRiyadh {
    static let testSingleMenu: MenuOptionGreenRiyadh = MenuOptionGreenRiyadh(option: NSLocalizedString ("Project", comment: ""))
    static let testAllMenu: [MenuOptionGreenRiyadh] = [
        MenuOptionGreenRiyadh(option: NSLocalizedString ("Happy", comment: "")),
        MenuOptionGreenRiyadh(option: NSLocalizedString ("Sad", comment: "")),
        MenuOptionGreenRiyadh(option: NSLocalizedString ("Investment", comment: "")),
        MenuOptionGreenRiyadh(option: NSLocalizedString ("Sports", comment: "")),
        MenuOptionGreenRiyadh(option: NSLocalizedString ("Hospitality", comment: ""))
    ]
    func speakOption() {
            let speechSynthesizer = AVSpeechSynthesizer()
            let speechUtterance = AVSpeechUtterance(string: option)
            speechUtterance.rate = 0.5 // Adjust the speech rate as desired
            speechSynthesizer.speak(speechUtterance)
        }
}


struct MenuOptionAMAALA: Identifiable, Hashable {
    let id = UUID().uuidString
    let option: String
}
extension MenuOptionAMAALA {
    static let testSingleMenu: MenuOptionAMAALA = MenuOptionAMAALA(option: "Project")
    static let testAllMenu: [MenuOptionAMAALA] = [
        MenuOptionAMAALA(option: NSLocalizedString ("Happy", comment: "")),
        MenuOptionAMAALA(option: NSLocalizedString ("Sad", comment: "")),
        MenuOptionAMAALA(option: NSLocalizedString ("Investment", comment: "")),
        MenuOptionAMAALA(option: NSLocalizedString ("Sports", comment: "")),
        MenuOptionAMAALA(option: NSLocalizedString ("Hospitality", comment: ""))
    ]
    func speakOption() {
            let speechSynthesizer = AVSpeechSynthesizer()
            let speechUtterance = AVSpeechUtterance(string: option)
            speechUtterance.rate = 0.5 // Adjust the speech rate as desired
            speechSynthesizer.speak(speechUtterance)
        }
}


struct MenuOptionNEOM: Identifiable, Hashable {
    let id = UUID().uuidString
    let option: String
}
extension MenuOptionNEOM {
    static let testSingleMenu: MenuOptionNEOM = MenuOptionNEOM(option: "Project")
    static let testAllMenu: [MenuOptionNEOM] = [
        MenuOptionNEOM(option: NSLocalizedString ("Happy", comment: "")),
        MenuOptionNEOM(option: NSLocalizedString ("Sad", comment: "")),
        MenuOptionNEOM(option: NSLocalizedString ("Investment", comment: "")),
        MenuOptionNEOM(option: NSLocalizedString ("Sports", comment: "")),
        MenuOptionNEOM(option: NSLocalizedString ("Hospitality", comment: ""))
    ]
    func speakOption() {
            let speechSynthesizer = AVSpeechSynthesizer()
            let speechUtterance = AVSpeechUtterance(string: option)
            speechUtterance.rate = 0.5 // Adjust the speech rate as desired
            speechSynthesizer.speak(speechUtterance)
        }
}


struct MenuOptionRiyadhArt: Identifiable, Hashable {
    let id = UUID().uuidString
    let option: String
}
extension MenuOptionRiyadhArt {
    static let testSingleMenu: MenuOptionRiyadhArt = MenuOptionRiyadhArt(option: "Project")
    static let testAllMenu: [MenuOptionRiyadhArt] = [
        MenuOptionRiyadhArt(option: NSLocalizedString ("Happy", comment: "")),
        MenuOptionRiyadhArt(option: NSLocalizedString ("Sad", comment: "")),
        MenuOptionRiyadhArt(option: NSLocalizedString ("Investment", comment: "")),
        MenuOptionRiyadhArt(option: NSLocalizedString ("Sports", comment: "")),
        MenuOptionRiyadhArt(option: NSLocalizedString ("Hospitality", comment: ""))
    ]
    func speakOption() {
            let speechSynthesizer = AVSpeechSynthesizer()
            let speechUtterance = AVSpeechUtterance(string: option)
            speechUtterance.rate = 0.5 // Adjust the speech rate as desired
            speechSynthesizer.speak(speechUtterance)
        }
}


struct MenuOptionQiddiyaProject: Identifiable, Hashable {
    let id = UUID().uuidString
    let option: String
}
extension MenuOptionQiddiyaProject {
    static let testSingleMenu: MenuOptionQiddiyaProject = MenuOptionQiddiyaProject(option: "Project")
    static let testAllMenu: [MenuOptionQiddiyaProject] = [
        MenuOptionQiddiyaProject(option: NSLocalizedString ("Happy", comment: "")),
        MenuOptionQiddiyaProject(option: NSLocalizedString ("Sad", comment: "")),
        MenuOptionQiddiyaProject(option: NSLocalizedString ("Investment", comment: "")),
        MenuOptionQiddiyaProject(option: NSLocalizedString ("Sports", comment: "")),
        MenuOptionQiddiyaProject(option: NSLocalizedString ("Hospitality", comment: ""))
    ]
    func speakOption() {
            let speechSynthesizer = AVSpeechSynthesizer()
            let speechUtterance = AVSpeechUtterance(string: option)
            speechUtterance.rate = 0.5 // Adjust the speech rate as desired
            speechSynthesizer.speak(speechUtterance)
        }
}
