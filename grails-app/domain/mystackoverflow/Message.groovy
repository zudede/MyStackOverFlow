package mystackoverflow

import java.util.Date;

class Message {
	
	String body;
	int rate;
	Date creationDate;
	static hasMany = [comments: Comment]
	static belongsTo = [author:User, topic:Topic]
    static constraints = {
    }
	Message(){}
	
	@Override
	String toString() {
		return ((body ?: ""));
	}
}
