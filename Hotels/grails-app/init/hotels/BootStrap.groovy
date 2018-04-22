package hotels

class BootStrap {

    def init = { servletContext ->
        def Russia = new Country(name: "Россия", capital: "Москва").save()
        def France = new Country(name: "Франция", capital: "Париж").save()

        def Hotel3 = new Hotel(name: "Отель 3", country: Russia, stars: 4, url: "http://site3.ru").save()
        def Hotel2 = new Hotel(name: "Отель 2", country: France, stars: 5, url: "http://site2.ru").save()
        def Hotel1 = new Hotel(name: "Отель 1", country: Russia, stars: 4, url: "http://site.ru").save()
    }
    def destroy = {

    }
}
