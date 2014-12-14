class PublicationCreationPolicy
  attr_reader :user, :message

  def initialize(user)
    @user = user
  end

  def check!
    if user.author.blank?
      @message = 'You must create author first'
      return false
    end

    true
  end

end
