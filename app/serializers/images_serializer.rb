class ImagesSerializer
  include FastJsonapi::ObjectSerializer
  attributes :heading, :content, :subtext, :order, :blog_id
end
