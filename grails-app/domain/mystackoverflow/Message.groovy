package mystackoverflow

import java.util.Date;
import java.util.List;

class Message {
	
	String body;
	int rate;
	Date creationDate;
	static hasMany = [comments: Comment, votingUsers: Long]
	static belongsTo = [author:User, topic:Topic]
    static constraints = {
		creationDate nullable: true
		author nullable: true
    }
	static mapping = {
		body type: 'text'
	}
	
	public Message(){
	}
	
	public List<Comment> getOrderedComments () {
		return comments.sort{it.creationDate}
	}
	
	public void registerCurrentUserVote(long userId) {
		votingUsers.add(userId)
	}
	
	public boolean isNotVotedByCurrentUser(long userId) {
		return (!(votingUsers?.contains(userId)))
	}
	
	@Override
	String toString() {
		return ((body ?: ""));
	}
}
