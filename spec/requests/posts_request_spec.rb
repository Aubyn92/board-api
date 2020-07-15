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
            post '/posts', params: { post: @post_params }, headers: authenticated_header
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
              post '/posts', params: { post: @post_params }, headers: authenticated_header

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

    describe 'PUT #update' do
      context 'when the params are valid' do
        before(:example) do
          @post = create(:post)
          @updated_title = 'Updated Post'
          put "/posts/#{@post.id}", params: { post: { title: @updated_title } }, headers: authenticated_header
        end
  
        it 'has a http no content response status' do
          expect(response).to have_http_status(:no_content)
        end
  
        it 'updates the post in the database' do
          expect(Post.find(@post.id).title).to eq(@updated_title)
        end
      end
  
      context 'when the params are invalid' do
        before(:example) do
          @post = create(:post)
          put "/posts/#{@post.id}", params: { post: { title: nil } }, headers: authenticated_header
          @json_response = JSON.parse(response.body)
        end
  
        it 'returns a unprocessable entity response' do
          expect(response).to have_http_status(:unprocessable_entity)
        end
  
        it 'has the correct number of errors' do
          expect(@json_response['errors'].count).to eq(2)
        end
      end
    end
  
    describe 'DELETE #destroy' do
      before(:example) do
        post = create(:post)
        delete "/posts/#{post.id}", headers: authenticated_header
      end
  
      it 'has a http no content response status' do
        expect(response).to have_http_status(:no_content)
      end
  
      it 'removes the post from the database' do
        expect(Post.count).to eq(0)
      end
    end
  end
