//
//  SortFilterMapArrays#.swift
//  MySwiftUI (iOS)
//
//  Created by Dino Curic on 01.11.21.
//

import SwiftUI

struct SortUserModel: Identifiable {
    let id = UUID().uuidString
    let name: String
    let points: Int
    let isVerified: Bool
}

class ArrayModificationViewModel: ObservableObject {
    
    @Published var dataArray: [SortUserModel] = []
    @Published var filteredArray: [SortUserModel] = []
    
    init() {
        getUsers()
        updateUserArray()
    }
    
    func updateUserArray() {
        // MARK: Sort
        // Longer sorted version
        /*
         //        This is the long version which uses a closure to run some sorting logic on the array.
         //        filteredArray = dataArray.sorted(by: { user1, user2 in
         //            return user1.points > user2.points
         //        })
         //        This is the short and easy version.
         */
        filteredArray = dataArray.sorted { $0.points > $1.points }
        
        // MARK: Filter
//        This again is the long version.
//        filteredArray = dataArray.filter({ user in
//            return user.points > 50
//        })
        filteredArray = dataArray.filter { $0.points > 1 }  // Filter for Int values
//        You can also append filters like modifiers on views:
        filteredArray = dataArray
            .filter { $0.name.contains("i") } // Name contains i
            .filter { !$0.isVerified } // is not verified

        
    }
    
    func getUsers() {
        let user1 = SortUserModel(name: "Nick", points: 0, isVerified: false)
        let user2 = SortUserModel(name: "Joe", points: 50, isVerified: true)
        let user3 = SortUserModel(name: "Dino", points: 5, isVerified: true)
        let user4 = SortUserModel(name: "Belma", points: 15, isVerified: true)
        let user5 = SortUserModel(name: "Sefika", points: 100, isVerified: false)
        let user6 = SortUserModel(name: "Began", points: 73, isVerified: true)
        let user7 = SortUserModel(name: "Phillip", points: 0, isVerified: false)
        let user8 = SortUserModel(name: "Jonas", points: 0, isVerified: false)
        let user9 = SortUserModel(name: "Muhamed", points: 10, isVerified: true)
        let user10 = SortUserModel(name: "Franziska", points: 0, isVerified: true)
        self.dataArray.append(contentsOf: [user1,user2,user3,user4,user5,user6,user7,user8,user9,user10])
    }
}

struct SortFilterMapArrays_: View {
    @StateObject var vm = ArrayModificationViewModel()
    
    var body: some View {
                List(vm.filteredArray) { user in
                    VStack(alignment: .leading) {
                        Text(user.name)
                            .bold()
                        HStack {
                            Text("Points: \(user.points)")
                                .font(.subheadline)
                            Spacer()
                            if user.isVerified {
                                Image(systemName: "flame.fill")
                            }
                        }
                        .foregroundColor(.secondary)
                    }
                }
        }
}

struct SortFilterMapArrays__Previews: PreviewProvider {
    static var previews: some View {
        SortFilterMapArrays_()
    }
}
