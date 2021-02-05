//
//  ItemCell.swift
//  CoreData-Add-Object
//
//  Created by Зехниддин on 06/02/21.
//

import SwiftUI

struct ItemCell: View {
    var student: Student
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                Text(student.firstname!)
                    .fontWeight(.bold)
                Text(student.lastname!)
                    .fontWeight(.bold)
                Spacer()
                Text(student.gender!)
                    .foregroundColor(.red)
            }
            .font(.system(size: 18))
            HStack(spacing: 12) {
                Text(student.phone!)
                Text("|")
                Text(student.email!)
            }
            .foregroundColor(.black)
            Text(student.address!)
                .foregroundColor(.black)
        }
    }
}

struct ItemCell_Previews: PreviewProvider {
    static var previews: some View {
        ItemCell(student: Student())
    }
}
