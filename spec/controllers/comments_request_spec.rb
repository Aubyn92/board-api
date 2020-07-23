require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  it do
    attributes = attributes_for(:comment)
    should permit(:username, :post_id, :comment)
      .for(:create, params: {comment: attributes})
      .on(:comment)
  end
end