//
//  ContentView.swift
//  task-6.5
//
//  Created by Mirzabek on 23/09/22.
//

import SwiftUI

struct ContentView: View {
    
    @FetchRequest(entity: Student.entity(), sortDescriptors: []) var students: FetchedResults<Student>
    @State var action:Bool = false
    var body: some View {
       
        NavigationView{
            List{
                ForEach(students, id: \.id){ student in
                    StudentCells(student: student)
                }
            }
            .navigationBarItems(trailing:
                                    
            Button(action: {
                self.action = true
            }, label: {
                Text("Add").fontWeight(.heavy)
            }).sheet(isPresented: $action, content: {
                Details()
            })
                                
            )
            .listStyle(PlainListStyle())
            .navigationBarTitle("Students List",displayMode: .inline)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
