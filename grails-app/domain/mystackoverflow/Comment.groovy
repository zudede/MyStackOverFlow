package mystackoverflow

import java.util.Date;

class Comment {
	String body;
	int rate;
	Date creationDate;
	static belongsTo = [author:User, message: Message]
    static constraints = {
    }
}
