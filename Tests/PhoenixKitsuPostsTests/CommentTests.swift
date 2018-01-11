import XCTest
@testable import PhoenixKitsuPosts

class CommentTests: XCTestCase {
  let decoder = JSONDecoder()
  
  let fullyFilledJSON: [String : Any] = [
    "id": "4",
    "type": "comments",
    "links": [
      "self": "https://kitsu.io/api/edge/comments/4"
    ],
    "attributes": [
      "createdAt": "2014-08-07T19:08:14.364Z",
      "updatedAt": "2014-08-07T19:08:14.364Z",
      "content": "This is a test",
      "contentFormatted": "This is a formatted test",
      "blocked": false,
      "deletedAt": "2017-09-07T12:11:42.235Z",
      "likesCount": 0,
      "repliesCount": 0,
      "editedAt": "2017-09-07T12:11:42.235Z",
      "embed": [
        "kind": "article",
        "image": [
          "url": "https://t.nhentai.net/galleries/1093851/cover.jpg"
        ],
        "title": "Hitozuma Futakoma | One Married Woman and Two Panels",
        "video": [
          "url": "https://i.imgur.com/QwgGXAg.mp4",
          "type": "video/mp4",
          "width": "500",
          "height": "281"
        ],
        "site_name": "Imgur",
        "description": "Imgur: The most awesome images on the Internet."
      ],
      "embedUrl": "https://example.com"
    ]
  ]
  
  let validMissingDataJSON: [String : Any] = [
    "id": "4",
    "type": "comments",
    "links": [
      "self": "https://kitsu.io/api/edge/comments/4"
    ],
    "attributes": [
      "createdAt": "2014-08-07T19:08:14.364Z",
      "updatedAt": "2014-08-07T19:08:14.364Z",
      "blocked": false,
      "likesCount": 0,
      "repliesCount": 0
    ]
  ]
  
  let validNilDataJSON: [String : Any] = [
    "id": "4",
    "type": "comments",
    "links": [
      "self": "https://kitsu.io/api/edge/comments/4"
    ],
    "attributes": [
      "createdAt": "2014-08-07T19:08:14.364Z",
      "updatedAt": "2014-08-07T19:08:14.364Z",
      "content": nil,
      "contentFormatted": nil,
      "blocked": false,
      "deletedAt": nil,
      "likesCount": 0,
      "repliesCount": 0,
      "editedAt": nil,
      "embed": nil,
      "embedUrl": nil
    ]
  ]
  
  let invalidMissingDataJSON: [String : Any] = [
    "id": "4",
    "type": "comments",
    "links": [
      "self": "https://kitsu.io/api/edge/comments/4"
    ],
    "attributes": [
      "updatedAt": "2014-08-07T19:08:14.364Z",
      "content": "This is a test",
      "contentFormatted": "This is a formatted test",
      "blocked": false,
      "deletedAt": "2017-09-07T12:11:42.235Z",
      "likesCount": 0,
      "repliesCount": 0,
      "editedAt": "2017-09-07T12:11:42.235Z",
      "embed": [
        "kind": "article",
        "image": [
          "url": "https://t.nhentai.net/galleries/1093851/cover.jpg"
        ],
        "title": "Hitozuma Futakoma | One Married Woman and Two Panels",
        "video": [
          "url": "https://i.imgur.com/QwgGXAg.mp4",
          "type": "video/mp4",
          "width": "500",
          "height": "281"
        ],
        "site_name": "Imgur",
        "description": "Imgur: The most awesome images on the Internet."
      ],
      "embedUrl": "https://example.com"
    ]
  ]
  
  let invalidNilDataJSON: [String : Any?] = [
    "id": "4",
    "type": "comments",
    "links": [
      "self": "https://kitsu.io/api/edge/comments/4"
    ],
    "attributes": [
      "createdAt": nil,
      "updatedAt": "2014-08-07T19:08:14.364Z",
      "content": "This is a test",
      "contentFormatted": "This is a formatted test",
      "blocked": false,
      "deletedAt": "2017-09-07T12:11:42.235Z",
      "likesCount": 0,
      "repliesCount": 0,
      "editedAt": "2017-09-07T12:11:42.235Z",
      "embed": [
        "kind": "article",
        "image": [
          "url": "https://t.nhentai.net/galleries/1093851/cover.jpg"
        ],
        "title": "Hitozuma Futakoma | One Married Woman and Two Panels",
        "video": [
          "url": "https://i.imgur.com/QwgGXAg.mp4",
          "type": "video/mp4",
          "width": "500",
          "height": "281"
        ],
        "site_name": "Imgur",
        "description": "Imgur: The most awesome images on the Internet."
      ],
      "embedUrl": "https://example.com"
    ]
  ]
  
  var comment: Comment?
  var commentAttributes: CommentAttributes?
  
  override func tearDown() {
    comment = nil
    commentAttributes = nil
    
    super.tearDown()
  }
  
