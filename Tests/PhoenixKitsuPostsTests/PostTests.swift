import XCTest
@testable import PhoenixKitsuPosts

class PostTests: XCTestCase {
  let decoder = JSONDecoder()
  
  let fullyFilledJSON: [String : Any] = [
    "id": "4",
    "type": "posts",
    "links": [
      "self": "https://kitsu.io/api/edge/posts/4"
    ],
    "attributes": [
      "createdAt": "2017-08-08T12:39:19.217Z",
      "updatedAt": "2017-08-08T12:39:19.217Z",
      "content": "Content",
      "contentFormatted": "<p>content</p>",
      "commentsCount": 0,
      "postLikesCount": 3,
      "spoiler": true,
      "nsfw": true,
      "blocked": false,
      "deletedAt": "2017-08-08T12:39:19.217Z",
      "topLevelCommentsCount": 0,
      "editedAt": "2017-08-08T12:39:19.217Z",
      "targetInterest": "test",
      "embed": [
        "kind": "video.other",
        "image": [
          "url": "https://i.imgur.com/Ohe0FMIh.jpg"
        ],
        "title": "Goodnight birb",
        "video": [
          "url": "https://i.imgur.com/Ohe0FMI.mp4",
          "type": "video/mp4",
          "width": "728",
          "height": "728"
        ],
        "site_name": "Imgur",
        "description": "Imgur: The magic of the Internet"
      ],
      "embedUrl": "http://example.com"
    ]
  ]
  
  let validMissingDataJSON: [String : Any] = [
    "id": "4",
    "type": "posts",
    "links": [
      "self": "https://kitsu.io/api/edge/posts/4"
    ],
    "attributes": [
      "createdAt": "2017-08-08T12:39:19.217Z",
      "updatedAt": "2017-08-08T12:39:19.217Z",
      "commentsCount": 0,
      "postLikesCount": 3,
      "spoiler": true,
      "nsfw": true,
      "blocked": false,
      "topLevelCommentsCount": 0
    ]
  ]
  
  let validNilDataJSON: [String : Any?] = [
    "id": "4",
    "type": "posts",
    "links": [
      "self": "https://kitsu.io/api/edge/posts/4"
    ],
    "attributes": [
      "createdAt": "2017-08-08T12:39:19.217Z",
      "updatedAt": "2017-08-08T12:39:19.217Z",
      "content": nil,
      "contentFormatted": nil,
      "commentsCount": 0,
      "postLikesCount": 3,
      "spoiler": true,
      "nsfw": true,
      "blocked": false,
      "deletedAt": nil,
      "topLevelCommentsCount": 0,
      "editedAt": nil,
      "targetInterest": nil,
      "embed": nil,
      "embedUrl": nil
    ]
  ]
  
  let invalidMissingDataJSON: [String : Any] = [
    "id": "4",
    "type": "posts",
    "links": [
      "self": "https://kitsu.io/api/edge/posts/4"
    ],
    "attributes": [
      "createdAt": "2017-08-08T12:39:19.217Z",
    ]
  ]
  
  let invalidNilDataJSON: [String : Any?] = [
    "id": "4",
    "type": "posts",
    "links": [
      "self": "https://kitsu.io/api/edge/posts/4"
    ],
    "attributes": [
      "createdAt": nil,
      "updatedAt": "2017-08-08T12:39:19.217Z",
      "content": nil,
      "contentFormatted": nil,
      "commentsCount": 0,
      "postLikesCount": 3,
      "spoiler": true,
      "nsfw": true,
      "blocked": false,
      "deletedAt": nil,
      "topLevelCommentsCount": 0,
      "editedAt": nil,
      "targetInterest": nil,
      "embed": nil,
      "embedUrl": nil
    ]
  ]
  
  var post: Post?
  var postAttributes: PostAttributes?
  
  override func tearDown() {
    post = nil
    postAttributes = nil
    
    super.tearDown()
  }
  
  func testPostFullyFilled() {
    let json = fullyFilledJSON
    
    if JSONSerialization.isValidJSONObject(json as Any) {
      let data = try? JSONSerialization.data(withJSONObject: json as Any)
      post = try? decoder.decode(Post.self, from: data!)
    } else {
      post = nil
    }
    postAttributes = post?.attributes
    
    XCTAssertNotNil(post)
    
    XCTAssertEqual(post?.objectID, "4")
    XCTAssertEqual(post?.type, "posts")
    
    XCTAssertNotNil(post?.links)
    
    XCTAssertNotNil(postAttributes)
    
    XCTAssertEqual(postAttributes?.createdAt, "2017-08-08T12:39:19.217Z")
    XCTAssertEqual(postAttributes?.updatedAt, "2017-08-08T12:39:19.217Z")
    XCTAssertEqual(postAttributes?.content, "Content")
    XCTAssertEqual(postAttributes?.contentFormatted, "<p>content</p>")
    XCTAssertEqual(postAttributes?.commentsCount, 0)
    XCTAssertEqual(postAttributes?.postLikesCount, 3)
    XCTAssertTrue((postAttributes?.isSpoiler)!)
    XCTAssertTrue((postAttributes?.isNSFW)!)
    XCTAssertFalse((postAttributes?.isBlocked)!)
    XCTAssertEqual(postAttributes?.deletedAt, "2017-08-08T12:39:19.217Z")
    XCTAssertEqual(postAttributes?.topLevelCommentsCount, 0)
    XCTAssertEqual(postAttributes?.editedAt, "2017-08-08T12:39:19.217Z")
    XCTAssertEqual(postAttributes?.targetInterest, "test")
    
    XCTAssertNotNil(postAttributes?.embed)
    
    XCTAssertEqual(postAttributes?.embedURL, "http://example.com")
  }
  
