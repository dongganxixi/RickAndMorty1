
//  Created by 胡瑞兴 on 2024/7/1.
//

import Foundation

/// Primary API service object to get Rick and Morty data
final class RMServie{
    
    /// Shared singleton instance
    static let shared = RMServie()
    
    /// Privatized constructor
    private init(){}
    
    /// 设置一个错误的enum
    enum RMServiceError: Error{
        case failedToCreateRequest
        case failedToGetData
    }
    /// Send Rick and Morty API Call
    /// - Parameters:
    ///   - request: request instance
    ///   - type : The type of object we expect to get back
    ///   - completion: Callback with data or error
    public func execute<T: Codable>(_ request: RMRequest ,
                                    expecting type: T.Type,
                                    completion: @escaping (Result<T, Error>) -> Void
    ){
        guard let urlRequest = self.request(from: request) else {
            completion(.failure(RMServiceError.failedToCreateRequest))
            return }
        
        /// 定义一个task去获取服务器数据
        let task = URLSession.shared.dataTask(with: urlRequest) { data, _, error in
            guard let data = data, error == nil else{
                completion(.failure(error ?? RMServiceError.failedToGetData))
                return
            }
            // Decode response
            do{
                /// 将数据解析为 JSON 对象
                let result =  try JSONDecoder().decode(type.self, from: data)
                completion(.success(result))
            }
            catch{
                completion(.failure(error))
            }
        }
        /// 启动任务
        task.resume()
    }
    
    // MARK: - Private
    
    private func request(from rmRequest: RMRequest) -> URLRequest?{
        /// 如果 rmRequest.url 的值是nil，将退出这个func
        guard let url = rmRequest.url else { return nil }
        
        var request = URLRequest(url: url)
        request.httpMethod = rmRequest.httpMethod  // rmRequest.httpMethod的值是 “GET”,是http协议读取服务器数据的方法，且必须为大写
        
        return request
    }
}
