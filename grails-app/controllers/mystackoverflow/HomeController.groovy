package mystackoverflow

class HomeController {

	static mappings = {
		"/" (controller:'home', action:'index')
	}
	
    def index(Integer max) { 
		params.max = Math.min(max ?: 10, 100)
		respond Topic.list(params), model:[topicInstanceCount: Topic.count()]
	}
}