  func testPostValidMissingData() {
    let json = validMissingDataJSON
    
    if JSONSerialization.isValidJSONObject(json as Any) {
      let data = try? JSONSerialization.data(withJSONObject: json as Any)
      post = try? decoder.decode(Post.self, from: data!)
    } else {
      post = nil
    }
    postAttributes = post?.attributes
    
    XCTAssertNotNil(post)
    
    XCTAssertEqual(post?.objectID, "4")
    XCTAssertEqual(post?.type, "posts")
    
    XCTAssertNotNil(post?.links)
    
    XCTAssertNotNil(postAttributes)
    
    XCTAssertEqual(postAttributes?.createdAt, "2017-08-08T12:39:19.217Z")
    XCTAssertEqual(postAttributes?.updatedAt, "2017-08-08T12:39:19.217Z")
    XCTAssertNil(postAttributes?.content)
    XCTAssertNil(postAttributes?.contentFormatted)
    XCTAssertEqual(postAttributes?.commentsCount, 0)
    XCTAssertEqual(postAttributes?.postLikesCount, 3)
    XCTAssertTrue((postAttributes?.isSpoiler)!)
    XCTAssertTrue((postAttributes?.isNSFW)!)
    XCTAssertFalse((postAttributes?.isBlocked)!)
    XCTAssertNil(postAttributes?.deletedAt)
    XCTAssertEqual(postAttributes?.topLevelCommentsCount, 0)
    XCTAssertNil(postAttributes?.editedAt)
    XCTAssertNil(postAttributes?.targetInterest)
    XCTAssertNil(postAttributes?.embed)
    XCTAssertNil(postAttributes?.embedURL)
  }
  
  func testPostValidNilData() {
    let json = validNilDataJSON
    
    if JSONSerialization.isValidJSONObject(json as Any) {
      let data = try? JSONSerialization.data(withJSONObject: json as Any)
      post = try? decoder.decode(Post.self, from: data!)
    } else {
      post = nil
    }
    postAttributes = post?.attributes
    
    XCTAssertNotNil(post)
    
    XCTAssertEqual(post?.objectID, "4")
    XCTAssertEqual(post?.type, "posts")
    
    XCTAssertNotNil(post?.links)
    
    XCTAssertNotNil(postAttributes)
    
    XCTAssertEqual(postAttributes?.createdAt, "2017-08-08T12:39:19.217Z")
    XCTAssertEqual(postAttributes?.updatedAt, "2017-08-08T12:39:19.217Z")
    XCTAssertNil(postAttributes?.content)
    XCTAssertNil(postAttributes?.contentFormatted)
    XCTAssertEqual(postAttributes?.commentsCount, 0)
    XCTAssertEqual(postAttributes?.postLikesCount, 3)
    XCTAssertTrue((postAttributes?.isSpoiler)!)
    XCTAssertTrue((postAttributes?.isNSFW)!)
    XCTAssertFalse((postAttributes?.isBlocked)!)
    XCTAssertNil(postAttributes?.deletedAt)
    XCTAssertEqual(postAttributes?.topLevelCommentsCount, 0)
    XCTAssertNil(postAttributes?.editedAt)
    XCTAssertNil(postAttributes?.targetInterest)
    XCTAssertNil(postAttributes?.embed)
    XCTAssertNil(postAttributes?.embedURL)
  }
  
  func testPostInvalidMissingData() {
    let json = invalidMissingDataJSON
    
    if JSONSerialization.isValidJSONObject(json as Any) {
      let data = try? JSONSerialization.data(withJSONObject: json as Any)
      post = try? decoder.decode(Post.self, from: data!)
    } else {
      post = nil
    }
    postAttributes = post?.attributes
    
    XCTAssertNotNil(post)
    
    XCTAssertEqual(post?.objectID, "4")
    XCTAssertEqual(post?.type, "posts")
    
    XCTAssertNotNil(post?.links)
    
    XCTAssertNil(postAttributes)
  }
  
  func testPostInvalidNilData() {
    let json = invalidNilDataJSON
    
    if JSONSerialization.isValidJSONObject(json as Any) {
      let data = try? JSONSerialization.data(withJSONObject: json as Any)
      post = try? decoder.decode(Post.self, from: data!)
    } else {
      post = nil
    }
    postAttributes = post?.attributes
    
    XCTAssertNotNil(post)
    
    XCTAssertEqual(post?.objectID, "4")
    XCTAssertEqual(post?.type, "posts")
    
    XCTAssertNotNil(post?.links)
    
    XCTAssertNil(postAttributes)
  }
}

