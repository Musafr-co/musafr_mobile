import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 22) {
                    // Header
                    HeaderView()

                    // Main Content
                    MainContentView()
                }
                .padding(.top)
            }
            .background(Color.white)
        }
    }
}

struct HeaderView: View {
    var body: some View {
        HStack(spacing: 10) {
            // Profile Image
            Image("profile")
                .resizable()
                .frame(width: 40, height: 40)
                .clipShape(Circle())
                .padding(.vertical, 8)

            // User Info
            VStack(alignment: .leading, spacing: 2) {
                HStack(alignment: .center, spacing: 4) {
                    Text("Hi Welcome ")
                        .font(.system(size: 14))
                        .foregroundColor(Color(hex: "A9AAAC"))

                    Image("waving_hand")
                        .resizable()
                        .frame(width: 14, height: 14)
                }

                HStack(spacing: 6) {
                    Text("User Name")
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundColor(Color(hex: "292D32"))

                    HStack(spacing: 4) {
                        Image("gift")
                            .resizable()
                            .frame(width: 12, height: 12)

                        Text("100")
                            .font(.system(size: 12, weight: .bold))
                            .foregroundColor(Color(hex: "0173A5"))
                    }
                    .padding(.horizontal, 4)
                    .padding(.vertical, 2)
                    .background(Color(hex: "0173A5").opacity(0.03))
                    .overlay(
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(Color(hex: "0173A5").opacity(0.26), lineWidth: 0.5)
                    )
                    .cornerRadius(16)
                }
            }

            Spacer()

            // Action Icons
            HStack(spacing: 10) {
                Image("fav_icon")
                    .resizable()
                    .frame(width: 20, height: 20)

                Image("notification")
                    .resizable()
                    .frame(width: 20, height: 20)
            }
        }
        .padding(.horizontal, 24)
        .frame(height: 56)
    }
}

struct MainContentView: View {
    @State private var currentPackagePage = 0
    @State private var currentRestaurantPage = 0

    var body: some View {
        VStack(spacing: 22) {

            // Packages Section
            PackagesSection(currentPage: $currentPackagePage)

            // Action Cards
            ActionCardsView()
            TopRestaurantsSection(currentPage: $currentRestaurantPage)
        }
    }
}

struct PackagesSection: View {
    @Binding var currentPage: Int
    let totalPages = 4

    var body: some View {
        VStack(spacing: 0) {
            // Header with pagination dots
            HStack {
                Text("Packages from travel experts")
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundColor(Color(hex: "292D32"))

                Spacer()

                // Pagination dots
                HStack(spacing: 4) {
                    ForEach(0..<totalPages, id: \.self) { index in
                        Capsule()
                            .fill(currentPage == index ? Color(hex: "0173A5") : Color(hex: "A9AAAC"))
                            .frame(width: currentPage == index ? 24 : 8, height: 8)
                            .animation(.easeInOut(duration: 0.3), value: currentPage)
                    }
                }
            }
            .padding(.horizontal, 24)
            .padding(.bottom, 8)

            // Image Pager
            TabView(selection: $currentPage) {
                ForEach(0..<totalPages, id: \.self) { index in
                    Image("image")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(height: 200)
                        .clipped()
                        .cornerRadius(12)

                        .padding(.horizontal, 32)
                        .tag(index)
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            .frame(height: 200)
        }
    }
}

struct ActionCardsView: View {
    var body: some View {
        HStack(spacing: 20) {
            ActionCard(
                title: "Reserve a Table",
                iconImage: "restaurant_icon",
                backgroundImage: "reseve_a_table"
            )

            ActionCard(
                title: "Plan a trip",
                iconImage: "trip_icon",
                backgroundImage: "trip_image"
            )
        }
        .padding(.horizontal, 24)
    }
}

struct ActionCard: View {
    let title: String
    let iconImage: String
    let backgroundImage: String

    var body: some View {
        ZStack {
            // Background Image
            Image(backgroundImage)
                .resizable()
                .aspectRatio(1, contentMode: .fill)
                .clipped()
                .cornerRadius(20)

            // Overlay for better text visibility
            Rectangle()
                .fill(Color.black.opacity(0.3))
                .cornerRadius(20)

            VStack(spacing: 6) {
                Image(iconImage)
                    .resizable()
                    .frame(width: 40, height: 40)

                Text(title)
                    .font(.system(size: 16, weight: .medium))
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
            }
            .padding(12)
        }
    }
}

struct TopRestaurantsSection: View {
    @Binding var currentPage: Int
    let totalPages = 4
    @State private var showBottomSheet = false

    var body: some View {
        VStack(spacing: 0) {
            // Header
            HStack {
                Text("Top Restaurants")
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundColor(Color(hex: "292D32"))

                Spacer()

                Text("See All")
                    .onTapGesture(perform: {
                        showBottomSheet = true
                    })
                    .font(.system(size: 14, weight: .medium))
                    .foregroundColor(Color(hex: "0173A5"))
                    .sheet(isPresented: $showBottomSheet) {
                                BottomSheetView()
                            }

            }
            .padding(.horizontal, 24)
            .padding(.bottom, 8)

            // Restaurant Cards Pager
            GeometryReader { geometry in
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 24) { // Corresponds to pageSpacing
                                ForEach(0..<5) { page in // Example with multiple pages
                                    RestaurantCard()
                                        .frame(width: geometry.size.width - (0 * 2)) // Width of the card itself
                                        // The 32 * 2 (or 64) is the total horizontal padding for the card.
                                        // This makes the card fill the screen minus the contentPadding.
                                        .scrollTransition(.animated) { content, phase in // iOS 17+ for nice transitions
                                            content
                                                .opacity(phase.isIdentity ? 1 : 0.7) // Dim non-active pages slightly
                                                .scaleEffect(phase.isIdentity ? 1 : 0.95) // Scale non-active pages slightly
                                        }
                                }
                            }
                            .padding(.horizontal, 0) // Corresponds to contentPadding
                            .scrollTargetLayout() // Makes .containerRelativeFrame or manual snapping work better
                        }
                        .scrollTargetBehavior(.viewAligned) // Enables snapping to the defined card boundaries
                    }
        }
    }
}

