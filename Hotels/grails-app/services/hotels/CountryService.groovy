package hotels

import grails.transaction.Transactional

@Transactional
class CountryService {

    def list() {
        return Country.list()
    }

    def get(Serializable id) {
        return Country.get(id)
    }

    def save(Country country) {
        return country.save()
    }

    def delete(Serializable id) {
        Country.get(id).delete()
    }
}
