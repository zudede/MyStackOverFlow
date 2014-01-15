package mystackoverflow

class Comment {
	String body;
	int rate;
	static belongsTo = [author:User, message: Message]
    static constraints = {
    }
}
