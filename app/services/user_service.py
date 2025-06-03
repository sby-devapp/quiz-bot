from app.models.user import User


class UserService:
    def __init__(self):
        print("User service initialized")

    def save(self, user) -> User:
        user_db = User()
        user_db.id = user.id
        user_db.username = user.username
        user_db.first_name = user.first_name
        user_db.last_name = user.last_name
        return user_db.save()
