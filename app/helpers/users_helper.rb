module UsersHelper
    def has_avatar?
        current_user.avatar.attached?
    end

end
