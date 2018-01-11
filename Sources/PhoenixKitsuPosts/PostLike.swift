import PhoenixKitsuCore
import Requestable

public class PostLike: KitsuObject<PostLikeAttributes>, Requestable {
  public static var requestURLString = "post-likes"
}

public class PostLikeAttributes: KitsuObjectAttributesWithTimestamp {
  public let createdAt: String
  public let updatedAt: String
}
