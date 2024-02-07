//
//  PasswordResetService.swift
//  Neobis
//
//  Created by Людмила Долонтаева on 2024-02-07.
//

import Foundation

class PasswordResetService {

    func resetPassword(email: String, completion: @escaping (Bool, String) -> Void) {
        let url = URL(string: "https://neobook.online/neoschool/swagger/users/password/reset")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")

        let passwordResetRequest = PasswordResetRequest(email: email)

        do {
            let jsonData = try JSONEncoder().encode(passwordResetRequest)
            request.httpBody = jsonData

            let task = URLSession.shared.dataTask(with: request) { data, response, error in
                guard let httpResponse = response as? HTTPURLResponse else {
                    completion(false, "Не удалось получить ответ от сервера.")
                    return
                }
            }

            task.resume()
        } catch {
            DispatchQueue.main.async {
                completion(false, "Ошибка кодирования запроса: \(error.localizedDescription)")
            }
        }
    }
}
