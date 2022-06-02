import SwiftUI

func makegiverList(users: [User]) -> [User] {
    var giverlist: [User] = []
    users.forEach {
        if $0.giveMoney != nil {
            giverlist.append($0)
        }
    }
    return giverlist
}

struct GiverCard: View {
    var giverList: [User] = makegiverList(users: users)
    var ContentUser: User = user3
    var body: some View {
        ZStack {
            BasicRoundRec(color: .cardColor1)
            VStack {
                ForEach(giverList) {user in
                    if user.userName == ContentUser.userName {
                        Image(user.profileImage)
                            .resizable()
                            .frame(width: 50, height: 50)
                            .clipShape(Circle())
                            .overlay(Circle().stroke(.white, lineWidth: 2))
                        Text(user.userName)
                            .font(.system(size: 15, weight: .light))
                        Spacer().frame(height: 30)
                        Text("\(user.giveMoney!)원")
                            .font(.system(size: 20, weight: .heavy))
                    }
                }
                Spacer().frame(height: 10)
                VStack {
                    Image(systemName: "chevron.left.2")
                        .rotationEffect(.degrees(90))
                    Spacer().frame(height: 5)
                    Text("슬라이드해서 보내기")
                        .font(.system(size: 8, weight: .semibold))
                }
                .offset(y: 10)
                .opacity(0.35)
            }
            .foregroundColor(.white)
        }
    }
}

struct GiverCard_Previews: PreviewProvider {
    static var previews: some View {
        GiverCard()
    }
}
