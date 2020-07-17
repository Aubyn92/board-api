require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  it do
    attributes = attributes_for(:post)
    should_not permit(:title, :description, :image_url, :tag)
      .for(:create, params: {post: attributes})
      .on(:post)
  end
end