//
//  Home.swift
//  FacebookClone
//
//  Created by Maliks on 01/04/2024.
//

import SwiftUI
import SDWebImageSwiftUI

struct Home: View {
    
    var screen = NSScreen.main!.visibleFrame
    
    @State var selectedTab = "house.fill"
    @Namespace var animation
    
    var body: some View {
        VStack {
            ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom)) {
                HStack {
                    Text("facebook Clone")
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                        .foregroundStyle(.blue.opacity(0.7))
                    
                    Spacer()
                    
                    Button(action: {}) {
                        HStack {
                            Image("logo")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 35, height: 35)
                                .clipShape(Circle())
                            
                            Text("Steve Rogers")
                                .foregroundStyle(.black)
                            
                        }
                    }
                    .buttonStyle(PlainButtonStyle())
                    
                    Button(action: {}) {
                        Image(systemName: "magnifyingglass")
                            .font(.system(size: 16, weight: .bold))
                            .foregroundStyle(.black)
                            .padding(10)
                            .background(.gray.opacity(0.2))
                            .clipShape(Circle())
                    }
                    .buttonStyle(PlainButtonStyle())
                    .padding(.leading, 8)
                    
                    Button(action: {}) {
                        Image(systemName: "message")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 20, height: 20)
                            .foregroundStyle(Color("messenger"))
                            .padding(10)
                            .background(.gray.opacity(0.2))
                            .clipShape(Circle())
                    }
                    .buttonStyle(PlainButtonStyle())
                }
                .padding(.vertical)
                .padding(.leading, 10)
                .padding(.trailing)
                .padding(.top, 12)
                .background(.white)
                .shadow(color: .black.opacity(0.08), radius: 5, x: 0, y: 5)
                
                HStack {
                    TabButton(image: "house.fill", animation: animation, selected: $selectedTab)
                    TabButton(image: "play.tv", animation: animation, selected: $selectedTab)
                    TabButton(image: "person.circle", animation: animation, selected: $selectedTab)
                    TabButton(image: "person.3.fill", animation: animation, selected: $selectedTab)
                    TabButton(image: "bell", animation: animation, selected: $selectedTab)
                    TabButton(image: "line.horizontal.3", animation: animation, selected: $selectedTab)
                }
            }
            
            HStack {
                SideTabView()
                
                PostView()
                
                ContactView()
            }
            .frame(maxHeight: .infinity)
        }
        .ignoresSafeArea(.all, edges: .all)
        .frame(width: screen.width / 1.4, height: screen.height - 60)
        .background(.blue.opacity(0.07))
        .preferredColorScheme(.light)
    }
}

struct PostView: View {
    
    @State var post = ""
    
