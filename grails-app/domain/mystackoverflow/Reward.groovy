package mystackoverflow

class Reward {
	def rewardDistributorService
	String name;
	int points;
	static belongsTo = User
	static hasMany = [users:User]
    static constraints = {
    }
	
	@Override
	String toString() {
		return  ((name ?: ""))
	}
}
