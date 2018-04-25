package hotels

import grails.validation.ValidationException

import static org.springframework.http.HttpStatus.*

class CountryController {

    CountryService countryService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index() {
        [countryList: Country.list(),
         countryCount: Country.count()]
    }

    def show(Long id) {
        [country : Country.get(id)]
    }

    def create() {
        [country: new Country(name: params.name, capital: params.capital)]
    }

    def save(Country country) {
        country.save()

        redirect(action: "show")
    }

    def edit(Long id) {
        [country: countryService.get(id)]
    }

    def update(Country country) {

        try {
            countryService.save(country)
        } catch (ValidationException e) {
            [errors: country.errors, view:'edit']
        }
    }

    def delete(Long id) {

        countryService.delete(id)
        redirect(action: "index")

    }
}
