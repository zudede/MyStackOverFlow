package mystackoverflow

import java.util.Date;

class User {
	String name;
	String firstName;
	Date birthday;
	String email;
	String login;
	String passwordHash;
	String pseudo;
	boolean isModerator;
	boolean isAdmin;
	boolean isBlocked;
	int score;
	Map<Tag, Integer> tagActivity = new HashMap<Tag, Integer>();
	static hasMany = [rewards:Reward, topics:Topic, messages:Message, comments:Comment]
	
    static constraints = { 
		name blank: false
		firstName blank: false
		email email:true, blank: false
		login size: 5..15, blank: false, unique: true
		passwordHash blank: false
    }

	@Override
	String toString() {
		return ((pseudo ?: ""));
	}
}
