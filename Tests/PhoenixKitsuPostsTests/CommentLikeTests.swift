import XCTest
@testable import PhoenixKitsuPosts

class CommentLikeTests: XCTestCase {
  let decoder = JSONDecoder()
  
  let fullyFilledJSON: [String : Any] = [
    "id": "4",
    "type": "commentLikes",
    "links": [
      "self": "https://kitsu.io/api/edge/comment-likes/4"
    ],
    "attributes": [
      "createdAt": "2017-08-08T12:39:19.217Z",
      "updatedAt": "2017-08-08T12:39:19.217Z"
    ]
  ]
  
  let validMissingDataJSON: [String : Any] = [
    "id": "4",
    "type": "commentLikes",
    "links": [
      "self": "https://kitsu.io/api/edge/comment-likes/4"
    ],
    "attributes": [
      "createdAt": "2017-08-08T12:39:19.217Z",
      "updatedAt": "2017-08-08T12:39:19.217Z"
    ]
  ]
  
  let validNilDataJSON: [String : Any] = [
    "id": "4",
    "type": "commentLikes",
    "links": [
      "self": "https://kitsu.io/api/edge/comment-likes/4"
    ],
    "attributes": [
      "createdAt": "2017-08-08T12:39:19.217Z",
      "updatedAt": "2017-08-08T12:39:19.217Z"
    ]
  ]
  
  let invalidMissingDataJSON: [String : Any] = [
    "id": "4",
    "type": "commentLikes",
    "links": [
      "self": "https://kitsu.io/api/edge/comment-likes/4"
    ],
    "attributes": [
      "updatedAt": "2017-08-08T12:39:19.217Z"
    ]
  ]
  
  let invalidNilDataJSON: [String : Any?] = [
    "id": "4",
    "type": "commentLikes",
    "links": [
      "self": "https://kitsu.io/api/edge/comment-likes/4"
    ],
    "attributes": [
      "createdAt": nil,
      "updatedAt": "2017-08-08T12:39:19.217Z"
    ]
  ]

  var commentLike: CommentLike?
  var commentLikeAttributes: CommentLikeAttributes?
  
  override func tearDown() {
    commentLike = nil
    commentLikeAttributes = nil
    
    super.tearDown()
  }
  
  func testCommentLikeFullyFilled() {
    let json = fullyFilledJSON
    
    if JSONSerialization.isValidJSONObject(json as Any) {
      let data = try? JSONSerialization.data(withJSONObject: json as Any)
      commentLike = try? decoder.decode(CommentLike.self, from: data!)
    } else {
      commentLike = nil
    }
    commentLikeAttributes = commentLike?.attributes
    
    XCTAssertNotNil(commentLike)
    
    XCTAssertEqual(commentLike?.objectID, "4")
    XCTAssertEqual(commentLike?.type, "commentLikes")
    
    XCTAssertNotNil(commentLikeAttributes)
    
    XCTAssertEqual(commentLikeAttributes?.createdAt, "2017-08-08T12:39:19.217Z")
    XCTAssertEqual(commentLikeAttributes?.updatedAt, "2017-08-08T12:39:19.217Z")
  }
  
  func testCommentLikeValidMissingData() {
    let json = validMissingDataJSON
    
    if JSONSerialization.isValidJSONObject(json as Any) {
      let data = try? JSONSerialization.data(withJSONObject: json as Any)
      commentLike = try? decoder.decode(CommentLike.self, from: data!)
    } else {
      commentLike = nil
    }
    commentLikeAttributes = commentLike?.attributes
    
    XCTAssertNotNil(commentLike)
    
    XCTAssertEqual(commentLike?.objectID, "4")
    XCTAssertEqual(commentLike?.type, "commentLikes")
    
    XCTAssertNotNil(commentLikeAttributes)
    
    XCTAssertEqual(commentLikeAttributes?.createdAt, "2017-08-08T12:39:19.217Z")
    XCTAssertEqual(commentLikeAttributes?.updatedAt, "2017-08-08T12:39:19.217Z")
  }
  
  func testCommentLikeValidNilData() {
    let json = validNilDataJSON
    
    if JSONSerialization.isValidJSONObject(json as Any) {
      let data = try? JSONSerialization.data(withJSONObject: json as Any)
      commentLike = try? decoder.decode(CommentLike.self, from: data!)
    } else {
      commentLike = nil
    }
    commentLikeAttributes = commentLike?.attributes
    
    XCTAssertNotNil(commentLike)
    
    XCTAssertEqual(commentLike?.objectID, "4")
    XCTAssertEqual(commentLike?.type, "commentLikes")
    
    XCTAssertNotNil(commentLikeAttributes)
    
    XCTAssertEqual(commentLikeAttributes?.createdAt, "2017-08-08T12:39:19.217Z")
    XCTAssertEqual(commentLikeAttributes?.updatedAt, "2017-08-08T12:39:19.217Z")
  }
  
  func testCommentLikeInvalidMissingData() {
    let json = invalidMissingDataJSON
    
    if JSONSerialization.isValidJSONObject(json as Any) {
      let data = try? JSONSerialization.data(withJSONObject: json as Any)
      commentLike = try? decoder.decode(CommentLike.self, from: data!)
    } else {
      commentLike = nil
    }
    commentLikeAttributes = commentLike?.attributes
    
    XCTAssertNotNil(commentLike)
    
    XCTAssertEqual(commentLike?.objectID, "4")
    XCTAssertEqual(commentLike?.type, "commentLikes")
    
    XCTAssertNil(commentLikeAttributes)
  }
  
  func testCommentLikeInvalidNilData() {
    let json = invalidNilDataJSON
    
    if JSONSerialization.isValidJSONObject(json as Any) {
      let data = try? JSONSerialization.data(withJSONObject: json as Any)
      commentLike = try? decoder.decode(CommentLike.self, from: data!)
    } else {
      commentLike = nil
    }
    commentLikeAttributes = commentLike?.attributes
    
    XCTAssertNotNil(commentLike)
    
    XCTAssertEqual(commentLike?.objectID, "4")
    XCTAssertEqual(commentLike?.type, "commentLikes")
    
    XCTAssertNil(commentLikeAttributes)
  }
}
