class UrlMappings {

	static mappings = {
		"/$controller/$action?/$id?"{
			constraints {
				// apply constraints here
			}
		}

		"/" {
			[controller = "contact", action = "dashboard"]
		}
		"500"(view:'/error')
	}
}
