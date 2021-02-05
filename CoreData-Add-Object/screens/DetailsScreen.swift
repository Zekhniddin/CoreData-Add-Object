//
//  DetailsScreen.swift
//  CoreData-Add-Object
//
//  Created by Зехниддин on 06/02/21.
//

import SwiftUI

struct DetailsScreen: View {
    @Environment(\.presentationMode) var presentation
    @Environment(\.managedObjectContext) var moc
    
    @State private var showingAlert = false
    
    @State private var firstname = ""
    @State private var lastname = ""
    @State private var gender = ""
    @State private var phone = ""
    @State private var email = ""
    @State private var address = ""
    
    let genders = ["Male", "Female"]
    
    func saveStudent(firstname: String, lastname: String, gender: String, phone: String, email: String, address: String) {
        let student = Student(context: self.moc)
        student.id = UUID()
        student.firstname = firstname
        student.lastname = lastname
        student.gender = gender
        student.phone = phone
        student.email = email
        student.address = address
        try? self.moc.save()
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Firstname", text: $firstname)
                    TextField("Lastname", text: $lastname)
                    Picker(selection: $gender, label: Text("Gender").fontWeight(.bold)) {
                        ForEach(genders, id: \.self) {
                            Text($0)
                        }
                    }
                }
                
                Section {
                    TextField("Phone", text: $phone)
                    TextField("Email", text: $email)
                    TextField("Address", text: $address)
                }
            }
            .navigationBarTitle("Add Student", displayMode: .inline)
            .navigationBarItems(trailing:
                                    Button(action: {
                                        if firstname.isEmpty || lastname.isEmpty || gender.isEmpty || phone.isEmpty || email.isEmpty || address.isEmpty {
                                            showingAlert.toggle()
                                        } else {
                                            saveStudent(firstname: firstname, lastname: lastname, gender: gender, phone: phone, email: email, address: address)
                                            presentation.wrappedValue.dismiss()
                                        }
                                    }) {
                                        Text("Add")
                                            .fontWeight(.semibold)
                                            .font(.system(size: 18))
                                    })
            .alert(isPresented: $showingAlert) {
                Alert(title: Text("Ma'lumotlar oxirigacha to'ldirilmagan!"),
                      primaryButton: .destructive(Text("Back")) {
                        presentation.wrappedValue.dismiss()
                      },
                      secondaryButton: .default(Text("OK")))
            }
            
        }
    }
}

struct DetailsScreen_Previews: PreviewProvider {
    static var previews: some View {
        DetailsScreen()
    }
}