  func testCommentFullyFilled() {
    let json = fullyFilledJSON
    
    if JSONSerialization.isValidJSONObject(json as Any) {
      let data = try? JSONSerialization.data(withJSONObject: json as Any)
      comment = try? decoder.decode(Comment.self, from: data!)
    } else {
      comment = nil
    }
    commentAttributes = comment?.attributes
    
    XCTAssertNotNil(comment)
    
    XCTAssertEqual(comment?.objectID, "4")
    XCTAssertEqual(comment?.type, "comments")
    
    XCTAssertNotNil(comment?.links)
    
    XCTAssertNotNil(commentAttributes)
    
    XCTAssertEqual(commentAttributes?.createdAt, "2014-08-07T19:08:14.364Z")
    XCTAssertEqual(commentAttributes?.updatedAt, "2014-08-07T19:08:14.364Z")
    XCTAssertEqual(commentAttributes?.content, "This is a test")
    XCTAssertEqual(commentAttributes?.contentFormatted, "This is a formatted test")
    XCTAssertFalse((commentAttributes?.isBlocked)!)
    XCTAssertEqual(commentAttributes?.deletedAt, "2017-09-07T12:11:42.235Z")
    XCTAssertEqual(commentAttributes?.likesCount, 0)
    XCTAssertEqual(commentAttributes?.repliesCount, 0)
    XCTAssertEqual(commentAttributes?.editedAt, "2017-09-07T12:11:42.235Z")
    
    XCTAssertNotNil(commentAttributes?.embed)
    
    XCTAssertEqual(commentAttributes?.embedURL, "https://example.com")
  }
  
  func testCommentValidMissingData() {
    let json = validMissingDataJSON
    
    if JSONSerialization.isValidJSONObject(json as Any) {
      let data = try? JSONSerialization.data(withJSONObject: json as Any)
      comment = try? decoder.decode(Comment.self, from: data!)
    } else {
      comment = nil
    }
    commentAttributes = comment?.attributes
    
    XCTAssertNotNil(comment)
    
    XCTAssertEqual(comment?.objectID, "4")
    XCTAssertEqual(comment?.type, "comments")
    
    XCTAssertNotNil(commentAttributes)
    
    XCTAssertEqual(commentAttributes?.createdAt, "2014-08-07T19:08:14.364Z")
    XCTAssertEqual(commentAttributes?.updatedAt, "2014-08-07T19:08:14.364Z")
    XCTAssertNil(commentAttributes?.content)
    XCTAssertNil(commentAttributes?.contentFormatted, "This is a formatted test")
    XCTAssertFalse((commentAttributes?.isBlocked)!)
    XCTAssertNil(commentAttributes?.deletedAt)
    XCTAssertEqual(commentAttributes?.likesCount, 0)
    XCTAssertEqual(commentAttributes?.repliesCount, 0)
    XCTAssertNil(commentAttributes?.editedAt)
    XCTAssertNil(commentAttributes?.embed)
    XCTAssertNil(commentAttributes?.embedURL)
  }
  
  func testCommentValidNilData() {
    let json = validNilDataJSON
    
    if JSONSerialization.isValidJSONObject(json as Any) {
      let data = try? JSONSerialization.data(withJSONObject: json as Any)
      comment = try? decoder.decode(Comment.self, from: data!)
    } else {
      comment = nil
    }
    commentAttributes = comment?.attributes
    
    XCTAssertNotNil(comment)
    
    XCTAssertEqual(comment?.objectID, "4")
    XCTAssertEqual(comment?.type, "comments")
    
    XCTAssertNotNil(commentAttributes)
    
    XCTAssertEqual(commentAttributes?.createdAt, "2014-08-07T19:08:14.364Z")
    XCTAssertEqual(commentAttributes?.updatedAt, "2014-08-07T19:08:14.364Z")
    XCTAssertNil(commentAttributes?.content)
    XCTAssertNil(commentAttributes?.contentFormatted, "This is a formatted test")
    XCTAssertFalse((commentAttributes?.isBlocked)!)
    XCTAssertNil(commentAttributes?.deletedAt)
    XCTAssertEqual(commentAttributes?.likesCount, 0)
    XCTAssertEqual(commentAttributes?.repliesCount, 0)
    XCTAssertNil(commentAttributes?.editedAt)
    XCTAssertNil(commentAttributes?.embed)
    XCTAssertNil(commentAttributes?.embedURL)
  }
  
  func testCommentInvalidMissingData() {
    let json = invalidMissingDataJSON
    
    if JSONSerialization.isValidJSONObject(json as Any) {
      let data = try? JSONSerialization.data(withJSONObject: json as Any)
      comment = try? decoder.decode(Comment.self, from: data!)
    } else {
      comment = nil
    }
    commentAttributes = comment?.attributes
    
    XCTAssertNotNil(comment)
    
    XCTAssertEqual(comment?.objectID, "4")
    XCTAssertEqual(comment?.type, "comments")
    
    XCTAssertNil(commentAttributes)
  }
  
  func testCommentInvalidNilData() {
    let json = invalidNilDataJSON
    
    if JSONSerialization.isValidJSONObject(json as Any) {
      let data = try? JSONSerialization.data(withJSONObject: json as Any)
      comment = try? decoder.decode(Comment.self, from: data!)
    } else {
      comment = nil
    }
    commentAttributes = comment?.attributes
    
    XCTAssertNotNil(comment)
    
    XCTAssertEqual(comment?.objectID, "4")
    XCTAssertEqual(comment?.type, "comments")
    
    XCTAssertNil(commentAttributes)
  }
}
