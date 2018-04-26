package hotels

import grails.validation.ValidationException


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
        [country: new Country()]
    }

    def save(Country country) {
        countryService.save(country)
        redirect(action: "index")
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

        redirect(action: "index")
    }

    def delete(Long id) {

        countryService.delete(id)
        redirect(action: "index")

    }
}
