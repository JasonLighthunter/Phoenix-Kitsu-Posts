import PhoenixKitsuCore
import Requestable

public class PostFollow: KitsuObject<PostFollowAttributes>, Requestable {
  public static var requestURLString = "post-follows"
}

public class PostFollowAttributes: KitsuObjectAttributesWithTimestamp {
  public let createdAt: String
  public let updatedAt: String
}
