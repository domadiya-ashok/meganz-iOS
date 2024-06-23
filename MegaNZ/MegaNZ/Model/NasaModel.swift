//
//  NasaModel.swift
//  MegaNZ
//
//  Created by Ashok Domadiya on 22/06/24.
//

import Foundation

class NasaModel : ObservableObject {
    
    @Published var nasa:[Nasa] = []
    
    /// Should be date extension with seperate class.
    func getRequestDate() -> (Date,Date) {
        let today = Calendar.current.startOfDay(for: Date())
        let weekAgo = Calendar.current.date(byAdding: .day, value: -6, to: today)!
        return (today,weekAgo)
    }
    
    /// fetching the date form Nasa api with 7 days range, also set the time zone of US because we are ahead in time.
    func fetchData() async {

        let formatter = DateFormatter()
        formatter.timeZone = TimeZone(identifier: "America/Los_Angeles")
        formatter.dateFormat = "yyyy-MM-dd"
        
        let rangeOfDate = getRequestDate()

        //for MOCK data testing purpose.
//        guard let url = URL(string: "https://f97b1e09-b6a0-40b8-838c-c2f59c768ed8.mock.pstmn.io/data") else {
//            print("URL is not valid!")
//            return
//        }
        
        // TODO: clean it
        guard let url = URL(string: "https://api.nasa.gov/planetary/apod?api_key=DEMO_KEY&start_date=\(formatter.string(from: rangeOfDate.1))&end_date=\(formatter.string(from: rangeOfDate.0))") else {
            print("URL is not valid!")
            return
        }
        
        do {
            // load the data using async data func, need to add await
            let (data, _) = try await URLSession.shared.data(from: url)
            
            // set the camelcase codeingKey and set the date formate using above dateformatter object
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            decoder.dateDecodingStrategy = .formatted(formatter)
            
            if let modelRes = try? decoder.decode([Nasa].self, from: data) {
                // as the function is running on background, to update the date on mainthread using @MainActor
                await MainActor.run {
                    nasa = modelRes
                }
            }
        } catch DecodingError.typeMismatch(_, let ctx){
            fatalError("Failed to decode Nasa object from due to type mismatch – \(ctx.debugDescription)")
        } catch {
            print("Catch error log \(error)")
        }
    }
    
}
