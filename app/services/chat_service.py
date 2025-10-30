from app.models.chat import Chat


class ChatService:
    def __init__(self):
        print("Chat service")

    def save(self, chat) -> Chat:
        chat_db = Chat(
            id=chat.id,
            type=chat.type,
            username=chat.username,
        )
        return chat_db.save()


    
    def get_random_question(self, chat_id):
        return Chat(id=chat_id).get_random_question()
    
    
    def update_sent_question_logs(self, chat_id, question_id ):
        Chat.update_sent_question_logs(chat_id, question_id)
    

    
