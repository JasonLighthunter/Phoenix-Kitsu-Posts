import PhoenixKitsuCore

public class PostLike: KitsuObject {
  public static var requestURLString = "post-likes"
  
  public let objectID: String
  public let type: String
  public let links: Links
  public let attributes: PostLikeAttributes?
  
  private enum CodingKeys: String, CodingKey {
    case objectID = "id"
    case type
    case links
    case attributes
  }
}

public class PostLikeAttributes: KitsuObjectAttributesWithTimestamp {
  public let createdAt: String
  public let updatedAt: String
}
