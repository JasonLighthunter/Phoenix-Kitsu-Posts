import PhoenixKitsuCore

public class Post: KitsuObject {
  public static var requestURLString = "posts"
  
  public let objectID: String
  public let type: String
  public let links: Links
  public let attributes: PostAttributes?
  
  private enum CodingKeys: String, CodingKey {
    case objectID = "id"
    case type
    case links
    case attributes
  }
}

public class PostAttributes: KitsuObjectAttributesWithTimestamp {
  public let createdAt: String
  public let updatedAt: String
  public let content: String?
  public let contentFormatted: String?
  public let commentsCount: Int
  public let postLikesCount: Int
  public let isSpoiler: Bool
  public let isNSFW: Bool
  public let isBlocked: Bool
  public let deletedAt: String?
  public let topLevelCommentsCount: Int
  public let editedAt: String?
  public let targetInterest: String?
  public let embed: Embed?
  public let embedURL: String?
  
  private enum CodingKeys: String, CodingKey {
    case createdAt
    case updatedAt
    case content
    case contentFormatted
    case commentsCount
    case postLikesCount
    case isSpoiler = "spoiler"
    case isNSFW = "nsfw"
    case isBlocked = "blocked"
    case deletedAt
    case topLevelCommentsCount
    case editedAt
    case targetInterest
    case embed
    case embedURL = "embedUrl"
  }
}
