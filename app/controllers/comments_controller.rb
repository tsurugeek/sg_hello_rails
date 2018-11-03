class CommentsController < ApplicationController
  before_action :set_comment, only: [:approve, :destroy]
  before_action :set_entry

  # POST /blogs/1/entries/1/comments
  # POST /blogs/1/entries/1/comments.json
  def create
    @comment = Comment.new(comment_params)
    @comment.entry_id = params[:entry_id]
    @comment.status = 'unapproved'

    respond_to do |format|
      if @comment.save
        AdminMailer.with(comment: @comment).create_comment_email.deliver_later
        format.html { redirect_to [@comment.entry.blog, @comment.entry], notice: 'Comment was successfully created.' }
        format.json { render :show, status: :created, location: [@comment.entry.blog, @comment.entry] }
      else
        format.html { render :new }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  def approve
    respond_to do |format|
      if @comment.update({status: 'approved'})
        format.html { redirect_to [@comment.entry.blog, @comment.entry], notice: 'Comment was successfully updated.' }
        format.json { render :show, status: :ok, location: [@comment.entry.blog, @comment.entry] }
      else
        format.html { render :edit }
        format.json { render json: @entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /blogs/1/entries/1/comments/1
  # DELETE /blogs/1/entries/1/comments/1.json
  def destroy
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to [@comment.entry.blog, @comment.entry], notice: 'Comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.eager_load(entry: :blog).where(comments: {entry_id: params[:entry_id]}, entries: {blog_id: params[:blog_id]}).find(params[:id])
    end

    def set_entry
      @entry = Entry.eager_load(:blog).where(entries: {blog_id: params[:blog_id]}).find(params[:entry_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:body)
    end
end
