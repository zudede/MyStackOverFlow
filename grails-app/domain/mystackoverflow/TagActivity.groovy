package mystackoverflow

class TagActivity {
	
	int score 
	
	static belongsTo = [user:User, tag: Tag]
	
    static constraints = {
    }
}
