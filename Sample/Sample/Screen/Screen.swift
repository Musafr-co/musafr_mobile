//import SwiftUI
//
//struct TravelAppView: View {
//    var body: some View {
//        NavigationView {
//            ScrollView {
//                VStack(spacing: 20) {
//                    // Header
//                    headerView
//
//                    // Main promotion card
//                    promotionCard
//
//                    // Action buttons
//                    actionButtons
//
//                    // Top Restaurants section
//                    restaurantsSection
//                }
//                .padding(.horizontal, 16)
//                .padding(.top, 10)
//            }
//        }
//    }
//
//    private var headerView: some View {
//        HStack {
//            HStack(spacing: 12) {
//                // Profile image
//                Circle()
//                    .fill(Color.gray.opacity(0.3))
//                    .frame(width: 50, height: 50)
//                    .overlay(
//                        Image(systemName: "person.fill")
//                            .foregroundColor(.gray)
//                    )
//
//                VStack(alignment: .leading, spacing: 2) {
//                    HStack {
//                        Text("Hi Welcome")
//                            .font(.subheadline)
//                            .foregroundColor(.secondary)
//                        Text("👋")
//                    }
//                    HStack {
//                        Text("Zahid Rayan")
//                            .font(.headline)
//                            .fontWeight(.semibold)
//
//                        HStack(spacing: 4) {
//                            Image(systemName: "calendar")
//                                .font(.caption)
//                                .foregroundColor(.blue)
//                            Text("100")
//                                .font(.caption)
//                                .foregroundColor(.blue)
//                                .fontWeight(.medium)
//                        }
//                        .padding(.horizontal, 8)
//                        .padding(.vertical, 2)
//                        .background(Color.blue.opacity(0.1))
//                        .cornerRadius(12)
//                    }
//                }
//                Spacer()
//            }
//
//            HStack(spacing: 16) {
//                Button(action: {}) {
//                    Image(systemName: "heart")
//                        .font(.title2)
//                        .foregroundColor(.primary)
//                }
//
//                Button(action: {}) {
//                    Image(systemName: "bell")
//                        .font(.title2)
//                        .foregroundColor(.primary)
//                }
//            }
//        }
//    }
//
//    private var promotionCard: some View {
//        VStack(alignment: .leading, spacing: 12) {
//            Text("Packages from travel experts")
//                .font(.headline)
//                .fontWeight(.semibold)
//                .padding(.horizontal, 4)
//
//            ZStack {
//                RoundedRectangle(cornerRadius: 16)
//                    .fill(LinearGradient(
//                        colors: [Color.blue.opacity(0.8), Color.blue.opacity(0.6)],
//                        startPoint: .topLeading,
//                        endPoint: .bottomTrailing
//                    ))
//                    .frame(height: 180)
//
//                HStack {
//                    VStack(alignment: .leading, spacing: 8) {
//                        Text("Explore")
//                            .font(.subheadline)
//                            .foregroundColor(.white.opacity(0.9))
//
//                        Text("YOUR DREAM")
//                            .font(.title2)
//                            .fontWeight(.bold)
//                            .foregroundColor(.white)
//
//                        Text("DESTINATION")
//                            .font(.title2)
//                            .fontWeight(.bold)
//                            .foregroundColor(.yellow)
//
//                        HStack(spacing: 4) {
//                            Text("70%")
//                                .font(.largeTitle)
//                                .fontWeight(.bold)
//                                .foregroundColor(.white)
//                            VStack(alignment: .leading) {
//                                Text("Discount")
//                                    .font(.caption)
//                                    .foregroundColor(.white.opacity(0.9))
//                            }
//                        }
//
//                        Button(action: {}) {
//                            Text("Book Now")
//                                .font(.subheadline)
//                                .fontWeight(.medium)
//                                .foregroundColor(.blue)
//                                .padding(.horizontal, 20)
//                                .padding(.vertical, 8)
//                                .background(Color.white)
//                                .cornerRadius(20)
//                        }
//                    }
//                    .padding(.leading, 20)
//
//                    Spacer()
//
//                    // Illustration placeholder
//                    VStack {
//                        Circle()
//                            .fill(Color.white.opacity(0.2))
//                            .frame(width: 60, height: 60)
//                            .overlay(
//                                Image(systemName: "airplane")
//                                    .font(.title)
//                                    .foregroundColor(.white)
//                            )
//
//                        RoundedRectangle(cornerRadius: 8)
//                            .fill(Color.purple.opacity(0.7))
//                            .frame(width: 40, height: 50)
//                            .overlay(
//                                Image(systemName: "doc.text")
//                                    .foregroundColor(.white)
//                            )
//                    }
//                    .padding(.trailing, 20)
//                }
//            }
//        }
//    }
//
//    private var actionButtons: some View {
//        HStack(spacing: 12) {
//            ActionButton(
//                icon: "fork.knife",
//                title: "Reserve a Table",
//                color: .blue
//            )
//
//            ActionButton(
//                icon: "map",
//                title: "Plan a Trip",
//                color: .blue
//            )
//        }
//    }
//
//    private var restaurantsSection: some View {
//        VStack(alignment: .leading, spacing: 16) {
//            HStack {
//                Text("Top Restaurants")
//                    .font(.headline)
//                    .fontWeight(.semibold)
//
//                Spacer()
//
//                Button("See All") {
//                    // Action
//                }
//                .font(.subheadline)
//                .foregroundColor(.blue)
//            }
//
//            ScrollView(.horizontal, showsIndicators: false) {
//                HStack(spacing: 12) {
//                    RestaurantCard(
//                        name: "Nobu Doha",
//                        rating: 4.8,
//                        reviews: 532,
//                        address: "504 Corniche Road",
//                        priceRange: "300 - 500 QAR",
//                        starRating: 2,
//                        backgroundColor: .brown.opacity(0.3)
//                    )
//
//                    RestaurantCard(
//                        name: "Katara Hotel",
//                        rating: 4.7,
//                        reviews: 428,
//                        address: "504 Corniche",
//                        priceRange: "250 - 400 QAR",
//                        starRating: 3,
//                        backgroundColor: .blue.opacity(0.3)
//                    )
//                }
//                .padding(.horizontal, 4)
//            }
//        }
//    }
//}
//
//struct ActionButton: View {
//    let icon: String
//    let title: String
//    let color: Color
//
//    var body: some View {
//        Button(action: {}) {
//            VStack(spacing: 12) {
//                Image(systemName: icon)
//                    .font(.title2)
//                    .foregroundColor(.white)
//                    .frame(width: 24, height: 24)
//
//                Text(title)
//                    .font(.subheadline)
//                    .fontWeight(.medium)
//                    .foregroundColor(.white)
//                    .multilineTextAlignment(.center)
//            }
//            .frame(maxWidth: .infinity)
//            .frame(height: 100)
//            .background(
//                LinearGradient(
//                    colors: [color.opacity(0.8), color.opacity(0.6)],
//                    startPoint: .topLeading,
//                    endPoint: .bottomTrailing
//                )
//            )
//            .cornerRadius(16)
//        }
//    }
//}
//
//struct RestaurantCard: View {
//    let name: String
//    let rating: Double
//    let reviews: Int
//    let address: String
//    let priceRange: String
//    let starRating: Int
//    let backgroundColor: Color
//
//    var body: some View {
//        VStack(alignment: .leading, spacing: 0) {
//            // Image placeholder
//            ZStack(alignment: .topLeading) {
//                Rectangle()
//                    .fill(backgroundColor)
//                    .frame(width: 280, height: 140)
//                    .overlay(
//                        Image(systemName: "photo")
//                            .font(.title)
//                            .foregroundColor(.gray.opacity(0.5))
//                    )
//
//                HStack {
//                    Text("\(starRating) Star Hotel")
//                        .font(.caption)
//                        .fontWeight(.medium)
//                        .foregroundColor(.white)
//                        .padding(.horizontal, 8)
//                        .padding(.vertical, 4)
//                        .background(Color.black.opacity(0.6))
//                        .cornerRadius(12)
//
//                    Spacer()
//                }
//                .padding(12)
//            }
//
//            // Content
//            VStack(alignment: .leading, spacing: 8) {
//                HStack {
//                    Text(name)
//                        .font(.headline)
//                        .fontWeight(.semibold)
//
//                    Spacer()
//
//                    HStack(spacing: 2) {
//                        Image(systemName: "star.fill")
//                            .font(.caption)
//                            .foregroundColor(.yellow)
//
//                        Text("\(rating, specifier: "%.1f")")
//                            .font(.caption)
//                            .fontWeight(.medium)
//
//                        Text("(\(reviews))")
//                            .font(.caption)
//                            .foregroundColor(.secondary)
//                    }
//                }
//
//                HStack {
//                    Image(systemName: "location")
//                        .font(.caption)
//                        .foregroundColor(.secondary)
//
//                    Text(address)
//                        .font(.caption)
//                        .foregroundColor(.secondary)
//                }
//
//                Text(priceRange)
//                    .font(.subheadline)
//                    .fontWeight(.semibold)
//                    .foregroundColor(.primary)
//            }
//            .padding(12)
//        }
//        .frame(width: 280)
//        .cornerRadius(16)
//        .shadow(color: .black.opacity(0.1), radius: 5, x: 0, y: 2)
//    }
//}
//
//#Preview {
//    TravelAppView()
//}
