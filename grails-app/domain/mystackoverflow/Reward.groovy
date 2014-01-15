package mystackoverflow

class Reward {
	String name;
	int points;
	static belongsTo = User
	static hasMany = [users:User]
    static constraints = {
    }
}
