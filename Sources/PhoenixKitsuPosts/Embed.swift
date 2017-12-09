public class Embed: Decodable {
  public let kind: String?
  public let image: EmbedMedia?
  public let title: String?
  public let video: EmbedMedia?
  public let siteName: String?
  public let description: String?
  public let audio: EmbedMedia?

  private enum CodingKeys: String, CodingKey {
    case kind
    case image
    case title
    case video
    case siteName = "site_name"
    case description
    case audio
  }
}

public class EmbedMedia: Decodable {
  public let url: String?
  public let type: String?
  public let width: String?
  public let height: String?
}
