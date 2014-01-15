package mystackoverflow

class Message {
	
	String body;
	int rate;
	static hasMany = [comments: Comment]
	static belongsTo = [author:User, topic:Topic]
    static constraints = {
    }
	Message(){}
}
