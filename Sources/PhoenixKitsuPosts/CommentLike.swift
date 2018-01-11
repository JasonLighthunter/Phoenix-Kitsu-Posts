import PhoenixKitsuCore
import Requestable

public class CommentLike: KitsuObject<CommentLikeAttributes>, Requestable {
  public static var requestURLString = "comment-likes"
}

public class CommentLikeAttributes: KitsuObjectAttributesWithTimestamp {
  public let createdAt: String
  public let updatedAt: String
}
