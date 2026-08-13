from telegram import InputMediaAnimation, InputMediaPhoto

from app.models.question import Question


class PollView:

    def __init__(self, question: Question):
        self.question = question
        self.prepared = Question()
        self.prepared.description = None
        self.prepared.description_parse_mode = None
        self.prepared.media = None
        self._quiz = None
        self._user = None

    def _load_quiz_user(self):
        if self.question.quiz_id and self._quiz is None:
            self._quiz = self.question.quiz()
            self._user = self._quiz.user() if self._quiz else None

    def clone(self):
        self.prepared.id = self.question.id
        self.prepared.question = self.question.question
        self.prepared.code_block = self.question.code_block
        self.prepared.options = self.question.options[:]
        self.prepared.explanation = self.question.explanation
        self.prepared.media_url = self.question.media_url
        return self

    def build_poll_question(self):
        """poll question field = plain question text only."""
        self.prepared.question = self.question.question
        return self

    def build_description(self):
        """
        description = media (handled separately via media field)
                    + code_block (HTML formatted)
                    + header (quiz title, question id, clickable user)
        """
        self._load_quiz_user()
        parts = []

        if self._quiz and self._user:
                    parts.append(
                        f"[Quiz: {self._quiz.title}] [Q: {self.question.id}]\n"
                        f"Added by: {self._user.profile_link()}\n"
                        f"--------------------------------------------"
                    )

        if self.question.code_block:
            code = (
                self.question.code_block
                .replace("&", "&amp;")
                .replace("<", "&lt;")
                .replace(">", "&gt;")
            )
            parts.append(f"<pre><code>{code}</code></pre>")

        

        if parts:
            self.prepared.description = "\n".join(parts)
            self.prepared.description_parse_mode = "HTML"

        return self

    def build_media(self):
        """Wrap media_url into the appropriate InputMedia type."""
        url = self.question.media_url
        if not url:
            return self
        url_lower = url.lower()
        if any(s in url_lower for s in [".gif", "giphy.com", ".mp4"]):
            self.prepared.media = InputMediaAnimation(media=url)
        elif any(url_lower.endswith(ext) for ext in [".jpg", ".jpeg", ".png", ".webp"]):
            self.prepared.media = InputMediaPhoto(media=url)
        else:
            self.prepared.media = InputMediaAnimation(media=url)
        return self

    def prepare(self):
        return (
            self.clone()
            .build_poll_question()
            .build_description()
            .build_media()
            .prepared
        )
