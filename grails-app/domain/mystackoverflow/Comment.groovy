package mystackoverflow

import java.util.Date;
import java.util.List;

class Comment {
	String body;
	Date creationDate;
	static belongsTo = [author:User, message: Message]
    static constraints = {
    }
	
	@Override
	String toString() {
		return ((body ?: ""));
	}
}
