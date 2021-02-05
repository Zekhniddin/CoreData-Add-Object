//
//  ContentView.swift
//  CoreData-Add-Object
//
//  Created by Зехниддин on 06/02/21.
//

import SwiftUI

struct ContentView: View {
    @FetchRequest(entity: Student.entity(), sortDescriptors: []) var students: FetchedResults<Student>
    
    @State private var showingDetailScreen = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(students, id: \.id) {
                    ItemCell(student: $0)
                }
            }
            .listStyle(PlainListStyle())
            .navigationBarTitle("Student List", displayMode: .inline)
            .navigationBarItems(trailing:
                                    Button(action: {
                                        showingDetailScreen = true
                                    }) {
                                        Text("Add")
                                            .fontWeight(.semibold)
                                            .font(.system(size: 18))
                                    })
            .sheet(isPresented: $showingDetailScreen) {
                DetailsScreen()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
