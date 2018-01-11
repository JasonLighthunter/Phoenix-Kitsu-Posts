import XCTest
@testable import PhoenixKitsuPosts

class PostLikeTests: XCTestCase {
  let decoder = JSONDecoder()
  
  let fullyFilledJSON: [String : Any] = [
    "id": "4",
    "type": "postLikes",
    "links": [
      "self": "https://kitsu.io/api/edge/post-likes/4"
    ],
    "attributes": [
      "createdAt": "2017-08-08T12:39:19.217Z",
      "updatedAt": "2017-08-08T12:39:19.217Z"
    ]
  ]
  
  let validMissingDataJSON: [String : Any] = [
    "id": "4",
    "type": "postLikes",
    "links": [
      "self": "https://kitsu.io/api/edge/post-likes/4"
    ],
    "attributes": [
      "createdAt": "2017-08-08T12:39:19.217Z",
      "updatedAt": "2017-08-08T12:39:19.217Z"
    ]
  ]
  
  let validNilDataJSON: [String : Any] = [
    "id": "4",
    "type": "postLikes",
    "links": [
      "self": "https://kitsu.io/api/edge/post-likes/4"
    ],
    "attributes": [
      "createdAt": "2017-08-08T12:39:19.217Z",
      "updatedAt": "2017-08-08T12:39:19.217Z"
    ]
  ]
  
  let invalidMissingDataJSON: [String : Any] = [
    "id": "4",
    "type": "postLikes",
    "links": [
      "self": "https://kitsu.io/api/edge/post-likes/4"
    ],
    "attributes": [
      "updatedAt": "2017-08-08T12:39:19.217Z"
    ]
  ]
  
  let invalidNilDataJSON: [String : Any?] = [
    "id": "4",
    "type": "postLikes",
    "links": [
      "self": "https://kitsu.io/api/edge/post-likes/4"
    ],
    "attributes": [
      "createdAt": nil,
      "updatedAt": "2017-08-08T12:39:19.217Z"
    ]
  ]
  
  var postLike: PostLike?
  var postLikeAttributes: PostLikeAttributes?
  
  override func tearDown() {
    postLike = nil
    postLikeAttributes = nil
    
    super.tearDown()
  }
  
  func testPostLikeFullyFilled() {
    let json = fullyFilledJSON
    
    if JSONSerialization.isValidJSONObject(json as Any) {
      let data = try? JSONSerialization.data(withJSONObject: json as Any)
      postLike = try? decoder.decode(PostLike.self, from: data!)
    } else {
      postLike = nil
    }
    postLikeAttributes = postLike?.attributes
    
    XCTAssertNotNil(postLike)
    
    XCTAssertEqual(postLike?.objectID, "4")
    XCTAssertEqual(postLike?.type, "postLikes")
    
    XCTAssertNotNil(postLikeAttributes)
    
    XCTAssertEqual(postLikeAttributes?.createdAt, "2017-08-08T12:39:19.217Z")
    XCTAssertEqual(postLikeAttributes?.updatedAt, "2017-08-08T12:39:19.217Z")
  }
  
  func testPostLikeValidMissingData() {
    let json = validMissingDataJSON
    
    if JSONSerialization.isValidJSONObject(json as Any) {
      let data = try? JSONSerialization.data(withJSONObject: json as Any)
      postLike = try? decoder.decode(PostLike.self, from: data!)
    } else {
      postLike = nil
    }
    postLikeAttributes = postLike?.attributes
    
    XCTAssertNotNil(postLike)
    
    XCTAssertEqual(postLike?.objectID, "4")
    XCTAssertEqual(postLike?.type, "postLikes")
    
    XCTAssertNotNil(postLikeAttributes)
    
    XCTAssertEqual(postLikeAttributes?.createdAt, "2017-08-08T12:39:19.217Z")
    XCTAssertEqual(postLikeAttributes?.updatedAt, "2017-08-08T12:39:19.217Z")
  }
  
  func testPostLikeValidNilData() {
    let json = validNilDataJSON
    
    if JSONSerialization.isValidJSONObject(json as Any) {
      let data = try? JSONSerialization.data(withJSONObject: json as Any)
      postLike = try? decoder.decode(PostLike.self, from: data!)
    } else {
      postLike = nil
    }
    postLikeAttributes = postLike?.attributes
    
    XCTAssertNotNil(postLike)
    
    XCTAssertEqual(postLike?.objectID, "4")
    XCTAssertEqual(postLike?.type, "postLikes")
    
    XCTAssertNotNil(postLikeAttributes)
    
    XCTAssertEqual(postLikeAttributes?.createdAt, "2017-08-08T12:39:19.217Z")
    XCTAssertEqual(postLikeAttributes?.updatedAt, "2017-08-08T12:39:19.217Z")
  }
  
  func testPostLikeInvalidMissingData() {
    let json = invalidMissingDataJSON
    
    if JSONSerialization.isValidJSONObject(json as Any) {
      let data = try? JSONSerialization.data(withJSONObject: json as Any)
      postLike = try? decoder.decode(PostLike.self, from: data!)
    } else {
      postLike = nil
    }
    postLikeAttributes = postLike?.attributes
    
    XCTAssertNotNil(postLike)
    
    XCTAssertEqual(postLike?.objectID, "4")
    XCTAssertEqual(postLike?.type, "postLikes")
    
    XCTAssertNil(postLikeAttributes)
  }
  
  func testPostLikeInvalidNilData() {
    let json = invalidNilDataJSON
    
    if JSONSerialization.isValidJSONObject(json as Any) {
      let data = try? JSONSerialization.data(withJSONObject: json as Any)
      postLike = try? decoder.decode(PostLike.self, from: data!)
    } else {
      postLike = nil
    }
    postLikeAttributes = postLike?.attributes
    
    XCTAssertNotNil(postLike)
    
    XCTAssertEqual(postLike?.objectID, "4")
    XCTAssertEqual(postLike?.type, "postLikes")
    
    XCTAssertNil(postLikeAttributes)
  }
}

