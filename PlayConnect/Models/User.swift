//
//  Users.swift
//  PlayConnect
//
//  Created by Ernesto Cisnero on 1/27/26.
//

/**
 Users
 
 Field,Type,Description
 uid,String,Unique ID from Firebase Auth
 role,String,"""player"" or ""coach"""
 display_name,String,Full name or Username
 bio,String,Short description
 location,GeoPoint,Coordinates (for the Map feature)
 is_pro,Boolean,"True = Paid user (90s video), False = Free"
 profile_pic,String,URL to storage
 social_links,Map,"{ ""instagram"": ""@user"", ""whatsapp"": ""+123..."" }"
 
 2. Players_Profiles Collection (Sub-data)
 Linked to Users.uid if role == "player".
 
 Field,Type,Description
 position,String,"Striker, Midfielder, Goalkeeper, etc."
 age,Number,For filtering by age group
 video_url,String,URL to their highlight reel
 video_duration,Number,Length in seconds (to enforce limits)
 skills_tags,Array,"[""Speed"", ""Free-kicks"", ""Vision""]"
 status,String,"""Looking for Team"" or ""Signed"""
 
 3. Teams_Profiles Collection (Sub-data)
 Linked to Users.uid if role == "coach".
 
 4. Tryouts Collection
 These are "Events" created by coaches that appear on the Map.
 
 Field,Type,Description
 coach_id,String,References the Users.uid who posted it
 title,String,"e.g., ""U-19 Open Tryouts"""
 date_time,Timestamp,When the tryout happens
 address,String,Physical location
 requirements,String,"e.g., ""Bring cleats and water"""
 
 
 
 🧪 The "Connection" Logic (The Match)
 To track who is interested in whom without a full chat system yet, create a collection called Interactions:

 sender_id: The person who tapped "Request Contact."

 receiver_id: The person receiving the request.

 status: "pending", "accepted", or "declined".

 timestamp: When it happened.
 */

import Foundation


struct User {
    var id: String
    var name: String
    var email: String
    var avatar: URL?
    var role: UserRole?
    
}

extension User{
    static let exampleUser = User(
        id: UUID().uuidString,
        name: "Ernesto Cisnero",
        email: "ernesto.cisnero@gmail.com",
        avatar: URL(string: "https://i.pravatar.cc/300"),
        role: .player
    )
}
