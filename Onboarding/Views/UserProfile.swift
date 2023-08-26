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
    
    @Environment(\.presentationMode) var presentation
    
    var body: some View {
        VStack {
            HStack {
                //                Rectangle()
                //                    .foregroundColor(.clear)
                //                    .frame(width: 250, height: 40)
                //                    .background(
                //                        Image("Logo")
                //                            .resizable()
                //                            .aspectRatio(contentMode: .fill)
                //                            .frame(width: 185, height: 40)
                //                            .clipped()
                //                    )
                
                //                Rectangle()
                //                    .foregroundColor(.clear)
                //                    .frame(width: 6, height: 54)
                //                    .background(
                //                        Image("profile-image-placeholder")
                //                            .resizable()
                //                            .aspectRatio(contentMode: .fill)
                //                            .frame(width: 56, height: 54)
                //                            .clipped()
                //                    )
            }
            .padding(.bottom, 20)
            
            VStack(alignment: .leading, spacing: 16) {
                                Text("Personal Information")
                                    .font(Font.custom("Karla", size: 16).weight(.bold))
                                    .foregroundColor(.black)
                                    .padding(.horizontal)
                                
                                HStack(spacing: 1) {
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
                                TextFieldView(title: "Last Name", placeholder: "", text: $lastName)
                                TextFieldView(title: "Email", placeholder: "", text: $email)
                                TextFieldView(title: "Phone Number", placeholder: "", text: $phoneNumber)
                            }
                            
                            VStack(alignment: .leading, spacing: 16) {
                                Text("Email notifications")
                                    .font(Font.custom("Karla", size: 15).weight(.bold))
                                    .foregroundColor(.black)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                
                                CheckBoxRow(title: "Order statuses", isChecked: $isOrderStatusesChecked)
                                CheckBoxRow(title: "Password changes", isChecked: $isPasswordChangesChecked)
                                CheckBoxRow(title: "Special offers", isChecked: $isSpecialOffersChecked)
                                CheckBoxRow(title: "Newsletter", isChecked: $isNewsletterChecked)
                            }
                            
            VStack(spacing: 16) {
                                Rectangle()
                                    .foregroundColor(Color(red: 0.96, green: 0.81, blue: 0.08))
                                    .frame(width: 216, height: 30)
                                    .cornerRadius(5)
                                    .overlay(
                                        Text("Logout")
                                            .font(
                                                Font.custom("Poppins", size: 12)
                                                    .weight(.medium)
                                            )
                                            .foregroundColor(.black)
                                    )
                                
                
                                Button("Discard Changes") {
                                    // Handle discard changes action
                                }
                                .buttonStyle(RectangleButtonStyle(isPrimary: false))
                                
                                Button("Save Changes") {
                                    // Handle save changes action
                                }
                                .buttonStyle(RectangleButtonStyle(isPrimary: true))
                            }
                        }
                        .padding()                    }
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
                            .font(Font.custom("Poppins", size: 12).weight(.light))
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