    var body: some View {
        ScrollView {
            VStack {
                VStack {
                    HStack {
                        Image("logo")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 35, height: 35)
                            .clipShape(Circle())
                        
                        TextField("What's in your mind", text: $post)
                            .textFieldStyle(PlainTextFieldStyle())
                    }
                    
                    Divider()
                    
                    HStack {
                        Button(action: {}) {
                            Label {
                                Text("Live")
                                    .foregroundStyle(.black)
                            } icon: {
                                Image(systemName: "video.fill")
                                    .foregroundStyle(.red)
                            }
                            .frame(maxWidth: .infinity)
                        }
                        .buttonStyle(PlainButtonStyle())
                        
                        Divider()
                            .padding(.vertical, -5)
                        
                        Button(action: {}) {
                            Label {
                                Text("Photos")
                                    .foregroundStyle(.black)
                            } icon: {
                                Image(systemName: "photo.on.rectangle")
                                    .foregroundStyle(.green)
                            }
                            .frame(maxWidth: .infinity)
                        }
                        .buttonStyle(PlainButtonStyle())
                        
                        Divider()
                            .padding(.vertical, -5)
                        
                        Button(action: {}) {
                            Label {
                                Text("Room")
                                    .foregroundStyle(.black)
                            } icon: {
                                Image(systemName: "video.fill.badge.plus")
                                    .foregroundStyle(.purple)
                            }
                            .frame(maxWidth: .infinity)
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                }
                .padding(10)
                .background(.white)
                .cornerRadius(10)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        Button(action: {}) {
                            Label {
                                Text("Create Room")
                            } icon: {
                                Image(systemName: "video.badge.plus")
                                    .foregroundStyle(.purple)
                            }
                            .padding(10)
                            .background(Capsule().strokeBorder(.purple))
                        }
                        .buttonStyle(PlainButtonStyle())
                        
                        ForEach(users) { user in
                            ZStack(alignment: Alignment(horizontal: .trailing, vertical: .bottom), content: {
                                WebImage(url: URL(string: user.url)!)
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 35, height: 35)
                                    .clipShape(Circle())
                                
                                Circle()
                                    .fill(.green)
                                    .frame(width: 10, height: 10)
                            })
                        }
                    }
                    .padding()
                }
                .background(.white)
                .cornerRadius(10)
                
                ForEach(posts) { post in
                    PostCardView(post: post)
                }
            }
            .padding()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct TabButton: View {
    
    var image: String
    var animation: Namespace.ID
    
    @Binding var selected: String
    
    var body: some View {
        Button(action: { withAnimation { selected = image } }) {
            VStack(spacing: 0) {
                Image(systemName: image)
                    .font(.title)
                    .foregroundStyle(selected == image ? Color("messenger") : Color.gray.opacity(0.7))
                    .frame(height: 40)
                
                ZStack {
                    Capsule()
                        .fill(.clear)
                        .frame(width: 65, height: 3)
                        .matchedGeometryEffect(id: "Tab", in: animation)
                    
                    if selected == image {
                        Capsule()
                            .fill(Color("messenger"))
                            .frame(width: 65, height: 3)
                            .matchedGeometryEffect(id: "Tab", in: animation)
                    }
                }
            }
        }
        .buttonStyle(PlainButtonStyle())
    }
}

struct SideTabButton: View {
    
    var image: String
    var title: String
    var color: String
    var isSystem: Bool
    
    var body: some View {
        Button(action: {}) {
            HStack(spacing: 8) {
                if isSystem {
                    Image(systemName: image)
                        .font(.system(size: 25))
                        .foregroundStyle(Color(color))
                        .frame(width: 25)
                }
                else {
                    Image(image)
                        .resizable()
                        .renderingMode(color == "" ? .original : .template)
                        .foregroundStyle(Color(color))
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 25, height: 25)
                }
                
                Text(title)
                    .foregroundStyle(.black)
            }
            .padding(.horizontal)
        }
        .buttonStyle(PlainButtonStyle())
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct SideTabView: View {
    
    var screen = NSScreen.main!.visibleFrame
    
    var body: some View {
        VStack(spacing: 18) {
            SideTabButton(image: "logo", title: "Steve Rogers", color: "", isSystem: false)
                .padding(.top, 20)
            SideTabButton(image: "shield.checkerboard", title: "Covid 19 Info Center", color: "covid", isSystem: true)
            SideTabButton(image: "person.2.fill", title: "Friends", color: "friends", isSystem: true)
            SideTabButton(image: "message", title: "Messenger", color: "messenger", isSystem: true)
            SideTabButton(image: "flag.fill", title: "Pages", color: "pages", isSystem: true)
            SideTabButton(image: "cart.circle.fill", title: "MarketPlace", color: "messenger", isSystem: true)
            SideTabButton(image: "play.tv", title: "Watch", color: "messenger", isSystem: true)
            SideTabButton(image: "calendar", title: "Events", color: "events", isSystem: true)
            
            Spacer()
        }
        .frame(maxWidth: (screen.width / 1.8) / 4, maxHeight: .infinity)
    }
}

struct ContactView: View {
    
