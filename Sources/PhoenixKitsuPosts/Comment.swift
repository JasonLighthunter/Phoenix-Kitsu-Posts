import PhoenixKitsuCore

public class Comment: KitsuObject {
  public static var requestURLString = "comments"
  
  public let objectID: String
  public let type: String
  public let links: Links
  public let attributes: CommentAttributes?
  
  private enum CodingKeys: String, CodingKey {
    case objectID = "id"
    case type
    case links
    case attributes
  }
}

public class CommentAttributes: KitsuObjectAttributesWithTimestamp {
  public let createdAt: String
  public let updatedAt: String
  public let content: String?
  public let contentFormatted: String?
  public let isBlocked: Bool
  public let deletedAt: String?
  public let likesCount: Int
  public let repliesCount: Int
  public let editedAt: String?
  public let embed: Embed?
  public let embedURL: String?
  
  private enum CodingKeys: String, CodingKey {
    case createdAt
    case updatedAt
    case content
    case contentFormatted
    case isBlocked = "blocked"
    case deletedAt
    case likesCount
    case repliesCount
    case editedAt
    case embed
    case embedURL = "embedUrl"
  }
}
