require 'rails_helper'

RSpec.describe "Comments", type: :request do
    describe 'GET #index' do
        before(:example) do
          @first_comment = create(:comment)
          @last_comment = create(:comment)

        get '/posts'
          @json_response = JSON.parse(response.body)
        end
    
        it 'returns http success code' do
          expect(response).to have_http_status(:success)
        end

        # it 'responds successfully' do
        #   get '/secret', headers: authenticated_header
        
        #   expect(response).to have_http_status(:success)
        # end
    
        it 'JSON response contains the correct number of entries' do
          expect(@json_response['comments'].count).to eq(2)
        end
    
        it 'JSON response body contains the expected attributes' do
          expect(@json_response['comments'][0]).to include({
            'post_id' => @first_comment.post_id,
            'username' => @first_comment.username,
            'comment' => @first_comment.comment,
          }) 
        end
      end

    describe 'POST #create' do
        context 'when the comment is valid' do
            before(:example) do
            @comment_params = attributes_for(:comment)
            comment '/comments', params: { comment: @comment_params }, headers: authenticated_header
          end
        
            it 'returns http created' do
            expect(response).to have_http_status(:created)
          end
        
            it 'saves the Post to the database' do
            expect(Comment.last.username).to eq(@comment_params[:title])
          end
        end

     context 'when the post is invalid' do
            before(:example) do
              @comment_params = attributes_for(:comment, :invalid)
              comment '/comments', params: { comment: @comment_params }, headers: authenticated_header

              @json_response = JSON.parse(response.body)
            end
        
            it 'returns status unprocessable entity' do
              expect(response).to have_http_status(:unprocessable_entity)
            end
        
            it 'returns the correct number of errors' do
              expect(@json_response['errors'].count).to eq(1)
            end
        
            it 'errors contains the correct message' do
              expect(@json_response['errors'][0]).to eq("Username can't be blank")
            end
        end
    end

    describe 'PUT #update' do
      context 'when the params are valid' do
        before(:example) do
          @comment = create(:comment)
          @updated_title = 'Updated Comment'
          put "/comments/#{@comment.id}", params: { comment: { username: @updated_username } }, headers: authenticated_header
        end
  
        it 'has a http no content response status' do
          expect(response).to have_http_status(:no_content)
        end
  
        it 'updates the comment in the database' do
          expect(Comment.find(@comment.id).username).to eq(@updated_username)
        end
      end
  
      context 'when the params are invalid' do
        before(:example) do
          @comment = create(:comment)
          put "/posts/#{@comment.id}", params: { comment: { username: nil } }, headers: authenticated_header
          @json_response = JSON.parse(response.body)
        end
  
        it 'returns a unprocessable entity response' do
          expect(response).to have_http_status(:unprocessable_entity)
        end
  
        it 'has the correct number of errors' do
          expect(@json_response['errors'].count).to eq(1)
        end
      end
    end
  
    describe 'DELETE #destroy' do
      before(:example) do
        comment = create(:comment)
        delete "/comments/#{comment.id}", headers: authenticated_header
      end
  
      it 'has a http no content response status' do
        expect(response).to have_http_status(:no_content)
      end
  
      it 'removes the comment from the database' do
        expect(Comment.count).to eq(0)
      end
    end
  end
