module Gatekeeper
  def restrict_to_admins
    puts "ADMIN? #{current_user&.admin?}"
    raise(ApplicationController::NotAuthorized.new('Not Authorized')) unless current_user&.admin?
  end

  def restrict_to_members
    raise(ApplicationController::NotAuthorized.new('Not Authorized')) unless current_user&.member?
  end
end
