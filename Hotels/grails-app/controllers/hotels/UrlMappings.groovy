package hotels

class UrlMappings {

    static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }

        "/"(view:"/index")
        "/index"(view:"/index")
        "/error"(view:'/error')
        "/notFound"(view:'/notFound')

    }
}