    var screen = NSScreen.main!.visibleFrame
    
    var body: some View {
        VStack {
            HStack {
                Text("Contacts")
                    .fontWeight(.bold)
                    .foregroundStyle(.gray)
                
                Spacer()
                
                Button(action: {}) {
                    Image(systemName: "magnifyingglass")
                        .foregroundStyle(.gray)
                }
                .buttonStyle(PlainButtonStyle())
                
                Button(action: {}) {
                    Image(systemName: "slider.vertical.3")
                        .foregroundStyle(.gray)
                }
                .buttonStyle(PlainButtonStyle())
            }
            .padding()
            
            ScrollView {
                ForEach(users) { user in
                    HStack {
                        WebImage(url: URL(string: user.url)!)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 35, height: 35)
                            .clipShape(Circle())
                        
                        Text(user.name)
                            .foregroundStyle(.black)
                        
                        Spacer()
                    }
                    .padding(.horizontal)
                }
            }
        }
        .frame(maxWidth: (screen.width / 1.8) / 4, maxHeight: .infinity)
    }
}

struct PostCardView: View {
    
    var post: Post
    
    var body: some View {
        VStack {
            HStack {
                WebImage(url: URL(string: post.user.url)!)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 35, height: 35)
                    .clipShape(Circle())
                
                VStack(alignment: .leading, spacing: 5) {
                    Text(post.user.name)
                        .foregroundStyle(.black)
                    
                    HStack(spacing: 5) {
                        Text(post.postTime)
                            .foregroundStyle(.gray)
                        
                        Circle()
                            .fill(.gray)
                            .frame(width: 3, height: 3)
                        
                        Image(systemName: "globe")
                            .foregroundStyle(.gray)
                    }
                }
                
                Spacer()
                
                Button(action: {}) {
                    Image(systemName: "ellipsis")
                        .aspectRatio(contentMode: .fill)
                        .foregroundStyle(.black)
                }
                .buttonStyle(PlainButtonStyle())
            }
            .padding(.horizontal, 10)
            
            Text(post.title)
                .foregroundStyle(.black)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 10)
            
            WebImage(url: URL(string: post.imageUrl)!)
                .resizable()
                .aspectRatio(contentMode: .fill)
            
            HStack {
                Image(systemName: "hand.thumbsup.fill")
                    .foregroundStyle(Color("messenger"))
                
                Text("\(post.likes)")
                
                Spacer()
                
                Text("\(post.comments) Comments")
                    .foregroundStyle(.gray)
                
                Text("\(post.shares) Shares")
                    .foregroundStyle(.gray)
            }
            .padding(.horizontal, 10)
            .padding(.top, 5)
            
            HStack {
                Button(action: {}) {
                    Label {
                        Text("Like")
                    } icon: {
                        Image(systemName: "hand.thumbsup")
                    }
                    .foregroundStyle(.gray)
                    .frame(maxWidth: .infinity)
                }
                .buttonStyle(PlainButtonStyle())
                
                Divider()
                    .padding(.vertical, -5)
                
                Button(action: {}) {
                    Label {
                        Text("Comment")
                    } icon: {
                        Image(systemName: "arrow.up.message")
                    }
                    .foregroundStyle(.gray)
                    .frame(maxWidth: .infinity)
                }
                .buttonStyle(PlainButtonStyle())
                
                Divider()
                    .padding(.vertical, -5)
                
                Button(action: {}) {
                    Label {
                        Text("Share")
                    } icon: {
                        Image(systemName: "square.and.arrow.up")
                    }
                    .foregroundStyle(.gray)
                    .frame(maxWidth: .infinity)
                }
                .buttonStyle(PlainButtonStyle())
            }
            .padding(.horizontal, 10)
            .padding(.top, 10)
        }
        .padding(.vertical)
        .background(.white)
        .cornerRadius(10)
    }
    
}

#Preview {
    Home()
}
