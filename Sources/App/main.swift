import Vapor
import HTTP
import Foundation

let drop = Droplet()

drop.get("users") { req in
	return try Response(status: Status.unauthorized, json: JSON(node: [
		"errors": [
			[
				"code": 401,
				"id": "unique error id",
				"status": 401,
				"title": "problem with user auth token"
			]
			
		]
		])
	)
}

drop.resource("posts", PostController())

drop.run()
