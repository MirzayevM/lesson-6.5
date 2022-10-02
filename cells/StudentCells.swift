//
//  StudentCells.swift
//  task-6.5
//
//  Created by Mirzabek on 23/09/22.
//

import SwiftUI

struct StudentCells: View {
    @Environment(\.managedObjectContext) var moc
    var student: Student
    var body: some View {
        
        HStack{
            VStack(alignment:.leading){
            
                HStack{
                    Text(student.firstName!)
                    Text(student.secondName!).fontWeight(.bold)
                }
                HStack{
                    Text(student.phone!)
                    Text("|")
                    Text(student.email!)
                }
                Text(student.addres!)
                

            }
            Spacer()
            Text(student.gander!).foregroundColor(.red)
            Button(action: {
                moc.delete(student)
            }, label: {
                Image(systemName: "trash.fill")
            })
        }.padding(.top,10).padding(.bottom,10)
    }
}

struct StudentCells_Previews: PreviewProvider {
    static var previews: some View {
        StudentCells(student: Student())
    }
}
