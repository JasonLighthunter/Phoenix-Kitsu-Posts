import XCTest
@testable import PhoenixKitsuPosts

class PostFollowTests: XCTestCase {
  let decoder = JSONDecoder()
  
  let fullyFilledJSON: [String : Any] = [
    "id": "4",
    "type": "postFollows",
    "links": [
      "self": "https://kitsu.io/api/edge/post-follows/4"
    ],
    "attributes": [
      "createdAt": "2017-08-08T12:39:19.217Z",
      "updatedAt": "2017-08-08T12:39:19.217Z"
    ]
  ]
  
  let validMissingDataJSON: [String : Any] = [
    "id": "4",
    "type": "postFollows",
    "links": [
      "self": "https://kitsu.io/api/edge/post-follows/4"
    ],
    "attributes": [
      "createdAt": "2017-08-08T12:39:19.217Z",
      "updatedAt": "2017-08-08T12:39:19.217Z"
    ]
  ]
  
  let validNilDataJSON: [String : Any] = [
    "id": "4",
    "type": "postFollows",
    "links": [
      "self": "https://kitsu.io/api/edge/post-follows/4"
    ],
    "attributes": [
      "createdAt": "2017-08-08T12:39:19.217Z",
      "updatedAt": "2017-08-08T12:39:19.217Z"
    ]
  ]
  
  let invalidMissingDataJSON: [String : Any] = [
    "id": "4",
    "type": "postFollows",
    "links": [
      "self": "https://kitsu.io/api/edge/post-follows/4"
    ],
    "attributes": [
      "updatedAt": "2017-08-08T12:39:19.217Z"
    ]
  ]
  
  let invalidNilDataJSON: [String : Any?] = [
    "id": "4",
    "type": "postFollows",
    "links": [
      "self": "https://kitsu.io/api/edge/post-follows/4"
    ],
    "attributes": [
      "createdAt": nil,
      "updatedAt": "2017-08-08T12:39:19.217Z"
    ]
  ]
  
  var postFollow: PostFollow?
  var postFollowAttributes: PostFollowAttributes?
  
  override func tearDown() {
    postFollow = nil
    postFollowAttributes = nil
    
    super.tearDown()
  }
  
  func testPostFollowFullyFilled() {
    let json = fullyFilledJSON
    
    if JSONSerialization.isValidJSONObject(json as Any) {
      let data = try? JSONSerialization.data(withJSONObject: json as Any)
      postFollow = try? decoder.decode(PostFollow.self, from: data!)
    } else {
      postFollow = nil
    }
    postFollowAttributes = postFollow?.attributes
    
    XCTAssertNotNil(postFollow)
    
    XCTAssertEqual(postFollow?.objectID, "4")
    XCTAssertEqual(postFollow?.type, "postFollows")
    
    XCTAssertNotNil(postFollowAttributes)
    
    XCTAssertEqual(postFollowAttributes?.createdAt, "2017-08-08T12:39:19.217Z")
    XCTAssertEqual(postFollowAttributes?.updatedAt, "2017-08-08T12:39:19.217Z")
  }
  
  func testPostFollowValidMissingData() {
    let json = validMissingDataJSON
    
    if JSONSerialization.isValidJSONObject(json as Any) {
      let data = try? JSONSerialization.data(withJSONObject: json as Any)
      postFollow = try? decoder.decode(PostFollow.self, from: data!)
    } else {
      postFollow = nil
    }
    postFollowAttributes = postFollow?.attributes
    
    XCTAssertNotNil(postFollow)
    
    XCTAssertEqual(postFollow?.objectID, "4")
    XCTAssertEqual(postFollow?.type, "postFollows")
    
    XCTAssertNotNil(postFollowAttributes)
    
    XCTAssertEqual(postFollowAttributes?.createdAt, "2017-08-08T12:39:19.217Z")
    XCTAssertEqual(postFollowAttributes?.updatedAt, "2017-08-08T12:39:19.217Z")
  }
  
  func testPostFollowValidNilData() {
    let json = validNilDataJSON
    
    if JSONSerialization.isValidJSONObject(json as Any) {
      let data = try? JSONSerialization.data(withJSONObject: json as Any)
      postFollow = try? decoder.decode(PostFollow.self, from: data!)
    } else {
      postFollow = nil
    }
    postFollowAttributes = postFollow?.attributes
    
    XCTAssertNotNil(postFollow)
    
    XCTAssertEqual(postFollow?.objectID, "4")
    XCTAssertEqual(postFollow?.type, "postFollows")
    
    XCTAssertNotNil(postFollowAttributes)
    
    XCTAssertEqual(postFollowAttributes?.createdAt, "2017-08-08T12:39:19.217Z")
    XCTAssertEqual(postFollowAttributes?.updatedAt, "2017-08-08T12:39:19.217Z")
  }
  
  func testPostFollowInvalidMissingData() {
    let json = invalidMissingDataJSON
    
    if JSONSerialization.isValidJSONObject(json as Any) {
      let data = try? JSONSerialization.data(withJSONObject: json as Any)
      postFollow = try? decoder.decode(PostFollow.self, from: data!)
    } else {
      postFollow = nil
    }
    postFollowAttributes = postFollow?.attributes
    
    XCTAssertNotNil(postFollow)
    
    XCTAssertEqual(postFollow?.objectID, "4")
    XCTAssertEqual(postFollow?.type, "postFollows")
    
    XCTAssertNil(postFollowAttributes)
  }
  
  func testPostFollowInvalidNilData() {
    let json = invalidNilDataJSON
    
    if JSONSerialization.isValidJSONObject(json as Any) {
      let data = try? JSONSerialization.data(withJSONObject: json as Any)
      postFollow = try? decoder.decode(PostFollow.self, from: data!)
    } else {
      postFollow = nil
    }
    postFollowAttributes = postFollow?.attributes
    
    XCTAssertNotNil(postFollow)
    
    XCTAssertEqual(postFollow?.objectID, "4")
    XCTAssertEqual(postFollow?.type, "postFollows")
    
    XCTAssertNil(postFollowAttributes)
  }
}


