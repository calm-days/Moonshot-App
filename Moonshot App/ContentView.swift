

import SwiftUI

struct ContentView: View {
    
    let columns = [
        GridItem(.adaptive(minimum: 150)),
    ]
    @State private var showingListView = false
    
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")

    
    var body: some View {
        
        if !showingListView {
            NavigationView {
                ScrollView {
                    LazyVGrid(columns: columns) {
                        ForEach(missions) { misson in
                            NavigationLink {
                                MissionView(mission: misson, astronauts: astronauts)
                            } label: {
                                VStack {
                                    Image(misson.image)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 100, height: 100)
                                        .padding()
                                    
                                    VStack {
                                        Text(misson.displayName)
                                            .font(.headline)
                                            .foregroundColor(.white)
                                        Text(misson.formattedLaunchDate)
                                            .font(.caption)
                                            .foregroundColor(.white.opacity(0.5))
                                    }
                                    .padding(.vertical)
                                    .frame(maxWidth: .infinity)
                                    .background(.lightBackground)
                                }
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(.lightBackground)
                                
                                )
                                
                             
                            }
                            
                            
                        }
                    }
                    .padding([.horizontal, .bottom])
                    
 
                }
                .navigationTitle("Moonshot")
                .background(.darkBackground)
                
                .preferredColorScheme(.dark)
                .toolbar {
                    Button{
                       
                        showingListView.toggle()
                        
                    } label: {
                        Image(systemName: showingListView ? "circle.grid.2x2" : "list.bullet.circle")
                    }
                }
            }
            
        } else {
            NavigationView {
                List {
                    ForEach(missions) { misson in
                        NavigationLink {
                            MissionView(mission: misson, astronauts: astronauts)
                        } label: {
                            HStack {
                                Image(misson.image)
                                
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 45, height: 45)
                                    
                                    //.padding()
                                
                                VStack (alignment: .leading){
                                    Text(misson.displayName)
                                        .font(.headline)
                                        .foregroundColor(.white)
                                    Text(misson.formattedLaunchDate)
                                        .font(.caption)
                                        .foregroundColor(.white.opacity(0.5))
                                }
                                .padding(.vertical)
                                .frame(maxWidth: .infinity)
                                //.background(.lightBackground)
                                
                                
                            }
                            //.clipShape(RoundedRectangle(cornerRadius: 10))
                            //.overlay(
                               // RoundedRectangle(cornerRadius: 10)
                             //       .stroke(.lightBackground)
                            
                            //)
                            
                         
                        }
                        
                        
                    }
                    .listRowBackground(Color.darkBackground)
                }
                .listStyle(.automatic)
                

                .navigationTitle("Moonshot")
                
                .background(.darkBackground)
                .preferredColorScheme(.dark)
                .toolbar {
                    Button{
                       
                        showingListView.toggle()
                        
                    } label: {
                        Image(systemName: showingListView ? "circle.grid.2x2" : "list.bullet.circle")
                    }
                }
            }
        }
      
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
