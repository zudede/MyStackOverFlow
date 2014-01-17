package mystackoverflow

import java.util.Date;

class Topic {
	String title;
	String question;
	Date creationDate;
	static hasMany = [tags:Tag, messages : Message]
	static belongsTo = [author:User]
    static constraints = {
		creationDate nullable: true
    }
	
	@Override
	String toString() {
		return ((title ?: ""));
	}
}
