package mystackoverflow

class Topic {
	String title;
	static hasMany = [tags:Tag, messages : Message]
	static belongsTo = [author:User]
    static constraints = {
    }
	
	@Override
	String toString() {
		return ((title ?: ""));
	}
}
