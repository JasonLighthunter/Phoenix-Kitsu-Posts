import PhoenixKitsuCore

public class PostFollow: KitsuObject {
  public static var requestURLString = "post-follows"
  
  public let objectID: String
  public let type: String
  public let links: Links
  public let attributes: PostFollowAttributes?
  
  private enum CodingKeys: String, CodingKey {
    case objectID = "id"
    case type
    case links
    case attributes
  }
}

public class PostFollowAttributes: KitsuObjectAttributesWithTimestamp {
  public let createdAt: String
  public let updatedAt: String
}
