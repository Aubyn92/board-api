require 'rails_helper'

RSpec.describe "Posts", type: :request do
    describe 'GET #index' do
        before(:example) do
          @first_post = create(:post)
          @last_post = create(:post)

          get '/posts'
          @json_response = JSON.parse(response.body)
        end
    
        it 'returns http success code' do
          expect(response).to have_http_status(:success)
        end
    
        it 'JSON response contains the correct number of entries' do
          expect(@json_response['posts'].count).to eq(2)
        end
    
        it 'JSON response body contains the expected attributes' do
          expect(@json_response['posts'][0]).to include({
            'id' => @first_post.id,
            'title' => @first_post.title,
            'description' => @first_post.description,
          }) 
        end
      end

    describe 'POST #create' do
        context 'when the post is valid' do
            before(:example) do
            @post_params = attributes_for(:post)
            post '/posts', params: { post: @post_params }
          end
        
            it 'returns http created' do
            expect(response).to have_http_status(:created)
          end
        
            it 'saves the Post to the database' do
            expect(Post.last.title).to eq(@post_params[:title])
          end
        end

     context 'when the post is invalid' do
            before(:example) do
              @post_params = attributes_for(:post, :invalid)
              post '/posts', params: { post: @post_params }
              @json_response = JSON.parse(response.body)
            end
        
            it 'returns status unprocessable entity' do
              expect(response).to have_http_status(:unprocessable_entity)
            end
        
            it 'returns the correct number of errors' do
              expect(@json_response['errors'].count).to eq(2)
            end
        
            it 'errors contains the correct message' do
              expect(@json_response['errors'][0]).to eq("Title can't be blank")
            end
        end
    end
end
