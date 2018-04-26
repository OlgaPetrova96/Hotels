package hotels

import grails.validation.ValidationException

import static org.springframework.http.HttpStatus.CREATED
import static org.springframework.http.HttpStatus.OK

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

        try {
            hotelService.save(hotel)
        } catch (ValidationException e) {
            [errors: hotel.errors, view:'create']
            return
        }

//        request.withFormat {
//            form multipartForm {
//                flash.message = message(code: 'default.created.message', args: [message(code: 'hotel.label', default: 'Hotel'), hotel.id])
//                redirect(action: "show", id: hotel.id)
//            }
//            '*' { [hotel: hotel, status: CREATED] }
//        }
        redirect(action: "index")
    }

    def edit(Long id) {
        [hotel: hotelService.get(id)]
    }

    def update(Hotel hotel) {

        try {
            hotelService.save(hotel)
        } catch (ValidationException e) {
            [errors: hotel.errors, view:'edit']
            return
        }

//        request.withFormat {
//            form multipartForm {
//                flash.message = message(code: 'default.updated.message', args: [message(code: 'hotel.label', default: 'Hotel'), hotel.id])
//                redirect(action: "show", id: hotel.id)
//            }
//            '*'{ [hotel: hotel, status: OK] }
//        }
        redirect(action: "index")
    }

    def delete(Long id) {

        hotelService.delete(id)

        redirect(action:"index")
    }
}
