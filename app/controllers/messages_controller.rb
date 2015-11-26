class MessagesController < ApplicationController
  before_filter :authenticate_user!

  def create
      @conversation = Conversation.find(params[:conversation_id])
      @message = @conversation.messages.build(message_params)
      @message.user_id = current_user.id
      @message.save!
      @path = conversation_path(@conversation)
      if @message.message_attachment_id
        respond_to do |format|
          format.html { redirect_to :back }
          # I've tried w/ and with no format.js as well.
          #format.js { render: 'create.js.erb }
        end

  private

  def message_params
    params.require(:message).permit(:body)
  end
end
