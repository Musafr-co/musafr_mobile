//
//  bottomSheet.swift
//  Sample
//
//  Created by Mubeen on 14/07/2025.
//

import SwiftUI

struct BottomSheetView: View {
    @State private var textInput = ""
    @State private var selectedRadio = 0
    @State private var isCheckboxChecked = false
    @State private var isSwitchOn = false
    @State private var isLoading = false
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 20) {
                    // Label
                    LabelView()

                    // Edit Text
                    EditTextView(text: $textInput)

                    // Radio Buttons
                    RadioButtonView(selectedOption: $selectedRadio)

                    // Checkbox
                    CheckboxView(isChecked: $isCheckboxChecked)

                    // Switch
                    SwitchView(isOn: $isSwitchOn)

                    // Primary Button
                    PrimaryButtonView()

                    // Error Button
                    ErrorButtonView()

                    // Loading Indicator
                    LoadingIndicatorView(isLoading: $isLoading)

                    // Full Width Button
                    FullWidthButtonView()
                }
                .padding()
            }
            .navigationTitle("UI Elements")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Done") {
                        dismiss()
                    }
                }
            }
        }
        .presentationDetents([.medium, .large])
        .presentationDragIndicator(.visible)
    }
}

// MARK: - Individual UI Components

struct LabelView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Label Component")
                .font(.headline)
                .foregroundColor(.primary)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
    }
}

struct EditTextView: View {
    @Binding var text: String

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Edit Text")
                .font(.headline)

            TextField("Enter your text here...", text: $text)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal, 4)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct RadioButtonView: View {
    @Binding var selectedOption: Int
    let options = ["Option 1", "Option 2", "Option 3"]

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Radio Buttons")
                .font(.headline)

            ForEach(0..<options.count, id: \.self) { index in
                Button(action: {
                    selectedOption = index
                }) {
                    HStack {
                        Image(systemName: selectedOption == index ? "largecircle.fill.circle" : "circle")
                            .foregroundColor(selectedOption == index ? .blue : .gray)
                        Text(options[index])
                            .foregroundColor(.primary)
                        Spacer()
                    }
                }
                .buttonStyle(PlainButtonStyle())
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct CheckboxView: View {
    @Binding var isChecked: Bool

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Checkbox")
                .font(.headline)

            Button(action: {
                isChecked.toggle()
            }) {
                HStack {
                    Image(systemName: isChecked ? "checkmark.square.fill" : "square")
                        .foregroundColor(isChecked ? .blue : .gray)
                    Text("Check this option")
                        .foregroundColor(.primary)
                    Spacer()
                }
            }
            .buttonStyle(PlainButtonStyle())
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct SwitchView: View {
    @Binding var isOn: Bool

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Switch")
                .font(.headline)

            HStack {
                Text("Enable notifications")
                    .foregroundColor(.primary)

                Spacer()

                Toggle("", isOn: $isOn)
                    .labelsHidden()
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct PrimaryButtonView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Primary Button")
                .font(.headline)

            Button("Primary Action") {
                // Primary button action
                print("Primary button tapped")
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(8)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct ErrorButtonView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Error Button")
                .font(.headline)

            Button("Error Action") {
                // Error button action
                print("Error button tapped")
            }
            .padding()
            .background(Color.red)
            .foregroundColor(.white)
            .cornerRadius(8)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct LoadingIndicatorView: View {
    @Binding var isLoading: Bool

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Loading Indicator")
                .font(.headline)

            HStack {
                Button(isLoading ? "Stop Loading" : "Start Loading") {
                    isLoading.toggle()
                }
                .padding(.horizontal, 16)
                .padding(.vertical, 8)
                .background(Color.gray.opacity(0.2))
                .cornerRadius(6)

                if isLoading {
                    ProgressView()
                        .scaleEffect(0.8)
                        .padding(.leading, 8)
                }

                Spacer()
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct FullWidthButtonView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Full Width Button")
                .font(.headline)

            Button("Full Width Action") {
                // Full width button action
                print("Full width button tapped")
            }
            .frame(maxWidth: .infinity)
            .padding()
            .background(Color.green)
            .foregroundColor(.white)
            .cornerRadius(8)
        }
    }
}
