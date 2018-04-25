package hotels

import grails.validation.ValidationException

class HotelController {

    HotelService hotelService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index() {
        [hotelList: Hotel.list(),
         hotelCount: Hotel.count()]
    }

    def result(String q) {
        def result = Hotel.withCriteria {
            like("name".toLowerCase(), "%${q.toLowerCase()}%")
        }
        [hotelList: result,
         hotelCount: result.size()]
    }

    def show(Long id) {
        [hotel : Hotel.get(id)]
    }

    def create() {
        def hotel = new Hotel(name: params.name, country: params.country, stars: params.stars, url: params.url)
        [hotel: hotel]
    }

    def save(Hotel hotel) {
        hotel.save()

        redirect(action: "show")
    }

    def edit(Long id) {
        respond hotelService.get(id)
    }

    def update(Hotel hotel) {

        try {
            hotelService.save(hotel)
        } catch (ValidationException e) {
            [errors: hotel.errors, view:'edit']
        }

    }

    def delete(Long id) {

        hotelService.delete(id)

        redirect(action:"index")
    }
}
