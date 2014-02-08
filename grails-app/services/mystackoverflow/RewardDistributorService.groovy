package mystackoverflow

import grails.transaction.Transactional
import mystackoverflow.User

@Transactional
class RewardDistributorService {

	def updateActivity(User user, Topic topic) {
		for (Tag tag : topic.tags) {
			if (user.tagActivity.get(tag) == null) {
				user.tagActivity.put(tag, 1);
			}
			else {
				++user.tagActivity.get(tag);
			}
			//checkRewards(user, tag)
		}
	}
	
	def checkRewards(User user, Tag tag) {
		checkSimpleReward(user, tag)
		/*switch (tag.name) {
			case "iOs" :
				break;
			case "Android" :
				break;
			case "Php" :
				break;
			case "Java" :
				break;
			case "C++" :
				break;
			case "HTML" :
				break;
			case "UML" :
				break;
			case "Ruby" :
				break;
			case "Pearl" :
				break;
			case "css" :
				break;
			case "web" :
				break;
			case "C#" :
				break;
			case "WPF" :
				break;
			case "Windows Form" :
				break;
		}*/
	}
	
	private checkSimpleReward(User user, Tag tag) {
		if ([10, 20, 30, 50, 100].contains(user.tagActivity.get(tag))) {
			Reward reward = new Reward()
			reward.name = rewardConstructor(tag.name, user.tagActivity[tag]);
			reward.points = 10
			user.rewards.add(reward)
			user.score += reward.points
		}
	}
	
	private String rewardConstructor(String title, int points) {
		String result;
		switch(points) {
			case 10 :
				result = message(code: 'reward.ten.points', args: [title])
				break;
			case 20 :
				result = message(code: 'reward.twenty.points', args: [title])
				break;
			case 30 :
				result = message(code: 'reward.thirty.points', args: [title])
				break;
			case 50 :
				result = message(code: 'reward.fifty.points', args: [title])
				break;
			case 100:
				result = message(code: 'reward.hundred.points', args: [title])
				break;
			
		}
		return result;
	}
	
}
