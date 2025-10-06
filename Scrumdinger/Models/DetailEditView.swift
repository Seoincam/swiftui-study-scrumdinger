//
//  DetailEditView.swift
//  Scrumdinger
//
//  Created by 박서인 on 10/6/25.
//

import SwiftUI

struct DetailEditView: View {
    @State private var scrum = DailyScrum.emptyScrum
    @State private var attendeeName = ""
    
    var body: some View {
        Form {
            Section(header: Text("Meeting Info")){
                TextField("Title", text: $scrum.title)
                HStack {
                    Slider(value: $scrum.lengthInMinutesAsDouble, in: 5...30, step: 1)
                    Spacer()
                    Text("\(scrum.lengthInMinutes) minutes")
                }
            }
            
            Section(header: Text("Attendees")){
                ForEach(scrum.attendees) { attendee in
                    Text(attendee.name)
                }
                .onDelete { indicies in
                    scrum.attendees.remove(atOffsets: indicies)
                }
                HStack {
                    TextField("New Attendee", text: $attendeeName)
                    Button(action: {
                        withAnimation {
                            let attendee = DailyScrum.Attendee(name: attendeeName)
                            scrum.attendees.append(attendee)
                            attendeeName = ""
                        }
                    }) {
                        Image(systemName: "plus.circle.fill")
                    }
                    .disabled(attendeeName.isEmpty)
                }
            }
        }
    }
}

#Preview {
    DetailEditView()
}
