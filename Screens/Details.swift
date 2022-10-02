//
//  Details.swift
//  task-6.5
//
//  Created by Mirzabek on 23/09/22.
//

import SwiftUI

struct Details: View {
    @Environment(\.presentationMode)  var presentation
    @Environment(\.managedObjectContext) var moc
    @State var name:String = ""
    @State var secondName = ""
    @State var phone:String = ""
    @State var email:String = ""
    @State var addres:String = ""
    @State var ganders:String = ""
    let genders = ["Male","Famale"]
    
    
    func saveRequests(firstName:String,secondName:String,gander:String,phone:String
                      ,email:String,addres:String){
   
        let student = Student(context: self.moc)
        student.id = UUID()
        student.firstName = firstName
        student.secondName = secondName
        student.gander = gander
        student.phone = phone
        student.email = email
        student.addres = addres
        try?  self.moc.save()
    }
    
    var body: some View {
        NavigationView{
            Form{
                Section{
                    TextField("FirstName",text: $name)
                    TextField("SecondName",text: $secondName)
                    Picker("Gander",selection: $ganders){
                        ForEach(genders,id: \.self){
                            Text($0)
                        }                    }
                }
                
                Section{
                    TextField("Phone",text: $phone)
                    TextField("Email",text: $email)
                    TextField("Addres",text: $addres)
                }
            }
            .navigationBarItems(trailing:
            Button(action: {

                saveRequests(firstName: name, secondName: secondName, gander: ganders, phone: phone, email: email, addres: addres)
                presentation.wrappedValue.dismiss()
            }, label: {
                Text("Add")
            })
            ).navigationBarTitle("Add Student",displayMode: .inline)
        }
        
    }
}

struct Details_Previews: PreviewProvider {
    static var previews: some View {
        Details()
    }
}
