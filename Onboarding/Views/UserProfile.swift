//
//  UserProfile.swift
//  Onboarding
//
//  Created by Mac Pro on 13/08/23.
//

import SwiftUI

struct UserProfile: View {
    @State private var firstName = UserDefaults.standard.string(forKey: kFirstName) ?? ""
    @State private var lastName = UserDefaults.standard.string(forKey: kLastName) ?? ""
    @State private var email = UserDefaults.standard.string(forKey: kEmail) ?? ""
    @State private var phoneNumber = UserDefaults.standard.string(forKey: kEmail) ?? ""
    @State private var isEmailNotificationsChecked = false
    @State private var isOrderStatusesChecked = false
    @State private var isPasswordChangesChecked = false
    @State private var isSpecialOffersChecked = false
    @State private var isNewsletterChecked = false
    @State private var showAlert = false
    
    @Environment(\.presentationMode) var presentation
    
    var body: some View {
        
        VStack {
            VStack(alignment: .leading, spacing: 16) {
                Text("Personal Information")
                    .font(Font.custom("Karla", size: 16).weight(.bold))
                    .foregroundColor(.black)
                    .padding(.horizontal)
                
                HStack(spacing: 5) {
                    Button(action: {}) {
                        Image("profile-image-placeholder")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 83, height: 82)
                            .clipShape(Circle())
                            .padding(.horizontal)
                    }
                    
                    HStack {
                        Rectangle()
                            .foregroundColor(Color(red: 0.29, green: 0.37, blue: 0.34))
                            .frame(width: 79, height: 30)
                            .cornerRadius(5)
                            .overlay(
                                Text("Change")
                                    .font(Font.custom("Karla", size: 12).weight(.regular))
                                    .foregroundColor(.white)
                            )
                        
                        Rectangle()
                            .foregroundColor(.white)
                            .frame(width: 80, height: 30)
                            .cornerRadius(5)
                            .overlay(
                                RoundedRectangle(cornerRadius: 5)
                                    .inset(by: -0.5)
                                    .stroke(Color.black.opacity(0.25), lineWidth: 1)
                            )
                            .overlay(
                                Text("Remove")
                                    .font(Font.custom("Karla", size: 12).weight(.medium))
                                    .foregroundColor(Color(red: 0.29, green: 0.37, blue: 0.34))
                            )
                    }
                }
                
                TextFieldView(title: "First Name", placeholder: "", text: $firstName)
                    .padding(.horizontal)
                
                TextFieldView(title: "Last Name", placeholder: "", text: $lastName)
                    .padding(.horizontal)
                TextFieldView(title: "Email", placeholder: "", text: $email)
                    .padding(.horizontal)
                TextFieldView(title: "Phone Number", placeholder: "", text: $phoneNumber)
                    .padding(.horizontal)
            }
            
            VStack(alignment: .leading, spacing: 16) {
                Text("Email notifications")
                    .font(Font.custom("Karla", size: 16).weight(.bold))
                    .foregroundColor(.black)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                
                CheckBoxRow(title: "Order statuses", isChecked: $isOrderStatusesChecked)
                    .padding(.horizontal)
                CheckBoxRow(title: "Password changes", isChecked: $isPasswordChangesChecked)
                    .padding(.horizontal)
                CheckBoxRow(title: "Special offers", isChecked: $isSpecialOffersChecked)
                    .padding(.horizontal)
                CheckBoxRow(title: "Newsletter", isChecked: $isNewsletterChecked)
                    .padding(.horizontal)
                
            }
            
            VStack(spacing: 16) {
                RectangleButton(title: "Logout") {
                    presentation.wrappedValue.dismiss()
                }
                
                HStack(spacing: 16) {
                    Button(action: {
                        // Action for Discard Changes
                    }) {
                        ZStack {
                            Rectangle()
                                .foregroundColor(.clear)
                                .frame(width: 114, height: 30)
                                .background(.white)
                                .cornerRadius(5)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 5)
                                        .inset(by: 0.5)
                                        .stroke(Color.black.opacity(0.25), lineWidth: 1)
                                )
                            
                            Text("Discard Changes")
                                .font(.custom("Poppins", size: 12))
                                .foregroundColor(Color(red: 0.29, green: 0.37, blue: 0.34))
                        }
                    }
                    
                    Button(action: {
                        showAlert = true
                    }) {
                        ZStack {
                            Rectangle()
                                .foregroundColor(Color(red: 0.29, green: 0.37, blue: 0.34))
                                .frame(width: 114, height: 30)
                                .cornerRadius(5)
                            
                            Text("Save Changes")
                                .font(.custom("Poppins", size: 12))
                                .foregroundColor(.white)
                        }
                    }
                }
                }
            }
            .padding()
            .alert(isPresented: $showAlert) {
                Alert(
                    title: Text("Save Successful"),
                    message: Text("Your changes have been saved."),
                    dismissButton: .default(Text("OK"))
                )
            }
        }
//        .padding()
        
    }
//}


struct RectangleButton: View {
    var title: String
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Rectangle()
                .foregroundColor(Color(red: 0.96, green: 0.81, blue: 0.08))
                .frame(width: 216, height: 30)
                .cornerRadius(5)
                .overlay(
                    Text(title)
                        .font(
                            Font.custom("Karla", size: 12)
                                .weight(.medium)
                        )
                        .foregroundColor(.black)
                )
        }
    }
}

struct CheckBoxRow: View {
    let title: String
    @Binding var isChecked: Bool
    
    var body: some View {
        HStack(spacing: 10) {
            Image(systemName: isChecked ? "checkmark.square.fill" : "square")
                .foregroundColor(isChecked ? .green : .gray)
                .frame(width: 22, height: 22)
                .onTapGesture {
                    isChecked.toggle()
                }
            
            Text(title)
                .font(Font.custom("Karla", size: 10).weight(.regular))
                .foregroundColor(.black)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
        .onTapGesture {
            isChecked.toggle()
        }
    }
}

struct TextFieldView: View {
    let title: String
    let placeholder: String
    @Binding var text: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(title)
                .font(Font.custom("Karla", size: 12).weight(.light))
                .foregroundColor(Color(red: 0.29, green: 0.37, blue: 0.34))
            
            TextField(placeholder, text: $text)
                .frame(height: 41)
                .padding(.horizontal, 10)
                .background(Color.white)
                .cornerRadius(5)
                .shadow(color: .black.opacity(0.04), radius: 0.5, x: 0, y: 4)
        }
    }
}

struct RectangleButtonStyle: ButtonStyle {
    let isPrimary: Bool
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(height: 30)
            .foregroundColor(isPrimary ? .white : Color(red: 0.29, green: 0.37, blue: 0.34))
            .background(isPrimary ? Color(red: 0.29, green: 0.37, blue: 0.34) : Color.white)
            .cornerRadius(5)
            .overlay(
                RoundedRectangle(cornerRadius: 5)
                    .inset(by: isPrimary ? 0 : 0.5)
                    .stroke(Color.black.opacity(0.25), lineWidth: 1)
            )
    }
}

struct UserProfile_Previews: PreviewProvider {
    static var previews: some View {
        UserProfile()
    }
}
