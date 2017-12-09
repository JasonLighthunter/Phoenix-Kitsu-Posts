import PhoenixKitsuCore

public class CommentLike: KitsuObject {
  public static var requestURLString = "comment-likes"

  public let objectID: String
  public let type: String
  public let links: Links
  public let attributes: CommentLikeAttributes?

  private enum CodingKeys: String, CodingKey {
    case objectID = "id"
    case type
    case links
    case attributes
  }
}

public class CommentLikeAttributes: KitsuObjectAttributesWithTimestamp {
  public let createdAt: String
  public let updatedAt: String
}
