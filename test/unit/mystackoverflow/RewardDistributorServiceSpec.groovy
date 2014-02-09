package mystackoverflow

import javax.validation.constraints.AssertTrue;

import grails.test.mixin.TestFor
import spock.lang.Specification

/**
 * See the API for {@link grails.test.mixin.services.ServiceUnitTestMixin} for usage instructions
 */
@TestFor(RewardDistributorService)
class RewardDistributorServiceSpec extends Specification {
	def rewardDistributorService
	
    def setup() {
    }

    def cleanup() {
    }

    void "test something"() {
		User user = new User()
		Topic topic = new Topic()
		Tag tag = new Tag()
		tag.name = "Java"
		topic.tags.add(tag)
		
		for (int i = 0; i < 10; ++i)
			rewardDistributorService.updateActivity(user, topic);
			
		AssertTrue(user.rewards.size()==1)
		AssertTrue(user.score==10)
		
    }
}
