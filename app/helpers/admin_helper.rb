module AdminHelper
  
  def whoApproved(user)
    @approved = user.admin
    return @approved
  end
end
