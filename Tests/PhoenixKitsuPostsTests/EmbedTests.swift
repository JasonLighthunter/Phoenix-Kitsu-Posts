import XCTest
@testable import PhoenixKitsuPosts

class EmbedTests: XCTestCase {
  let decoder = JSONDecoder()
  
  let fullyFilledJSON: [String : Any] = [
    "kind": "article",
    "image": [
      "url": "https://i.imgur.com/QwgGXAg.mp4",
      "type": "image/png",
      "width": "500",
      "height": "281"
    ],
    "title": "Hitozuma Futakoma | One Married Woman and Two Panels",
    "video": [
      "url": "https://i.imgur.com/QwgGXAg.mp4",
      "type": "video/mp4",
      "width": "500",
      "height": "281"
    ],
    "site_name": "Imgur",
    "description": "Imgur: The most awesome images on the Internet.",
    "audio": [
      "url": "https://example.com/QwgGXAg.mp3",
      "type": "audio/mp3",
      "width": "500",
      "height": "281"
    ]
  ]
  
  let validMissingDataJSON: [String : Any] = [:]
  
  let validNilDataJSON: [String : Any?] = [
    "kind": nil,
    "image": nil,
    "title": nil,
    "video": nil,
    "site_name": nil,
    "description": nil,
    "audio": nil
  ]
  
  //  let invalidMissingDataJSON: [String : Any] = [
  //    "embed": []
  //  ]
  
  //  let invalidNilDataJSON: [String : Any?] = [
  //    "embed": []
  //  ]
  
  var embed: Embed?
  var embedImage: EmbedMedia?
  var embedVideo: EmbedMedia?
  var embedAudio: EmbedMedia?
  
  override func tearDown() {
    embed = nil
    embedImage = nil
    embedVideo = nil
    embedAudio = nil
    
    super.tearDown()
  }
  
  func testEmbedFullyFilled() {
    let json = fullyFilledJSON
    
    if JSONSerialization.isValidJSONObject(json as Any) {
      let data = try? JSONSerialization.data(withJSONObject: json as Any)
      embed = try? decoder.decode(Embed.self, from: data!)
    } else {
      embed = nil
    }
    embedImage = embed?.image
    embedVideo = embed?.video
    embedAudio = embed?.audio
    
    XCTAssertNotNil(embed)
    
    XCTAssertEqual(embed?.kind, "article")
    XCTAssertEqual(embed?.title, "Hitozuma Futakoma | One Married Woman and Two Panels")
    XCTAssertEqual(embed?.siteName, "Imgur")
    XCTAssertEqual(embed?.description, "Imgur: The most awesome images on the Internet.")
    
    XCTAssertNotNil(embedImage)
    XCTAssertNotNil(embedVideo)
    XCTAssertNotNil(embedAudio)
  }
  
  func testEmbedValidMissingData() {
    let json = validMissingDataJSON
    
    if JSONSerialization.isValidJSONObject(json as Any) {
      let data = try? JSONSerialization.data(withJSONObject: json as Any)
      embed = try? decoder.decode(Embed.self, from: data!)
    } else {
      embed = nil
    }
    embedImage = embed?.image
    embedVideo = embed?.video
    embedAudio = embed?.audio
    
    XCTAssertNotNil(embed)
    
    XCTAssertNil(embed?.kind)
    XCTAssertNil(embed?.title)
    XCTAssertNil(embed?.siteName)
    XCTAssertNil(embed?.description)
    XCTAssertNil(embedImage)
    XCTAssertNil(embedVideo)
    XCTAssertNil(embedAudio)
  }
  
  func testEmbedValidNilData() {
    let json = validNilDataJSON
    
    if JSONSerialization.isValidJSONObject(json as Any) {
      let data = try? JSONSerialization.data(withJSONObject: json as Any)
      embed = try? decoder.decode(Embed.self, from: data!)
    } else {
      embed = nil
    }
    embedImage = embed?.image
    embedVideo = embed?.video
    embedAudio = embed?.audio
    
    XCTAssertNotNil(embed)
    
    XCTAssertNil(embed?.kind)
    XCTAssertNil(embed?.title)
    XCTAssertNil(embed?.siteName)
    XCTAssertNil(embed?.description)
    XCTAssertNil(embedImage)
    XCTAssertNil(embedVideo)
    XCTAssertNil(embedAudio)
  }
  
  //  func testEmbedInvalidMissingData() {
  //  }
  
  //  func testEmbedInvalidNilData() {
  //  }
}
