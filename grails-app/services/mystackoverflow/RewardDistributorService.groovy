package mystackoverflow

import java.net.Authenticator.RequestorType;

import grails.transaction.Transactional
import mystackoverflow.User


@Transactional
class RewardDistributorService {

	def messageSource
	def updateActivity(User user, Topic topic) {
		for (Tag tag : topic.tags) {
			TagActivity ta = TagActivity.findByUserAndTag(user, tag)
			if (ta == null) {
				log.info String.format("First message of %s for %s tag", user, tag)
				ta =  new TagActivity()
				ta.user = user;
				ta.tag = tag;
				ta.score = 1;
			}
			else {
				++ta.score;
			}
			ta.save(flush:true);
			checkRewards(ta)
		}
		user.save(flush:true)
	}
	
	private checkRewards(TagActivity ta) {
		if ([10, 20, 30, 50, 100].contains(ta.score)) {
			Reward reward = new Reward()
			reward.name = rewardNameConstructor(ta);
			reward.points = ta.score
			log.info String.format("Creation of %s reward", reward)
			ta.user.rewards.add(reward)
			ta.user.score += 10
		}
	}
	
	private String rewardNameConstructor(TagActivity ta) {
		String result;
		switch(ta.score) {
			case 10 :
				result = "Jar-Jar-Binks " + ta.tag.name;
				break;
			case 20 :
				result = "Padawan " + ta.tag.name;
				break;
			case 30 :
				result = "Jedi " + ta.tag.name;
				break;
			case 50 :
				result = "Obi-Wan " + ta.tag.name;
				break;
			case 100:
				result = "Yoda " + ta.tag.name;
				break;
			
		}
		return result;
	}
	
}
