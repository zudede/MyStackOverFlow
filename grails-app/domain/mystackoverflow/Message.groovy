package mystackoverflow

import java.util.Date;
import java.util.List;

class Message {
	
	String body;
	int rate;
	Date creationDate;
	static hasMany = [comments: Comment]
	static belongsTo = [author:User, topic:Topic]
    static constraints = {
		creationDate nullable: true
		author nullable: true
    }
	Message(){}
	
	public List<Comment> getOrderedComments () {
		return comments.sort{it.creationDate}
	}
	
	
	@Override
	String toString() {
		return ((body ?: ""));
	}
}
