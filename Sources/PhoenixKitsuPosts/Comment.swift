import PhoenixKitsuCore
import Requestable

public class Comment: KitsuObject<CommentAttributes>, Requestable {
  public static var requestURLString = "comments"
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
