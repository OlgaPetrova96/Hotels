package hotels

import grails.transaction.Transactional

@Transactional
class HotelService {

    def list() {
        return Hotel.list()
    }

    def count() {
        return Hotel.count()
    }

    def get(Serializable id) {
        return Hotel.get(id)
    }

    def save(Hotel hotel) {
        return hotel.save()
    }

    def delete(Serializable id) {
        Hotel.get(id).delete()
    }
}
