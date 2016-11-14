//
//  PedsQLData.swift
//  EoE_1
//
//  Created by SUN on 15/11/23.
//  Copyright © 2015年 SUN. All rights reserved.
//

import UIKit

class PedsQLData: NSObject {
    
    class sectionData {
        var title = String()
        var questions = [String]()
        
        init(title:String, questions:[String]){
            self.title = title
            self.questions = questions
        }
        
    }
    
    
    
    let Data = [
        sectionData(title: "About my symptoms I", questions: [
            "I have chest pain, ache, or hurt",
            "I have burning in my chest, mouth, or throat(heart burn)",
            "I have stomach aches or belly aches",
            "I throw up(vomit)",
            "I feel like I am going to throw up, but I don't(nausea)",
            "When I am eating food comes back up my throat"
            ]),
        
        sectionData(title: "About my Symtoms II", questions: [
            "I have trouble swallowing",
            "I feel like food gets stuck in my throat or chest",
            "I need to drink to help me swallow my food",
            "I need more time to eat than other teens my age"
            ]),
        
        sectionData(title: "About my treatment", questions: [
            "It is hard for me to remember to take my medicine",
            "I do not want to take my medicines",
            "I do not like going to the doctor",
            "I do not like getting an endoscopy(scope, EGD)",
            "I do not like getting allergy testing"
            ]),
        
        sectionData(title: "About my worry", questions: [
            "I worry about having EoE",
            "I worry about getting sick in front of other people",
            "I worry about what other people think about my because of EoE",
            "I worry about going to the doctor",
            "I worry about getting an endoscopy(scope, EGD)",
            "I worry about getting allergy testing"
            ]),
        
        sectionData(title: "How I talk to others", questions: [
            "I have trouble telling other people about EoE",
            "I have trouble talking to my parents about how I feel",
            "I have trouble talking to other adults about how I feel",
            "I have trouble talking to my friends about how I feel",
            "I have trouble talking to doctors or nurses about how I feel"
            ]),
        
        sectionData(title: "Food allergy", questions: [
            "Are there foods you are allergic to and can't eat?"
//            "If you answer No, then leave the next 2 sections BLANK and jump to *Feeding tube*"
            ]),
        
//        sectionData(title: "About My food and eating", questions: [
//            "It is hard not being allowed to eat some foods",
//            "It is hard for me not to sneak foods that I am allergic to",
//            "It is hard for me not to eat the same things as my family",
//            "It is hard for me not to eat the same things as my friends"
//            ]),
//        
//        sectionData(title: "About my feelings", questions: [
//            "I worry about eating foods I'm allergic to or not supposed to eat",
//            "I feel mad (get upset) about not eating foods I am allergic to or not supposed to eat",
//            "I feel sad about not eating foods I am allergic to or not supposed to eat"
//            ]),
//        
        
        
        sectionData(title: "Feeding tube", questions: [
            "Do you have a feeding tube in your nose or stomach?"
//            "If you answer No, then leave the following sections BLANK."
            ]),
        
//        sectionData(title: "About my feeding tube", questions: [
//            "It is hard for me to remember to use my feeding tube",
//            "It is hard for me to use my feeding tube"
//            ])
        

    ]
    
    let foodAllergyData = [
        sectionData(title: "About My food and eating", questions: [
            "It is hard not being allowed to eat some foods",
            "It is hard for me not to sneak foods that I am allergic to",
            "It is hard for me not to eat the same things as my family",
            "It is hard for me not to eat the same things as my friends"
            ]),
        
        sectionData(title: "About my feelings", questions: [
            "I worry about eating foods I'm allergic to or not supposed to eat",
            "I feel mad (get upset) about not eating foods I am allergic to or not supposed to eat",
            "I feel sad about not eating foods I am allergic to or not supposed to eat"
            ])
    ]
    
    
    let feedingTubeData = [
        sectionData(title: "About my feeding tube", questions: [
            "It is hard for me to remember to use my feeding tube",
            "It is hard for me to use my feeding tube"
            ])
    ]
    
    
    
    
    
    

}
