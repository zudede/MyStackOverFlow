package mystackoverflow

class Tag {
	String name;
	static hasMany = [topics:Topic]
	static belongsTo = Topic
    static constraints = {
    }
	
	@Override
	String toString() {
		return ((name ?: ""));
	}
}
