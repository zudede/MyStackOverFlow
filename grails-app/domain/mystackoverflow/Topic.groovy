package mystackoverflow

import java.util.Date;

class Topic {
	String title;
	String question;
	int rate;
	Date creationDate;
	static hasMany = [tags:Tag, messages : Message]
	static belongsTo = [author:User]
    static constraints = {
    }
	
	@Override
	String toString() {
		return ((title ?: ""));
	}
}
