class Gif
  attr_reader :id,
              :slug,
              :url

  def initialize(attributes = {})
    @id       = attributes[:id]
    @slug       = attributes[:slug]
    @url      = attributes[:images][:fixed_width][:url]
  end
end