struct RestaurantCard: View {
    var body: some View {
        ZStack {
            // Background Image
            Image("cafe")
                .resizable()
                .aspectRatio(1.5, contentMode: .fill)
                .clipped()
                .cornerRadius(16)

            VStack {
                // Top Row
                HStack {
                    Text("2 Star Hotel")
                        .font(.system(size: 10, weight: .bold))
                        .foregroundColor(.white)
                        .padding(.horizontal, 8)
                        .padding(.vertical, 4)
                        .background(Color(hex: "FE3333").opacity(0.3))
                        .cornerRadius(6)

                    Spacer()

                    Image("fav_icon")
                        .resizable()
                        .frame(width: 20, height: 20)
                }

                Spacer()

                // Glassmorphic Card
                GlassmorphicHotelCard()
            }
            .padding(12)
        }
        .padding(.horizontal, 32)
    }
}

struct GlassmorphicHotelCard: View {
    var body: some View {
        ZStack {
            // Glassmorphic background
            RoundedRectangle(cornerRadius: 20)
                .fill(.ultraThinMaterial)
                .background(
                    LinearGradient(
                        colors: [
                            Color.white.opacity(0.3),
                            Color.white.opacity(0.1)
                        ],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
                .frame(height: 80)
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color.white.opacity(0.3), lineWidth: 1)
                )

            // Content
            VStack(spacing: 8) {
                HStack {
                    Text("Nobu Doha")
                        .font(.system(size: 20, weight: .semibold))
                        .foregroundColor(.white)

                    Spacer()

                    VStack(alignment: .trailing, spacing: 2) {
                        HStack(spacing: 4) {
                            Image(systemName: "star.fill")
                                .foregroundColor(Color(hex: "FFCD1A"))
                                .font(.system(size: 16))

                            Text("4.4")
                                .foregroundColor(Color(hex: "FFCD1A"))
                                .font(.system(size: 14))

                            Text("(532)")
                                .foregroundColor(.white)
                                .font(.system(size: 14))
                        }
                    }
                }

                HStack {
                    HStack(spacing: 4) {
                        Image(systemName: "location")
                            .foregroundColor(.white.opacity(0.8))
                            .font(.system(size: 16))

                        Text("504 Corniche Road")
                            .foregroundColor(.white)
                            .font(.system(size: 14))
                    }

                    Spacer()

                    VStack(alignment: .trailing, spacing: 8) {
                        Text("300 - 500 QAR")
                            .foregroundColor(.white)
                            .font(.system(size: 16, weight: .medium))

                        Text("Recommended For You")
                            .font(.system(size: 8))
                            .foregroundColor(.white.opacity(0.9))
                            .padding(.horizontal, 5)
                            .padding(.vertical, 1)
                            .background(Color.white.opacity(0.3))
                            .overlay(
                                RoundedRectangle(cornerRadius: 12)
                                    .stroke(Color.white.opacity(0.4), lineWidth: 0.5)
                            )
                            .cornerRadius(12)
                    }
                }
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 10)
        }
        .padding(.horizontal, 10)
        .padding(.vertical, 10)
    }
}

// Extension to create Color from hex
extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (1, 1, 1, 0)
        }

        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue:  Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}

// Preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
