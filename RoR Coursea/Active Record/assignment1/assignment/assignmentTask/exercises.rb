require_relative '../config/environment'
class Exercises

    def create_user(user_params = {})
            User.create(user_params)
    end

    def find_allusers(offset, limit)
        User.all.order(updated_at: :desc).offset(offset).limit(limit)
    end

    def find_user_byname(name)
        User.find_by(username: name)
    end

    def get_user_byid(id)
        User.find(id) 
    end

    def update_password(id, password_digest)
        User.find(id).update(password_digest: password_digest)
    end

    def delete_user(id)
        User.delete(id)
        return 
    end
end
